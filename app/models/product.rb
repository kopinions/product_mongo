class Product
  include Mongoid::Document
  field :name, type: String
  embeds_one :price
end
