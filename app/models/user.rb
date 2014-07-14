class User
  include Mongoid::Document
  has_many :orders
  field :name, type: String
end
