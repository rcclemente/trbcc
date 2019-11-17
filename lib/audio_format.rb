require_relative 'format'
class AudioFormat < Format
  def code
    "FLAC"
  end

  def bundles
    {
      3 => 427.50,
      6 => 810,
      9 => 1147.50,
    }
  end
end
