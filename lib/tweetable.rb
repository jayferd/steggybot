# stdlib
require 'pathname'

# gem
require 'twitter'

# Usage:
# class MyClass
#   include Tweetable
#
#   def some_method
#     tweet "ya bish"
#   end
# end
#
# This defaults to printing to stdout if config/twitter.rb doesn't exist.
module Tweetable
  root_dir = Pathname.new(__FILE__).dirname.parent
  config = root_dir.join('config/twitter.rb')

  if config.exist?
    load config
    def tweet(str)
      Twitter.update(str)
    end
  else
    $stderr.puts("loading without twitter")
    def tweet(str)
      puts "tweeting: #{str.inspect}"
    end
  end
end
