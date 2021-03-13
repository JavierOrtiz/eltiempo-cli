require 'httparty'

def today_weather(city)
  data = location_json(city)
  city_response = handle_response(data["url"])
  puts city_response
end

def location_json(city)
  location_data = handle_response(API_URL).dig('report', 'location', 'data')
  location_data.detect do |location|
    location.dig('name', '__content__').remove_accents.downcase == city.remove_accents.remove_accents.downcase
  end
end

def handle_response(url)
  response = HTTParty.get(url + "&affiliate_id=#{AFFILIATE_ID}")
  response.parsed_response
end
