class Tuning < ApplicationRecord
    enum instrument_type: { active: 0, archived: 1 }
end
