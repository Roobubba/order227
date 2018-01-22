class Picture < ActiveRecord::Base

  has_many :shows, inverse_of: :picture, dependent: :destroy
  has_many :posts, inverse_of: :picture, autosave: true
  
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

  private
    def picture_size
      if picture.size > 10.megabytes
        errors.add(:picture, "should be less than 10MB")
      end
    end
    
end