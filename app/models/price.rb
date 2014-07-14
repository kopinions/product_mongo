class Price
  include Mongoid::Document
  field :amount, type: Float
  embedded_in :product
end
