require 'csv'    

namespace :db do

  task :create_tunes => :environment do
    csv_text = File.read(Rails.root + "app/csv/seedtunes.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Tune.where(row.to_hash).first_or_create
    end
  end
  
end

