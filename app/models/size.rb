class Size < ActiveRecord::Base
  IGNORED_ATTRIBUTES = ["id", "frame_size", "created_at", "updated_at"]
  ATTRIBUTES = self.attribute_names - IGNORED_ATTRIBUTES

  validates :frame_size, presence: true, numericality: { greater_than: 0 }

  ATTRIBUTES.each do |attribute|
    validates attribute.to_sym, numericality: { greater_than: 0 },
                                allow_blank: true
  end
end
