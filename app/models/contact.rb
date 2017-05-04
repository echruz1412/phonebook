class Contact < ApplicationRecord
	belongs_to :user
	has_many :phones, dependent: :destroy
	has_many :alamats, dependent: :destroy
	validates :name, length: { minimum: 6, maximum: 25 }, presence: true, uniqueness: true

	has_attached_file :avatar, styles: { medium: "250x250>", thumb: "50x50>"}, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
