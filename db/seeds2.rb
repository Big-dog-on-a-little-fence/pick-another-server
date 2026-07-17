# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

User.create([
  { username: 'SammyN', email: 'sammy.nave@gmail.com', password: 'password', authentication_token: '1232' },
  { username: 'esjay', email: 'sjbrunster@gmail.com', password: 'password', authentication_token: '1233' },
  { username: 'benbruno', email: 'ohschnap@gmail.com', password: 'password', authentication_token: '1234' },
  { username: 'Jer', email: 'jeremy.bohn@gmail.com', password: 'password', 'authentication_token': '1235' },
  { username: 'Scott', email: 'scottminkin@gmail.com', password: 'password', 'authentication_token': '1236' },
  { username: 'Dave', email: 'emceeguertin@gmail.com', password: 'password', 'authentication_token': '1237' }
])

Genre.create([
  { name: 'Bluegrass' },
  { name: 'Old-time' },
  { name: 'Irish' },
  { name: 'Scottish' },
  { name: 'Texas Swing' },
  { name: 'Ragtime' },
  { name: 'Gypsy Jazz' },
  { name: 'Country' },
  { name: 'Folk' },
  { name: 'Classical' },
  { name: 'Cajun' },
  { name: 'Venezuelan' }
])

# add tunes to db
csv_tunes = File.read("#{Rails.root}/db/csv/seedtunes.csv")
tunes = CSV.parse(csv_tunes, headers: true)
tunes.each do |row|
  tune = Tune.where(row.to_hash.slice('name', 'key', 'time_signature')).first_or_create
  genre = Genre.find_by(name: row['genre'])
  next if (tune.genres.include?(genre)) || (tune.nil?) || (genre.nil?)

  tune.genres << genre
end

# add tunes to users
usernames = User.all.map(&:username)
csv_tunes_users = File.read("#{Rails.root}/db/csv/tunes_users.csv")
tunes_users = CSV.parse(csv_tunes_users, headers: true)
tunes_users.each do |row|
  tune = Tune.find_by(name: row['name'])
  next if tune.nil?

  usernames.each do |un|
    user = User.find_by username: un
    if (row[un] == 'y') && user.tunes.exclude?(tune)
      user.tunes << tune
    end
  end
end
