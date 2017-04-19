class Contact < ApplicationRecord
	paginates_per 5
	belongs_to :user
	has_many :phones, dependent: :destroy
	has_many :alamats, dependent: :destroy
	validates :name, presence: true
end
