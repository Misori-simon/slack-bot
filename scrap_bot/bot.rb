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
  end
end
