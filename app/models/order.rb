class Order
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  belongs_to :user
  embeds_many :order_items
end
