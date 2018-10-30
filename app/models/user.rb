class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save :ensure_authentication_token

  has_many :articles, dependent: :destroy
  has_many :repertoires, -> { order(id: :desc) }
  has_many :tunes, through: :repertoires
  has_many :user_starred_tunes
  has_many :starred_tunes, through: :user_starred_tunes, source: :tune
  has_many :jam_users
  has_many :jams, through: :jam_users
  has_many :comments
  
  has_many :instruments
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

  scope :starts_with, -> (username) { where("username like ?", "#{username}%")}

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

  private

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end
end
