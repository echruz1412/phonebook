class Phone < ApplicationRecord
  belongs_to :contact
  validates :nphone, format: { with: /\A[0][1-9]+\z/ }, length: { minimum: 12 }, presence: true
end
