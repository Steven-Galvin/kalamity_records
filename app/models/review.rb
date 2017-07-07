class Review < ApplicationRecord
  belongs_to :user
  belongs_to :record

  validates :content, presence: true, length: { in: 3..250 }
end
