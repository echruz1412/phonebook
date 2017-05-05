class Alamat < ApplicationRecord
  belongs_to :contact
  validates :address,
  length: { minimum:20, maximum: 50 },
  presence: true,
  uniqueness: true

  def self.search(search)
	where('address LIKE ? OR  
	 	lower(address) LIKE ? OR
	 	upper(address) LIKE ?', 
	 	"%#{search}%", "%#{search}%", "%#{search}%") 
   end
end
