class Flight < ActiveRecord::Base
  validates_presence_of :origin_airport, :destination_airport
end
