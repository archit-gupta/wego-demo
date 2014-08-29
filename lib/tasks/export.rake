namespace :export do
  desc "TODO"
  task :csv => :environment do
    spredsheet = Roo::Excelx.new("#{Rails.root}/public/airport.xlsx", nil, :ignore)
    header = [0,1]
    (2..spredsheet.last_row).each do |i|
      row = Hash[[header,spredsheet.row(i)].transpose]
     Airport.create(:name => row[0], :code => row[1])
    end
    
  end
end
