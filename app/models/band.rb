class Band < ActiveRecord::Base

  validates :name, presence: true, length: { minimum: 1, maximum: 35 }

end