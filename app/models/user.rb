class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save :ensure_authentication_token

  has_many :instruments
  has_many :instrument_tunes, -> { order("id DESC") }, through: :instruments
  has_many :tunes, -> { order("id DESC").distinct }, through: :instrument_tunes
  has_many :user_starred_tunes
  has_many :starred_tunes, through: :user_starred_tunes, source: :tune
  has_many :articles, dependent: :destroy
  has_many :jam_users
  has_many :jams, through: :jam_users
  has_many :comments
  
  has_one :accordion
  has_one :banjo
  has_one :bass
  has_one :cello
  has_one :clarinet
  has_one :guitar
  has_one :mandolin
  has_one :piano
  has_one :saxophone
  has_one :trombone
  has_one :violin
  has_one :voice  
  
  # delegate :banjos, :basses, :cellos, :guitars, :mandolins, :violins, :voices, to: :instruments

  # scope :starts_with, -> (username) { where("username like ?", "#{username}%")}

  attr_accessor :login

  # Only allow letter, number, underscore and punctuation.
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  validates :username, :presence => true, :uniqueness => {:case_sensitive => false}

  ## add for devise username modification
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_hash).first
    end
  end

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  def instrument_ids
    self.instruments.map {|instrument| instrument.id}
  end

  def unique_tunes
    tune_includes = [:users, :users_that_have_starred, :lyric, :charts, :genres,
                    :sources, :instruments]
    user_tunes = []
    self.instruments.each do |instrument|
      user_tunes += instrument.tunes.includes(tune_includes)
    end
    user_tunes.uniq!
  end

  def instrument_tunes
    InstrumentTune.where(instrument: self.instruments)
  end

  def instrument_tunes_for_tune(tune)
    InstrumentTune.where(instrument: self.instruments, tune: tune)
  end

  private

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end
end
