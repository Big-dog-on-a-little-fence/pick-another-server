namespace :repertoire_timestamps do
  desc "TODO"
  task populate_nil_timestamps: :environment do
    count = 0
    Repertoire.all.each do |repertoire|
      if repertoire.created_at.nil?
        repertoire.created_at = DateTime.now
        repertoire.updated_at = DateTime.now
        repertoire.save!
        count += 1
      end
    end
    puts "Updated timestamps for #{count} repertoires"
  end

end
