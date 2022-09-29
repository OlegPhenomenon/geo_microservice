require 'csv'

module Geocoder
  class SearchService
    prepend BasicService
    
    DATA_PATH = Rails.root.join('app/data/city.csv')

    param :city

    attr_reader :city

    def call
      data[city]
    end

    private

    def data
      @data ||= load_data!
    end

    def load_data!
      @data = CSV.read(DATA_PATH, headers: true).inject({}) do |result, row|
        city = row['city']
        lat = row['geo_lat'].to_f
        lon = row['geo_lon'].to_f
        result[city] = [lat, lon]
        result
      end
    end
  end
end
