class Event < ApplicationRecord
  has_many :users
  has_many :posts
  has_many :likes, as: :likable
end
