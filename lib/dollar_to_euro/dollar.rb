class Dollar
  include Mongoid::Document
  field :date, type: Date
  field :value, type: Float
end