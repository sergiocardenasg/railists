class Artist < ApplicationRecord
    has_many :songs
    has_many :genres, through: :songs

    validates :name, presence: true, uniqueness: true
    scope :ordered_by_name, -> { order(name: :asc) }

end
