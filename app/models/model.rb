class Model < ActiveRecord::Base
  has_and_belongs_to_many :sizes, -> { uniq }
  belongs_to :manufacturer

  validates :year, presence: true,
            inclusion: {
              in: 1817..1.year.from_now.year,
              message: "should be a four-digit year"
            }
  validates :name, presence: true, length: { maximum: 20 }
  validates :manufacturer, presence: true, associated: true

  def full_name
    "#{year} #{manufacturer.name} #{name}"
  end

  def self.find_by_id_and_size_id(model_id, size_id)
    includes(:sizes).where(
      id: model_id,
      sizes: { id: size_id }).first
  end
end
