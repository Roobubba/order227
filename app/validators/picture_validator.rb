class PictureValidator < ActiveModel::Validator
  def validate(picture)
    picture.errors.add(:picture, 'already exists') if picture.class.exists?(pic_sha1: picture.pic_sha1)
  end
end