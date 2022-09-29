require_relative 'config/environment'

map '/geo' do
  run GeocoderRoutes
end
