#!/usr/bin/env ruby

require 'rubygems'
require 'happy_fun_time_bot'

# For hipchat, your :jid, :room and :password are available at https://www.hipchat.com/account/xmpp
#@bot = HappyFunTimeBot.new(:jid => "xxxxx@chat.hipchat.com", :nick => "ImageBot", :room => "your_room@conf.hipchat.com", :password => "xxx")
@bot = HappyFunTimeBot.new(:jid => "514_23995@chat.hipchat.com", :nick => "HappyFunTime Bot", :room => "514_dev_talk@conf.hipchat.com", :password => "kwanzaa")

# calling !heybot will return a simple response.
@bot.add_responder('heybot') do |from, args|
  "Hai, #{from}!!"
end

# endless loop.  Use bluepill or something else to daemonize it.
@bot.run!
