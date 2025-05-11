class SearchController < ApplicationController
  def index
    uri = URI("https://api.chucknorris.io/jokes/")
    @random = "random"
    @category = "random?category=#{params[:category]}"
    @query = "search?query={query}"
    response = Net::HTTP.get(uri)

    if params[:random]
      uri = URI("https://api.chucknorris.io/jokes/#{@random}")
      response = Net::HTTP.get(uri)
      @joke = JSON.parse(response)["value"]
    elsif params[:category]
      uri = URI("https://api.chucknorris.io/jokes/#{@category}")
      response = Net::HTTP.get(uri)
      @joke = JSON.parse(response)["value"]
    elsif params[:query]
      uri = URI("https://api.chucknorris.io/jokes/#{@query}")
      response = Net::HTTP.get(uri)
      @joke = JSON.parse(response)["value"]
    end
  end

  private
  def search_params
    params.permit(:category, :query, :random)
  end
end
