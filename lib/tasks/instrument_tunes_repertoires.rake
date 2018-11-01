namespace :instrument_tunes_repertoires do
  desc "populate repertoire references for existing instrument tunes"
  task add_repertoire_refs: :environment do
    count = 0
    # find appropraite repertoire (via associated user and tune) and add to each instrument_tune
    InstrumentTune.all.each do |instrument_tune|
      user = instrument_tune.instrument.user
      tune = instrument_tune.tune
      repertoire = Repertoire.where(user: user, tune: tune)
      if repertoire.size > 1
        puts "Skipping instrument_tune #{instrument_tune.id}." \
             " There's more than 1 repertoire associated with" \
             " user #{user.id} and tune #{tune.id}."
      else
        instrument_tune.repertoire = repertoire.take # take first and only repertoire
        instrument_tune.save!
        count += 1
      end
    end
    puts "Updated repertoire for #{count} instrument_tunes"
  end
end
