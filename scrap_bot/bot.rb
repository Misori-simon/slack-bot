module ScrapBot
  class Bot < SlackRubyBot::Bot
    help do
      title 'Scrap block'
      desc 'A bot that scraps from wiki and ebay'
    end

    command :greet do
      title 'greet'
      desc 'greets by saying hello'
      long_desc 'returns hello when bot is ...'
    end

    command :info do
      title 'info'
      desc 'displays complete information about the bot'
      long_desc 'displays complete information about the bot and related commands on how to use the scrap bot with examples'
    end
  end
end
