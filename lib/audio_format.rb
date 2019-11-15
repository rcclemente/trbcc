class AudionFormat < Format
  def code
    "FLAC"
  end

  def bundles
    {
      3 => 427.50,
      5 => 810,
      9 => 1147.50,
    }
  end
end
