RSpec.describe GeocoderRoutes, type: :routes do
  describe 'GET /' do
    subject { described_class }
  
    context 'get existed city' do
      it 'should return Moscow coordinates' do
        uri = URI.escape("?city=Москва")
        get uri

        expect(response_body['data']).to a_hash_including(
          "lat"=>55.7540471,
          "lon"=>37.620405
        )
      end
    end

    context 'get no existed city' do
      it 'should what' do
        uri = URI.escape("?city=Таллинн")
        get uri

        expect(response_body['data']).to a_hash_including(
          "errors"=>"Запрашиваемый ресурс не найден"
        )
      end
    end
  end
end
