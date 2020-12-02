class Song < ApplicationRecord
    validates :title, presence: true
    validates :released, inclusion: { in: [true, false] }
    validates :release_year, presence: true, if: :released
    validates :release_year, numericality: { less_than: Date.today.year }, if: :released
    validates :title, uniqueness: { scope: [:release_year, :artist_name] }

end
