class Alamat < ApplicationRecord
  belongs_to :contact
  validates :address, length: { minimum:20, maximum: 50 }, presence: true
end
