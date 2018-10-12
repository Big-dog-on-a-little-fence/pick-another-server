namespace :instrument_tunes_timestamps do
  desc "populate timestamps for every instrument instrument instrument_tunes"
  task populate_nil_timestamps: :environment do
    count = 0
    Instrument.all.each do |instrument|
      instrument.instrument_tunes.each do |instrument_tune|
        if instrument_tune.created_at.nil?
          instrument_tune.created_at = DateTime.now
          instrument_tune.updated_at = DateTime.now
          instrument_tune.save!
        end
      end
    end
    puts "Updated timestamps for #{count} instrument_tunes"
  end
end
