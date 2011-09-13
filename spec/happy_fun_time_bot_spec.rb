require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "HappyFunTimeBot" do
  it "should load everything properly" do
    HappyFunTimeBot
    lambda { HappyFunTimeBot.new }.should_not raise_error
  end

  describe "commands" do
    it "should have a configurable command regex" do
      @bot = HappyFunTimeBot.new(:command_regex => /^#(.+)$/)
      @bot.stub(:send_response)
      @bot.add_responder("findimage") { |from, args| "finding an image" }
      @bot.send(:process, "bob", "#findimage monkey").should == ["finding an image"]
      @bot.send(:process, "bob", "!findimage monkey").should == []
    end
  end

  describe "responding" do
    before(:each) do
      @bot = HappyFunTimeBot.new
      @bot.stub(:send_response)
    end

    it "should respond if there is a responder" do
      @bot.add_responder("findimage") { |from, args| "finding an image" }
      @bot.send(:process, "bob", "!findimage monkey").should == ["finding an image"]
    end

    it "should have multiple responses" do
      @bot.add_responder("findimage") { |from, args| "finding an image" }
      @bot.add_responder("google") { |from, args| "googling for you, #{from}." }

      @bot.send(:process, "bob", "!findimage monkey").should == ["finding an image"]
      @bot.send(:process, "bob", "!google monkey").should == ["googling for you, bob."]
    end

    it "should contain the args in the args arg" do
      @bot.add_responder("argarg") { |from, args| "your args are #{args}" }
      @bot.send(:process, "bob", "!argarg monkey costume").should == ["your args are monkey costume"]
    end

    it "should respond to all messages if we did not specify a specific responder" do
      @bot.add_responder { |from, args| "got it." }
      @bot.send(:process, "jim", "sending some stuff").should == ["got it."]
    end
  end
end
