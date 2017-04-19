class Contact < ApplicationRecord
	paginates_per 5
	belongs_to :user
	has_many :phones, dependent: :destroy
	has_many :alamats, dependent: :destroy
	validates :name, presence: true

	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>"}, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
