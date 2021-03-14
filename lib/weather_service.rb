require 'httparty'
require_relative 'error'

class WeatherService
  attr_reader :city

  def initialize(city)
    @city = city
  end

  def print_today_weather
    valid_config?

    city_response.each do |var|
      puts "#{var['name']}: #{var.dig('data', 'forecast').first['value']}"
    end && true
  end

  def print_average_temperature(order_key)
    av_max_object = city_response.detect { |var| var['name'] == order_key }
    days_object['data']['forecast'].each do |day|
      av_data = av_max_object.dig('data', 'forecast').detect { |av| av['data_sequence'] == day['data_sequence'] }
      puts "#{day['value']} - #{av_data['value']}º"
    end && true
  end

  private

  def city_response
    @city_response ||= begin
                         data = location_json
                         handle_response(data['url']).dig('report', 'location', 'var')
                       end
  end

  def days_object
    @days_object ||= city_response.detect { |var| var['name'] == DAY_KEY }
  end

  def location_json
    location_data = handle_response(API_URL + "&division=#{DIVISION_ID}").dig('report', 'location', 'data')
    location_data.detect do |location|
      location.dig('name', '__content__').remove_accents.downcase == city.remove_accents.downcase
    end
  end

  def handle_response(url)
    response = HTTParty.get(url + "&affiliate_id=#{AFFILIATE_ID}")
    response.parsed_response
  end

  def valid_config?
    raise WeatherCli::ConfigError, 'Affiliate ID is not present' unless AFFILIATE_ID
    raise WeatherCli::ConfigError, 'Division ID is not present' unless DIVISION_ID
  end
end
