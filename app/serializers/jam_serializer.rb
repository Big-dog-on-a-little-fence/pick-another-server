class JamSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :users
  has_many :tunes
end
