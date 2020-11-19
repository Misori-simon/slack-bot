$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'dotenv'
Dotenv.load

require 'scrap_bot'

ScrapBot::Bot.run
