class Picture < ActiveRecord::Base

  has_many :shows, dependent: :destroy
  has_many :posts
  
  default_scope { order('updated_at DESC') }
  
  
  mount_uploader :picture, PictureUploader
  
  before_save :set_alt_text
  
  def set_alt_text
    if self.alt_text.empty?
      self.alt_text = File.basename(self.picture.path).split(".").first
    end
  end
  
  validates :picture, presence: true
  validate :picture_size
  default_scope -> { order(updated_at: :desc) }

  
  private
    def picture_size
      if picture.size > 10.megabytes
        errors.add(:picture, "should be less than 10MB")
      end
    end
    
end