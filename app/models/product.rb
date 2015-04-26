class Product < ActiveRecord::Base

  validates :title, :description, :image_url, :presence =>  true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title, :uniqueness => true
  # validates :image_url, :format => {
  #                         :with => %r{.(\Agif|jpg|png\z)$}i,
  #                         :message => 'must be a URL for GIF, JPG or PNG image.'
  #                     }
end
