class Record < ApplicationRecord
  has_many :reviews

  validates :artist, :title, :price, :description, :genre, :album_length, presence: true
  validates :artist, :title, :genre, length: { in: 3..25 }
  validates :description, length: { maximum: 500 }

  scope :most_reviewed, -> {(
    select("records.id, records.artist, records.title, records.price, records.description, records.genre, records.album_length, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("records.id")
    .order("reviews_count DESC")
    .limit(5)
    )}

end
