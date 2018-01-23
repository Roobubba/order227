class Picture < ActiveRecord::Base

  has_many :shows, dependent: :destroy
  has_many :posts
  
  before_validation(on: :create) do
    if self.picture?
      self.pic_sha1 = Digest::SHA1.file(picture.path).hexdigest
    end
  end

  default_scope { order('updated_at DESC') }
  mount_uploader :picture, PictureUploader
  before_save :set_alt_text
  
  validates_with PictureValidator
  validates :picture, presence: true
  validate :picture_size
  
  def set_alt_text
    if self.alt_text.empty?
      self.alt_text = File.basename(self.picture.path).split(".").first
    end
  end

  def destroy
    posts = self.posts
    posts.each do |po|
      po.picture_id = nil
      po.picture_url = nil
      po.save
    end
    super
  end
  

  private
    def picture_size
      if picture.size > 10.megabytes
        errors.add(:picture, "should be less than 10MB")
      end
    end
    
end