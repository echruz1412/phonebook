class Contact < ApplicationRecord
	has_many :phones, dependent: :destroy
	has_many :alamats, dependent: :destroy
	validates :name, presence: true
end
