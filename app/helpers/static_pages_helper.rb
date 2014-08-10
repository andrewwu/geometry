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
end
