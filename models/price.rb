class Price
  include Mongoid::Document
  field :date, type: Date
  field :total, type: String
  field :value, type: Integer
end
