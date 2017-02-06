require 'observer'
require 'helper'

module Application
  describe User do
    include Helper

    let(:user) { User.new "username", "Burak", "Software Engineer" }
    it "should update all subscribers" do
      observer = instance_double("UserObserver")
      expect(observer).to receive(:updated).with(user)

      user.subscribe observer
      user.update :username, "bkdir"
    end

    it "should print the contents of the changed user" do
      user.subscribe UserObserver.new
      expect(capture { user.update :username, "bkdir" }).to include("bkdir")
    end
  end
end
