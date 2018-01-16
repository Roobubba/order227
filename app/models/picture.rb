class Picture < ActiveRecord::Base

  mount_uploader :picture, PictureUploader

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