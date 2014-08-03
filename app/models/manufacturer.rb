class Manufacturer < ActiveRecord::Base
  has_many :models, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false },
                                   length: { maximum: 30 }
end
