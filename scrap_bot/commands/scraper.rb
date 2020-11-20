require 'httparty'
require 'nokogiri'
require 'open-uri'

# class for scraping
class Scraper
  def initialize
    @url = ''
    @rendered_text = []
  end

  private

  def option_construct(option, item)
    case option
    when 'wiki'
      @option_data = { 'option' => option, 'base_url' => 'https://en.wikipedia.org/wiki/', 'item' => item }
      @rendered_text = ["Wiki Definition for #{item}"]
    when 'ebay'
      @option_data = {
        'option' => option,
        'url_left' => 'https://www.ebay.com/sch/i.html?_from=R40&_nkw=',
        'url_right' => @filter == 'default' ? '&_sacat=0&rt=nc&LH_Auction=1&_sop=' : '&_sacat=0&LH_Auction=1&_sop=',
        'item' => item,
        'filter' => { 'default' => '1', 'old' => '1', 'new' => '10', 'cheap' => '15', 'pricey' => '16' }
      }
      @rendered_text = ["Ebay results for #{item}"]
    end
    @option_data
  end

  def build_url
    case @option_data['option']
    when 'wiki'
      @url = "#{@option_data['base_url']}#{@option_data['item']}"
    when 'ebay'
      @url = "#{@option_data['url_left']}#{@option_data['item']}"
      @url << "#{@option_data['url_right']}#{@option_data['filter'][@filter]}"
    end
  end

  def parse_page
    raw_html = HTTParty.get(@url)
    Nokogiri::HTML(raw_html)
  end

  def group_to_string(group)
    text = ''
    if group.instance_of?(Hash)
      group.each { |key, value| text << "#{key.capitalize}: #{value}\n" }
    elsif group.instance_of?(Array)
      group.each { |val| text << "#{val}\n" }
    else
      puts 'can convert only hashes and arrays'
    end
    text
  end

  def text_formater
    parsed_html = parse_page
    case @option_data['option']
    when 'wiki'
      @rendered_text << parsed_html.css('p').text.split("\n").find { |e| e.length.positive? }
      @rendered_text = "#{@rendered_text[0]} \n------------------------- \n#{@rendered_text[1]}"
    when 'ebay'
      (0..1).each do |x|
        title = parsed_html.css('li.s-item--watch-at-corner img.s-item__image-img')[x].attributes['alt'].value
        link = parsed_html.css('li.s-item--watch-at-corner div.s-item__image a')[x].attributes['href'].value
        img = parsed_html.css('li.s-item--watch-at-corner img.s-item__image-img')[x].attributes['src'].value
        state = parsed_html.css('li.s-item--watch-at-corner span.SECONDARY_INFO')[x].text
        price = parsed_html.css('li.s-item--watch-at-corner span.s-item__price')[x].text

        result = { title: "*#{title}*", link: "_#{link}_", img: img, state: state, price: "*#{price}*" }

        @rendered_text << group_to_string(result)
      end
      @rendered_text
    end
    @rendered_text
  end

  public

  def wiki(item)
    option_construct('wiki', item)
    build_url
    parse_page
    text_formater
  end

  def ebay(item, filter = 'default')
    @filter = filter
    option_construct('ebay', item)
    build_url
    parse_page
    text_formater
  end
end
