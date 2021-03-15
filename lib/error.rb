class WeatherCli
  class Error < StandardError
  end

  class CityNotFound < Error
  end

  class ConfigError < Error
  end
end