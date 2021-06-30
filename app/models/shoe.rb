class Shoe < ActiveRecord::Base
  validates :name, presence: true, length: { in: 2..20 }
  belongs_to :user
  has_many :trans, dependent: :destroy
  has_many :shoes_sold, through: :trans, source: :user, dependent: :destroy
end
