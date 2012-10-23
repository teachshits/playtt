class Place < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :address, :city, :name, :description
  validates :address, :city, :name, :description, :presence => true
  has_many :meetings
end
