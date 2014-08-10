module StaticPagesHelper
  def format_size_attribute(value, name = nil)
    if value.nil?
      "-"
    else
      format = "%g" % value
      format += "&deg;" if name.to_s.include?("angle")
      raw(format)
    end
  end

  def options_for_year
    options_for_select(Model.pluck(:year).uniq.sort)
  end

  def options_for_manufacturer
    options_for_select(
      Manufacturer.order(:name).map { |manufacturer|
        years = "#{manufacturer.models.pluck(:year).uniq}"
        [manufacturer.name, { 'data-years' => years }]
      }
    )
  end

  def grouped_options_for_model
    grouped_options_for_select(
      Manufacturer.order(:name).map { |manufacturer|
        [manufacturer.name, manufacturer.models.map { |model|
          [model.name, model.id, { 'data-year' => model.year }]
        }]
      }
    )
  end

  def grouped_options_for_size
    grouped_options_for_select(
      Model.order(:name).map { |model|
        [model.full_name, model.sizes.map { |size|
          ["%g" % size.frame_size, size.id]
        }]
      }
    )
  end
end
