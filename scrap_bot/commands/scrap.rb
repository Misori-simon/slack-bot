require_relative 'scraper'
require_relative 'bot_info'
module ScrapBot
  module Commands
    class Scrap < SlackRubyBot::Commands::Base
      command 'greet' do |client, data, _match|
        client.say(channel: data.channel, text: 'hello')
      end
      command 'info' do |client, data, _match|
        client.say(channel: data.channel, text: BotInfo.new.about)
      end
      match(/^wiki (?<location>.*)$/i) do |client, data, match|
        client.say(channel: data.channel, text: Scraper.new.wiki(match[:location]))
        # client.say(channel: data.channel, text: "The wiki in #{match[:location]} is nice.")
      end

      match(/^buy (?<location>.*)$/i) do |client, data, match|
        item = Scraper.new.ebay(match[:location])
        item = Scraper.new.group_to_string(item)
        client.say(channel: data.channel, text: item)
        # client.say(channel: data.channel, text: "The wiki in #{match[:location]} is nice.")
      end
    end
  end
end