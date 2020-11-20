require './scrap_bot/commands/scraper'
require './scrap_bot/commands/bot_info'

# found in scrapper.rb
describe Scraper do
  let(:love) { Scraper.new }
  let(:iphone) { Scraper.new }

  describe '#option_construct' do
    it 'builds option_data hash with option and item (WIKI)' do
      option_data = { 'option' => 'wiki', 'base_url' => 'https://en.wikipedia.org/wiki/', 'item' => 'love' }
      expect(love.option_construct('wiki', 'love')).to eql(option_data)
    end
    it 'builds option_data hash with option and item(EBAY)' do
      filter = nil
      option_data = {
        'option' => 'ebay',
        'url_left' => 'https://www.ebay.com/sch/i.html?_from=R40&_nkw=',
        'url_right' => filter == 'default' ? '&_sacat=0&rt=nc&LH_Auction=1&_sop=' : '&_sacat=0&LH_Auction=1&_sop=',
        'item' => 'iphone',
        'filter' => { 'default' => '1', 'old' => '1', 'new' => '10', 'cheap' => '15', 'pricey' => '16' }
      }
      expect(iphone.option_construct('ebay', 'iphone')).to eql(option_data)
    end
    it 'returns nil if option is neither wiki nor ebay' do
      expect(iphone.option_construct('google', 'iphone')).to eql(nil)
    end
  end

  describe '#build_url' do
    it 'builds url for wiki option' do
      love.wiki('love')
      url = 'https://en.wikipedia.org/wiki/love'
      expect(love.build_url).to eql(url)
    end
  end

  describe '#group_to_string' do
    it 'passes array elements into a string with newline after each element' do
      output = "sentence one\nsentence two\nsentence three\n"
      expect(love.group_to_string(['sentence one', 'sentence two', 'sentence three'])).to eql(output)
    end
    it 'passes hash key.capitalize and value into a string with newline after each pair' do
      output = "Title: Iphone 5\nState: brand new\nPrice: $500\n"
      hash = { 'title' => 'Iphone 5', 'state' => 'brand new', 'price' => '$500' }
      expect(love.group_to_string(hash)).to eql(output)
    end
  end
end
