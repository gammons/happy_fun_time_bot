= Happy Fun Time Bot

Have happy fun times with this configurable XMPP bot!  It is SO easy to use!

Lets take a look!
```ruby
#!/usr/bin/env ruby

require 'rubygems'
require 'happy_fun_time_bot'

@bot = HappyFunTimeBot.new(:jid => "xxxx@chat.hipchat.com", :nick => "HappyFunTime Bot", :room => "123_your_talk_chan@conf.hipchat.com", :password => "xxxx")

@bot.add_responder('heybot') do |from, args|
  "Oh HAI #{from}!!!"
end

@bot.run!
```

```
Bob: !heybot what's up?
HappyFunTime Bot:  Oh HAI Bob!!!
```

### So many IdeazzZz!!
Add responders to insert random images of dogs in costumes!
```
Bob: !findimage dog costume
HappyFunTime Bot: Here ya go!
```
![](http://spoilurpets.com/images/Lobster%20Paws%20Dog%20Costume.JPG)


Kick off a build!
```
Bob: !build_the_app
HappyFunTime Bot: All tests PASSED!
```
![](http://thehairpin.com/wp-content/uploads/2010/12/womanpic1001_228x342.jpeg)

Deploy your app!
```
Bob: !deploy
HappyFunTime Bot: Deploying now!
```


=== Bot creation Options:

* `:jid` - Required.
* `:nick` - The nickname for the bot to use.
* `:room` - Required.  The room to enter.
* `:password` - The bot's password.
* `:command_regex` - The regular expression to test for a command.  The default is a ! followed by a word.  e.g. `/^!(.+)$/`

== Copyright

Copyright (c) 2011 Grant Ammons. See LICENSE.txt for further details.
