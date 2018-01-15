class Dollar
  include Mongoid::Document
  field :date, type: String
  field :value, type: Float
end