class UserSessionRoutes < Application
  get '/' do
    geocoder_params = validate_with!(GeocoderParamsContract)

    result = Geocoder::SearchService.call(*session_params.to_h.values)

    # if result.success?
    #   status 200
    #   json meta: meta
    # else
    #   status 401
    #   error_response(result.session || result.errors)
    # end

    status 200
    result
  end
end
