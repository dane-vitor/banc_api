class Extract < ApplicationRecord
    validates :current_account, numericality: true
end
