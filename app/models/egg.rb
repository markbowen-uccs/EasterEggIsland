class Egg < ApplicationRecord
    validates :title, :game , :presence => true
end
