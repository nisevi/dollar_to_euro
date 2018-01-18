##
# Mongoid by default stores documents in a collection that is the pluralized
# form of the class name. For the following Dollar class, the collection the
# document would get stored in would be named dollars.

class Dollar
  include Mongoid::Document
  field :date, type: Date
  field :value, type: Float
end