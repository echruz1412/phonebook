class Contact < ApplicationRecord
	belongs_to :user
	has_many :phones, dependent: :destroy
	has_many :alamats, dependent: :destroy
	validates :name, length: { minimum: 6, maximum: 25 }, presence: true, uniqueness: true
	before_save :downcase_fields

	accepts_nested_attributes_for :phones, allow_destroy: true
	accepts_nested_attributes_for :alamats, allow_destroy: true

	has_attached_file :avatar, styles: { medium: "250x250>", thumb: "50x50>"}, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

   def self.search(search)
   	search.downcase!
	where('lower(name) LIKE ? OR 
	 	upper(name) LIKE ? OR 
	 	name LIKE ? OR 
	 	phones.nphone LIKE ? OR 
	 	alamats.address LIKE ? OR
	 	lower(alamats.address) LIKE ? OR
	 	upper(alamats.address) LIKE ?', 
	 	"%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") 
   end

   def downcase_fields(search)
  	self.name.downcase!
   end
end
