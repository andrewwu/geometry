class Size < ActiveRecord::Base
  has_and_belongs_to_many :models, -> { uniq }

  IGNORED_ATTRIBUTES = ["id", "frame_size", "created_at", "updated_at"]
  GEOMETRY_ATTRIBUTES = self.attribute_names - IGNORED_ATTRIBUTES

  validates :frame_size, presence: true, numericality: { greater_than: 0 }

  validate :uniqueness

  GEOMETRY_ATTRIBUTES.each do |attribute|
    validates attribute.to_sym, numericality: { greater_than: 0 },
                                allow_blank: true
  end

  def self.find_by_geometry(attributes = {})
    sizes = Size.where(
      frame_size: attributes[:frame_size],
      top_tube: attributes[:top_tube],
      head_tube: attributes[:head_tube],
      head_tube_angle: attributes[:head_tube_angle],
      seat_tube: attributes[:seat_tube],
      seat_tube_angle: attributes[:seat_tube_angle],
      bottom_bracket_drop: attributes[:bottom_bracket_drop],
      front_center: attributes[:front_center],
      chainstay: attributes[:chainstay],
      fork_rake: attributes[:fork_rake],
      trail: attributes[:trail],
      wheelbase: attributes[:wheelbase],
      standover: attributes[:standover],
      stack: attributes[:stack],
      reach: attributes[:reach]
    )

    sizes.first
  end

  def self.find_or_create_by_geometry(attributes = {})
    if size = find_by_geometry(attributes)
      size
    else
      Size.create(attributes)
    end
  end

  private

  def uniqueness
    attrs = attributes.except("id", "created_at", "updated_at").symbolize_keys
    if Size.find_by_geometry(attrs)
      errors.add(:base, "Geometry must be unique")
    end
  end
end
