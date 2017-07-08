class Record < ApplicationRecord
  has_many :reviews

  validates :artist, :title, :price, :description, :genre, :album_length, presence: true
  validates :artist, :title, :genre, length: { in: 3..25 }
  validates :description, length: { maximum: 500 }
end
