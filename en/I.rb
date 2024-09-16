# Bad practice
class Camera
  def take_picture
    raise NotImplementedError
  end

  def record_video
    raise NotImplementedError
  end
end

# Here this camera doesn't need the record_video method, but it is required to implement it

class PhotographyCamera < Camera
  def take_picture
    'Taking picture...'
  end
end

# Good practice ISP

class Camera
  def take_picture
    raise NotImplementedError
  end
end

class VideoRecorder
  def record_video
    raise NotImplementedError
  end
end

class PhotographyCamera < Camera
  def take_picture
    'Taking picture...'
  end
end
