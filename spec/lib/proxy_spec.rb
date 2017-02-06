require 'proxy'
require 'helper'

include Helper

describe Video do
  let(:name) { "Hello World" }
  let(:description) { "Proxy Pattern" }
  let(:video) { Video.new name, description }

  it "shows the name" do
    expect(capture { video.play }).to include name
  end

  it "shows the description" do
    expect(capture { video.play }).to include description
  end
end

describe VideoAuthenticationProxy do
  it "allows priviliged users to access the video" do
    video = Video.new("title", "description")
    proxy = VideoAuthenticationProxy.new video, "Privileged"

    expect(capture { proxy.play }).to include "title"
    expect(capture { proxy.play }).to include "description"
  end

  it "forbid regular users to access the video" do
    video = Video.new("title", "description")
    proxy = VideoAuthenticationProxy.new video, "Randon"

    expect{proxy.play}.to raise_error ForbiddenAccessError
  end
end
