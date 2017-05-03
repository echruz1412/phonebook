class Phone < ApplicationRecord
  belongs_to :contact
  validates :nphone, format: { with: /([0][3,8][1][1-9])\w+/ }, length: { minimum: 10 }, presence: true
end
