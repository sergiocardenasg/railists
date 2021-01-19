class Genre < ApplicationRecord
    has_many :songs
    has_many :artists, through: :songs

    validates :name, presence: true, uniqueness: true

end
