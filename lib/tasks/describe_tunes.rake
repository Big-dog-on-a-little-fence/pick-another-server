require 'csv'    

namespace :repetoire do

  task :add_users_to_tunes => :environment do
    usernames = ['SammyJ', 'benbruno', 'Jer', 'SammyN', 'Scott']
    csv_text = File.read(Rails.root + "app/csv/tunes_users.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      @tune = Tune.find_by name: row['name']
      unless @tune == nil
        usernames.each do |un|
          @user = User.find_by username: un
          if row[un] == 'y'
            @user.tunes << @tune unless @user.tunes.include?(@tune)
          end
        end
      end
    end
  end
  
end