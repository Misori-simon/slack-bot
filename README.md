![](https://img.shields.io/badge/Microverse-blueviolet)

# Wiki and Ebay Scraper_bot for Slack

## Definition

> I have used the web scrapping and bot building to build a bot that will return to you the wiki definition of the word you enter after the ```wiki``` command and the first two ebay results for any item you enter after the ```buy``` command.

## About the Project

The objective of this project is to realize a working bot for slack. The bot should be able to assist the workspace in which it is installed to execute certain tasks as in this case __web scraping__.
I used the slack-ruby-bot for the bot library and Nokogiri gem for scrapping. All dependencies will be listed below.

## Built With

- Ruby
- Slack-ruby-bot (lib)

## Video Presentation
[Video presentation](https://www.loom.com/share/9da5929918b1485585eafc8328fd707e)


## Getting Started

### Prerequisites
- Ruby : you need ruby installed on your local pc
- Slack workspace: You need a Slack workspace where you can create a new bot and get a token
### Setup

```
git clone https://github.com/Misori-simon/slack-bot.git
```

```
cd slack-bot
```

```
bundle install
```
- create a new slack workspace https://slack.com/create
- - follow this [tutorial](create_slack_bot.md#1)
- Create a new bot for your workspace http://slack.com/services/new/bot
- - follow this [tutorial](create_slack_bot.md#2)
- Copy the __token__ provided you
- In your slack-bot folder on your pc,
- - Create a ```.env``` file
- - Add a new environmental variable as shown below, where value is your __token__
```
SLACK_API_TOKEN=xoxb-000000000000-000000000000-AaaaaAAa00aa0AaaA00aAab
```
:warning: the above key is a placeholder, replace the value with your __token__ and save the   ```.env``` file
- In your CLI while still in the root folder ```slack-bot```
- Run ```rackup```
- - To establish the connection between your workspace bot and the code
- Your workspace, __DM__ the bot
- Type ```greet``` to get a ```hello``` from the bot
- Type ```info``` to get bot commands


![screenshot](./assets/othersc.png)


- - To establish connection between your workspace bot and the code

- In Your workspace, __DM__ the bot
- Type ```greet``` to get a ```hello``` from the bot
- Type ```info``` to get bot commands

- To get a wiki definition of any word:
- - Use the keyword ```wiki``` then the word eg:
- - ```wiki football```
- - ```wiki ruby```


![screenshot](./assets/wikisc.png)


- To get products from ebay:
- - Use the keyword ```buy``` then the item eg:
- - ```buy iphone```
- - ```buy laptop```


![screenshot](./assets/buysc.png)



## Authors

👤 **Misori Simon**

  - GitHub: [Misori-simon](https://github.com/Misori-simon/)
  - Twitter: [@misori_simon](https://twitter.com/misori_simon)
  - LinkedIn: [Misori Simon](https://cm.linkedin.com/in/misori-simon-05906219b)


## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments
- [Daniel Doubrovkine](https://twitter.com/dblockdotorg) for his [slack-ruby-bot](https://github.com/slack-ruby/slack-ruby-bot/tree/9364f2e33f89d8659a568b66f796930d093f51dc)


