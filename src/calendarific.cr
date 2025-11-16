require "json"
require "http/client"

class Calendarific
  API_PATH = "api/v2"
  def initialize(@api_key : String)
    @headers = HTTP::Headers {
      "Content-Type" => "application/json",
      "User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36"
    }
    uri = URI.parse("https://calendarific.com")
    @http_client = HTTP::Client.new(uri)
  end

  def get_holidays(country : String, year : Int32) : JSON::Any
    JSON.parse(
      @http_client.get("/#{API_PATH}/holidays?api_key=#{@api_key}&country=#{country}&year=#{year}", headers: @headers).body)
  end

  def get_languages() : JSON::Any
    JSON.parse(
      @http_client.get("/#{API_PATH}/languages?api_key=#{@api_key}", headers: @headers).body)
  end

  def get_countries() : JSON::Any
    JSON.parse(
      @http_client.get("/#{API_PATH}/countries?api_key=#{@api_key}", headers: @headers).body)
  end
end
