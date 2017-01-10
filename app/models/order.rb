class Order < ApplicationRecord
  belongs_to :user

  # attr_reader :data
  #
  # # def initialize(initial_contents)
  # #   @data = initial_contents || Hash.new
  # # end
  #
  # def add_items(cart_items)
  #   data.merge!(cart_items)
  # end

end
