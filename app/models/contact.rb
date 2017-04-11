class Contact < ApplicationRecord
	paginates_per 5
	has_many :phones, dependent: :destroy
	has_many :alamats, dependent: :destroy
	validates :name, presence: true
end
