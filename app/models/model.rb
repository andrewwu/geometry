class Model < ActiveRecord::Base
  belongs_to :manufacturer

  validates :year, presence: true,
            inclusion: {
              in: 1817..1.year.from_now.year,
              message: "should be a four-digit year"
            }
  validates :name, presence: true, length: { maximum: 20 }
  validates :manufacturer, presence: true, associated: true
end
