class Customer < ApplicationRecord
    validates :name, presence: true
    validates :birthdate, presence: true
    validates :image, presence: true
    validates :account, uniqueness: true
    has_one_attached :image
    has_many :transactions
    has_many :extracts
end
