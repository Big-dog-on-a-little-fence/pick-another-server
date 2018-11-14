# Decided to do this after all

namespace :instrument_repertoires do
  desc "create instrument_repertoires table and from instrument_tunes"
  task create_from_instrument_tunes: :environment do
    count = 0
    # find appropriate repertoire (via associated user and tune) and add to each instrument_repertoire
    instrument_tunes = InstrumentTune.all
    puts "Creating instrument_repertoires from #{instrument_tunes.size} instrument_tunes"
    instrument_tunes.each do |instrument_tune|
      puts "."
      instrument = instrument_tune.instrument
      user = instrument.user
      tune = instrument_tune.tune
      repertoire = Repertoire.where(user: user, tune: tune)
      if repertoire.size > 1
        puts "Skipping instrument_tune #{instrument_tune.id}." \
            " There's more than 1 repertoire associated with" \
            " user #{user.id} and tune #{tune.id}."
      else
        InstrumentRepertoire.create(instrument: instrument, repertoire: repertoire.take)
        count += 1
      end
    end
    puts "Created #{count} instrument_repertoires from #{instrument_tunes.size} instrument_tunes"
  end

end
