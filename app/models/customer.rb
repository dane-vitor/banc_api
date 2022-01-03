class Customer < ApplicationRecord
    validates :name, presence: true
    validates :birthdate, presence: true
    validates :image, presence: true
    validates :account, uniqueness: true, length: {minimum:7, maximum:7} 
    validates :password, length: {minimum:4, maximum:4}
    has_one_attached :image
    has_many :transactions
    has_many :extracts
end
