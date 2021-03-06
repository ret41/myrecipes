class Recipe < ActiveRecord::Base
  belongs_to :chef                                      #creates belongs_to association with chef model. Chef(one) singular, recipes(many) plural.
  validates :chef_id, presence: true                    #enforces chef_id to be present in order for validation to be true
  validates :name, presence: true, length: { minimum: 5, maximum: 100 }
  validates :summary, presence: true, length: { minimum: 10, maximum: 150 }
  validates :description, presence: true, length: { minimum: 20, maximum: 500 }
  mount_uploader :picture, PictureUploader #PictureUploader is rails convention. Corresponds to picture_uploader file
  validate :picture_size
  
  
  private
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end#end if
    end

end