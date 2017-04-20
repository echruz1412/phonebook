class Phone < ApplicationRecord
  belongs_to :contact
  validates :nphone, presence: true
end
