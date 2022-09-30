class GeocoderRoutes < Application
  get '/' do
    geocoder_params = validate_with!(GeocoderParamsContract)
    result = Geocoder::SearchService.call(*geocoder_params.to_h.values)

    if result.present?
      status 200
      json serialize_data(result)
    else
      status 404
      json serialize_error
    end
  end

  private

  def serialize_data(data)
    lat = data[0]
    lon = data[1]

    { data: {
        lat: lat,
        lon: lon
      }
    }
  end

  def serialize_error
    {
      data: {
        errors: I18n.t(:not_found, scope: 'api.errors')
      }
    }
  end
end
