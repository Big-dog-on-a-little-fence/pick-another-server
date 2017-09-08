class Measure < ApplicationRecord
  default_scope { order(created_at: :asc) }
  belongs_to :progression
end
