class User < ActiveRecord::Base
  

  before_create { generate_token(:confirm_token) }
  
  before_save { self.email = email.downcase }
  
  validates :username, presence: true, length: { minimum: 3, maximum: 25 },
                                    uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105 },
                                    uniqueness: { case_sensitive: false },
                                    format: {with: VALID_EMAIL_REGEX }
  validate :email_not_changed

  has_secure_password 
  
  def self.email_list
    list = String.new
    list << "REMEMBER - ONLY USE THESE ADDRESSES IN THE BCC FIELD!\nDO NOT PASTE INTO TO: or CC: FIELDS!\n\n"
    User.all.each do |user|
      list << user.email + ",\n"
    end
    list
  end
  
  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
    UserMailer.welcome_message(self).deliver_now
  end
  
  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver_now
  end

  def updated_password
    self.password_reset_token = nil
    self.password_reset_sent_at = nil
    save!(:validate => false)
  end

  private
    def generate_token(column)
      begin
        self[column] = SecureRandom.urlsafe_base64.to_s
      end while User.exists?(column => self[column])
    end
    
    def email_not_changed
      if self.email_changed? && self.persisted?
        errors.add(:email, "Change of email not allowed. Unsubscribe and resubscribe instead.")
      end
    end


end