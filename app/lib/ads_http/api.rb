module AdsHttp
  module Api
      def update_coordinates(id_object: payload['id'], coordinates: coordinates)
        params = {
          id: id_object,
          coordinates: {
            lat: coordinates[0],
            lon: coordinates[1]
          }
        }

        connection.put('http://localhost:3000/ads/v1', params)
      end
  end
end

