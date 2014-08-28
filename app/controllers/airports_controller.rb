class AirportsController < ApplicationController
  autocomplete :name, :full => true, :extra_data => [:code]
end
