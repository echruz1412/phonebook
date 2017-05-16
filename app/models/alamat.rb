class Alamat < ApplicationRecord
  belongs_to :contact
  validates :address, length: { minimum:20, maximum: 50 }, presence: true, uniqueness: true
  before_save :downcase_fields

  def self.search(search)
	where('address LIKE ? OR  
	 	lower(address) LIKE ? OR
	 	upper(address) LIKE ?', 
	 	"%#{search}%", "%#{search}%", "%#{search}%") 
   end

   def downcase_fields
  	self.address.downcase!
   end
end
