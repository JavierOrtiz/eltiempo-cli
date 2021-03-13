require_relative 'lib/error'
require_relative 'lib/global'
require_relative 'lib/weather_api'
require_relative 'lib/string'

require 'optparse'
require 'pry-rails'

OptionParser.new do |opts|
  raise WeatherBcn::ConfigError, 'Affiliate ID is not present' unless AFFILIATE_ID

  opts.on('-td', '--today CITY', 'Show today weather for the selected city') do |city|
    puts "Datos climaticos para hoy de #{city}:"
    WeatherApi.new(city).print_today_weather
  end

  opts.on('-amax', '--av_max CITY', 'Get max degrees for today of the selected city') do |city|
    puts "Temperatura máxima por días para #{city}:"
    WeatherApi.new(city).print_average_temperature(MAX_KEY)
  end

  opts.on('-amin', '--av_min CITY', 'Get min degrees for today of the selected city') do |city|
    puts "Temperatura mínima por días para #{city}:"
    WeatherApi.new(city).print_average_temperature(MIN_KEY)
  end
end.parse!
