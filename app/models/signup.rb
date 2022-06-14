class Signup < ApplicationRecord
    belongs_to :camper
    belongs_to :activity

    validates :time, inclusion: {within: 0..23}
end
