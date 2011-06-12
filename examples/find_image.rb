#!/usr/bin/env ruby
%w(rubygems happy_fun_time_bot httparty).each {|r| require r }

# For hipchat, your :jid, :room and :password are available at https://www.hipchat.com/account/xmpp
#@bot = HappyFunTimeBot.new(:jid => "xxxxx@chat.hipchat.com", :nick => "ImageBot", :room => "your_room@conf.hipchat.com", :password => "xxx")
@bot = HappyFunTimeBot.new(:jid => "514_23995@chat.hipchat.com", :nick => "HappyFunTime Bot", :room => "514_dev_talk@conf.hipchat.com", :password => "kwanzaa")

# Let's create a simple image getter from google.
class Google
  include HTTParty
  format :json

  def self.get_image_url(search, options = {:start => 0})
    if options[:random]
      options[:start] = rand(12)
    end

    res = Google.get("https://ajax.googleapis.com/ajax/services/search/images?v=1.0&safe=active&start=#{options[:start]}&rsz=8&q=#{URI.escape(search)}")
    res["responseData"]["results"][0]["url"]
  end

  def self.get_youtube_url(search)
    res = Google.get("http://gdata.youtube.com/feeds/api/videos?q=#{URI.escape(args)}&alt=json")
    res["feed"]["entry"][0]["link"][0]['href']
  end
end


# let's find some images!
@bot.add_responder('findimage') do |from, args|
  $stdout << "args are #{args}\n"
  url = Google.get_image_url(args)
  "Look! #{url}"
end

@bot.run!
