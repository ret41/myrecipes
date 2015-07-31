class Chef < ActiveRecord::Base
  has_many :recipes                                       #code that creates one to many association to recipes
  before_save { self.email = email.downcase}              #everytime a chef object is created in memory, the chef email will be changed to downcase and then stored in memory.
  validates :chefname, presence: true, length: { minimum: 3, maximum: 40 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105 },
                                    uniqueness: { case_sensitive: false },    #checks for uniqueness, no case sensitivity
                                    format: { with: VALID_EMAIL_REGEX }
end