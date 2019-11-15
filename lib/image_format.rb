class ImageFormat < Format
  def code
    "IMG"
  end

  def bundles
    {
      5 => 480,
      9 => 800,
    }
  end
end
