# frozen_string_literal: true

##
# Mongoid by default stores documents in a collection that is the pluralized
# form of the class name. For the following CsvHash class, the collection the
# document would get stored in would be named csv_hashes.
class CsvHash
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  store_in collection: 'csv_hashes'

  field :digest, type: String
end