class Product < ActiveRecord::Base
  belongs_to :user
  mount_uploader :product_image, AvatarUploader
end
