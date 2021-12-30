class Deposit < ApplicationRecord
validates :deposit, numericality: true
end

