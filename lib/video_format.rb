class VideoFormat < Format
  def code
    "VID"
  end

  def bundles
    {
      3 => 570,
      5 => 900,
      9 => 1530,
    }
  end
end
