require_relative 'lib/error'
require_relative 'lib/global'
require_relative 'lib/string'

require 'optparse'
require 'httparty'
require 'pry-rails'

OptionParser.new do |opts|
  raise WeatherBcn::ConfigError, 'Affiliate ID is not present' unless AFFILIATE_ID

  opts.on('-td', '--today CITY', 'Show today weather for the selected city') do |city|
    puts "Show today weather for #{city}"
    response = HTTParty.get(API_URL)
    location_data = response.parsed_response.dig('report', 'location', 'data')
    puts location_data.detect {|location| location.dig('name', '__content__').remove_accents.downcase == city.remove_accents.remove_accents.downcase }
  end

  opts.on('-amax', '--av_max CITY', 'Get max degrees for today of the selected city') do |city|
    puts 'Get max degrees for today of the selected city'
  end

  opts.on('-amin', '--av_min CITY', 'Get min degrees for today of the selected city') do |city|
    puts 'Get min degrees for today of the selected city'
  end
end.parse!
