class Price
  include Mongoid::Document
  field :date, type: Date
  field :total, type: String
end
