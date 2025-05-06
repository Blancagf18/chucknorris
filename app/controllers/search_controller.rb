class SearchController < ApplicationController
  def index
    uri = URI("https://api.chucknorris.io/jokes/random")
    response = Net::HTTP.get(uri)
    @joke = JSON.parse(response)["value"]
  end
end
