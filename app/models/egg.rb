class Egg < ApplicationRecord
    validates :title, :game , :presence => true
    #belongs_to :user
end
