class User < ActiveRecord::Base
  
  before_save { self.email = email.downcase }
  validates :username, presence: true, length: { minimum: 3, maximum: 25 },
                                    uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105 },
                                    uniqueness: { case_sensitive: false },
                                    format: {with: VALID_EMAIL_REGEX }
  has_secure_password 
  
  def self.email_list
    list = String.new
    list << "REMEMBER - ONLY USE THESE ADDRESSES IN THE BCC FIELD!\nDO NOT PASTE INTO TO: or CC: FIELDS!\n\n"
    User.all.each do |user|
      list << user.email + ",\n"
    end
    list
  end

end