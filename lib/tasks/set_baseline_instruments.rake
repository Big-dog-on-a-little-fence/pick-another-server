namespace :instruments do

  desc "adds tunes to instrument"
  task :add_tunes_to_instrument, [:email] => [:environment] do |task, args|
    user = User.find_by_email(args[:email])
    instrument = user.instruments.first
    if user && instrument
      count = 0
      user.tunes.each do |tune|
        unless instrument.tunes.include?(tune)
          instrument.tunes << tune
          count += 1
        end
      end
      puts "#{count} tunes added to #{user.username}'s #{instrument.type}"
    else
      puts "user or instrument does not exist"
    end
  end

end
