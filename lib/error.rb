class WeatherCli
  class Error < StandardError
  end

  class InvocationError < Error
  end

  class ConfigError < Error
  end
end