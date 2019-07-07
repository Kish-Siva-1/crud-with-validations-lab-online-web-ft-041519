class Song < ApplicationRecord
  validates :title, presence: true
  validates_uniqueness_of :artist_name, scope: :release_year
  validates :release_year, presence: true, if: :released
  validate :date_limit
  validates :artist_name, presence: true

  private

  def date_limit

    if !release_year
      red = 0
    else
      red = release_year
    end

    if red > Time.new.year
      errors.add(:date_limit, "can't be released in the future")
    end

  end

end
