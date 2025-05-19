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
      jokes_array = data["result"]
      @paginated_jokes = Kaminari.paginate_array(jokes_array).page(params[:page]).per(5)
    else
      @joke = data["value"]
    end
  end
end
