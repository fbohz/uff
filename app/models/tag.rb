class Tag < ApplicationRecord
  validates_presence_of :name
  validates :name, length: { in: 3..20 }
  belongs_to :wall
end
