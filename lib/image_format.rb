require_relative 'format'

class ImageFormat < Format
  def code
    "IMG"
  end

  def bundles
    {
      5 => 480,
      10 => 800
    }
  end
end
