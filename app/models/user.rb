class User < ApplicationRecord
  has_many :contacts, dependent: :destroy
  validates :email, uniqueness: true
  before_save :downcase_fields
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable  

  def self.search(search)
  	search.downcase!
	where('lower(email) LIKE ? OR
 	upper(email) LIKE ?', 
 	"%#{search}%", "%#{search}%") 
  end    

  def downcase_fields
  	self.email.downcase!
  end
end