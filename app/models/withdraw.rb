class Withdraw < ApplicationRecord
    validates :withdraw, numericality: true
end
