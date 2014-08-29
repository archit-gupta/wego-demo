class Airport < ActiveRecord::Base
  def show_code
    "#{self.name} - #{self.code}"
  end
end
