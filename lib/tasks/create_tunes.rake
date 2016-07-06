require 'csv'    

namespace :db do
  
  task :create_tunes => :environment do
    csv_text = File.read(Rails.root + "app/csv/seedtunes.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Tune.first_or_create!(row.to_hash)
    end  
  end
  
end

