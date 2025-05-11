class SearchController < ApplicationController
  def index
    categories_uri = URI("https://api.chucknorris.io/jokes/categories")
    @categories = JSON.parse(Net::HTTP.get(categories_uri))

    if params[:random]
      uri = URI("https://api.chucknorris.io/jokes/random")
    elsif params[:category].present?
      uri = URI("https://api.chucknorris.io/jokes/random?category=#{params[:category]}")
    elsif params[:query].present?
      uri = URI("https://api.chucknorris.io/jokes/search?query=#{params[:query]}")
    else
      uri = URI("https://api.chucknorris.io/jokes/random")
    end

    response = Net::HTTP.get(uri)
    data = JSON.parse(response)

    if data["result"]
      @joke = data["result"].sample["value"]
    else
      @joke = data["value"]
    end
  end
end
