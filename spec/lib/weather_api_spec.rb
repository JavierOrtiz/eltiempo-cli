require_relative '../../lib/weather_api'
require_relative '../../lib/global'

describe WeatherApi do
  let(:subject) { WeatherApi.new(city) }
  let(:city) { 'Gavà' }

  before do
    stub_const("AFFILIATE_ID", 'test-token')
    allow(subject).to receive(:location_json).and_return({'name'=>{'__content__'=>'Gavà', 'id'=>'1381'}, 'url'=>'http://api.tiempo.com/index.php?api_lang=es&localidad=1381'})
    allow(subject).to receive(:city_response).and_return(city_response_data)
  end

  context '#print_today_weather' do
    it 'should return the time of today' do
      expect(subject.print_today_weather).to be_truthy
    end
  end
end

def city_response_data
  [{"name"=>"Temperatura Mínima",
    "icon"=>"4",
    "data"=>
      {"forecast"=>
         [{"data_sequence"=>"1", "value"=>"7"},
          {"data_sequence"=>"2", "value"=>"7"},
          {"data_sequence"=>"3", "value"=>"6"},
          {"data_sequence"=>"4", "value"=>"7"},
          {"data_sequence"=>"5", "value"=>"5"},
          {"data_sequence"=>"6", "value"=>"4"},
          {"data_sequence"=>"7", "value"=>"2"}]}},
   {"name"=>"Temperatura Máxima",
    "icon"=>"5",
    "data"=>
      {"forecast"=>
         [{"data_sequence"=>"1", "value"=>"15"},
          {"data_sequence"=>"2", "value"=>"16"},
          {"data_sequence"=>"3", "value"=>"16"},
          {"data_sequence"=>"4", "value"=>"18"},
          {"data_sequence"=>"5", "value"=>"17"},
          {"data_sequence"=>"6", "value"=>"13"},
          {"data_sequence"=>"7", "value"=>"11"}]}},
   {"name"=>"Viento",
    "icon"=>"9",
    "data"=>
      {"forecast"=>
         [{"data_sequence"=>"1", "id"=>"12", "idB"=>"52", "value"=>"Viento moderado de sureste", "valueB"=>"Viento moderado de sureste"},
          {"data_sequence"=>"2", "id"=>"14", "idB"=>"54", "value"=>"Viento moderado de suroeste", "valueB"=>"Viento moderado de suroeste"},
          {"data_sequence"=>"3", "id"=>"33", "idB"=>"45", "value"=>"Viento variable", "valueB"=>"Viento moderado de sur"},
          {"data_sequence"=>"4", "id"=>"19", "idB"=>"59", "value"=>"Viento fuerte de este", "valueB"=>"Viento fuerte de este"},
          {"data_sequence"=>"5", "id"=>"22", "idB"=>"62", "value"=>"Viento fuerte de suroeste", "valueB"=>"Viento fuerte de suroeste"},
          {"data_sequence"=>"6", "id"=>"14", "idB"=>"54", "value"=>"Viento moderado de suroeste", "valueB"=>"Viento moderado de suroeste"},
          {"data_sequence"=>"7", "id"=>"14", "idB"=>"46", "value"=>"Viento moderado de suroeste", "valueB"=>"Viento moderado de suroeste"}]}},
   {"name"=>"Símbolo del tiempo",
    "icon"=>"10",
    "data"=>
      {"forecast"=>
         [{"data_sequence"=>"1", "id"=>"2", "id2"=>"2", "value"=>"Intervalos nubosos", "value2"=>"Intervalos nubosos"},
          {"data_sequence"=>"2", "id"=>"6", "id2"=>"6", "value"=>"Cielos nubosos con lluvias débiles", "value2"=>"Cielos nubosos con lluvias débiles"},
          {"data_sequence"=>"3", "id"=>"1", "id2"=>"1", "value"=>"Cielos despejados", "value2"=>"Cielos despejados"},
          {"data_sequence"=>"4", "id"=>"2", "id2"=>"2", "value"=>"Intervalos nubosos", "value2"=>"Intervalos nubosos"},
          {"data_sequence"=>"5", "id"=>"2", "id2"=>"2", "value"=>"Intervalos nubosos", "value2"=>"Intervalos nubosos"},
          {"data_sequence"=>"6", "id"=>"6", "id2"=>"6", "value"=>"Cielos nubosos con lluvias débiles", "value2"=>"Cielos nubosos con lluvias débiles"},
          {"data_sequence"=>"7", "id"=>"5", "id2"=>"5", "value"=>"Intervalos nubosos con lluvias débiles", "value2"=>"Intervalos nubosos con lluvias débiles"}]}},
   {"name"=>"Día",
    "icon"=>"15",
    "data"=>
      {"forecast"=>
         [{"data_sequence"=>"1", "value"=>"Domingo"},
          {"data_sequence"=>"2", "value"=>"Lunes"},
          {"data_sequence"=>"3", "value"=>"Martes"},
          {"data_sequence"=>"4", "value"=>"Miércoles"},
          {"data_sequence"=>"5", "value"=>"Jueves"},
          {"data_sequence"=>"6", "value"=>"Viernes"},
          {"data_sequence"=>"7", "value"=>"Sábado"}]}},
   {"name"=>"Definición de Atmosfera",
    "icon"=>"19",
    "data"=>
      {"forecast"=>
         [{"data_sequence"=>"1", "value"=>"Durante la primera mitad del día Cielos despejados tendiendo en la segunda mitad del día a Intervalos nubosos"},
          {"data_sequence"=>"2", "value"=>"Durante la primera mitad del día Cielos cubiertos tendiendo en la segunda mitad del día a Cielos despejados"},
          {"data_sequence"=>"3", "value"=>"Durante todo el dia Cielos despejados"},
          {"data_sequence"=>"4", "value"=>"Durante todo el dia Cielos despejados"},
          {"data_sequence"=>"5", "value"=>"Durante la primera mitad del día Cielos despejados tendiendo en la segunda mitad del día a Intervalos nubosos"},
          {"data_sequence"=>"6", "value"=>"Durante la primera mitad del día Intervalos nubosos con lluvias débiles tendiendo en la segunda mitad del día a Cielos cubiertos"},
          {"data_sequence"=>"7", "value"=>"Durante la primera mitad del día Cielos despejados tendiendo en la segunda mitad del día a Cielos cubiertos"}]}}]
end