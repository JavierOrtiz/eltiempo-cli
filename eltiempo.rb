require 'optparse'
require 'pry-rails'

OptionParser.new do |opts|
  opts.on("-td", "--today CITY", "Show today weather for the selected city") do |city|
    # Code..
  end

  opts.on("-amax", "--av_max CITY", "Get max degrees for today of the selected city") do |city|
    # Code..
  end

  opts.on("-amin", "--av_min CITY", "Get min degrees for today of the selected city") do |city|
    # Code..
  end
end.parse!

def api_url
  @api_url ||= "http://api.tiempo.com/index.php?api_lang=es&division=102&affiliate_id=#{affiliate_id}"
end

def affiliate_id
  ENV["AFFILIATE_ID"]
end