class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  validates :title, presence: true
  has_many :items

  def to_param
    "#{title}".parameterize
  end

end
