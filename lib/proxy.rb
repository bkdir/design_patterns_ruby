class Video
  def initialize title, description
    @title = title
    @description = description
  end

  def play
    puts @title
    puts @description
  end
end

class VideoAuthenticationProxy 
  def initialize video, user
    @user = user
    @video = video
  end

  def play
    if @user == "Privileged"
      @video.play
    else
      raise ForbiddenAccessError
    end
  end
end

class ForbiddenAccessError < StandardError; end
