class Course < ApplicationRecord
    has_many :enrolls ,dependent: :destroy
    has_many :users , through: :enrolls
end
