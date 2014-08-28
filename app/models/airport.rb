class Airport < ActiveRecord::Base
  def show_code
    "#{self.name} - <b>#{self.code}</b>"
  end
end
