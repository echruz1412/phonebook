class User < ApplicationRecord
  has_many :contacts, dependent: :destroy
  validates :email, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable  

  def self.search(search)
	where('lower(email) LIKE ? OR
 	upper(email) LIKE ?', 
 	"%#{search}%", "%#{search}%") 
  end     
end