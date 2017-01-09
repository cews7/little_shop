class Category < ApplicationRecord
  validates :title, presence: true
  has_many :items


  def to_param
    title.parameterize
  end
  
end
