class Record < ApplicationRecord
  has_many :reviews

  validates :title, :price, :description, :genre, :album_length, presence: true
end
