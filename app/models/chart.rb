class Chart < ApplicationRecord
  belongs_to :tune
  has_many :progressions, :dependent => :destroy
  
  accepts_nested_attributes_for :progressions, allow_destroy: true #reject_if: proc { |attributes| attributes[:chord_list].blank? }
  # attr_accessible :progressions_attributes

  validate :require_at_least_one_progression

  private

    def require_at_least_one_progression
      errors.add(:base, "You must provide at least one chord progression") if progressions.size < 1
    end

end
