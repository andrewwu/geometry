class Manufacturer < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { case_sensitive: false },
                                   length: { maximum: 30 }
end
