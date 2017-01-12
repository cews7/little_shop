class Order < ApplicationRecord
  attr_accessor :name_2,
                :address,
                :city,
                :state,
                :postal_code,
              :country

  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items
  belongs_to :info

  enum status: ["Ordered", "Paid","Completed", "Canceled"]
end
