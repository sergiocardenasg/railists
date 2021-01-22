class Genre < ApplicationRecord
    has_many :songs
    has_many :artists, through: :songs

    validates :name, presence: true, uniqueness: true
    scope :ordered_by_name, -> { order(name: :asc) }

end
