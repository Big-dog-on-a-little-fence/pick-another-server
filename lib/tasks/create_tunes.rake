require 'csv'    

namespace :db do

  task :create_tunes => :environment do
    csv_text = File.read(Rails.root + "app/csv/seedtunes.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      @tune = Tune.where(row.to_hash.slice(:name, :key)).first_or_create
      genre = Genre.find_by name: row['genre']
      unless (@tune.genres.include?(genre)) or (@tune.nil?) or (genre.nil?)
        @tune.genres << genre
      end
    end
  end
  
end