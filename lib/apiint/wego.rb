module Apiint
  class Wego
    require 'net/http'

    def self.callapi(params)
      data = build_data(params)
      headers = {"Content-Type" => "application/json", "Accept" => "application/json"}
      url = URI.parse("http://api.wego.com/flights/api/k/2/searches?api_key=e16ecfbf7f96a9f56345&ts_code=1d9aa")
      http = Net::HTTP.new(url.host, url.port)
      res = http.post(url, data.to_json, headers)

      response = JSON.parse(res.body)
      if response["message"]
        return res.body
      end

      sleep 1
      id = rand(1376967853520..9976967853520)
      data = { id: id , search_id: response["id"], trip_id: response["trips"][0]["id"], fares_query_type: "route"}
      url = URI.parse("http://api.wego.com/flights/api/k/2/fares?api_key=e16ecfbf7f96a9f56345&ts_code=1d9aa")
      http = Net::HTTP.new(url.host, url.port)
      res = http.post(url, data.to_json, headers)
      return res.body
    end

    private

    def self.build_data(details)
      trips = [{departure_code: details["departure_code"], arrival_code: details["arrival_code"], outbound_date: details["date"]}]
      {trips: trips, adults_count: details["adult"], children_count: details["children"], cabin: details["cabin"]}
    end
    
  end
end
