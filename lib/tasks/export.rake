namespace :export do
  desc "TODO"
  task :csv => :environment do
    require 'spreadsheet'

    debugger
    book = Spreadsheet.open 'airport.xlsx'
    sheet1 = book.worksheet 0

    sheet1.each do |row|
      debugger
      # do something interesting with a row
    end
  end
end
