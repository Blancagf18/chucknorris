class SearchController < ApplicationController
  def index
    categories_uri = URI("https://api.chucknorris.io/jokes/categories")
    @categories = JSON.parse(Net::HTTP.get(categories_uri))

    if params[:random]
      uri = URI("https://api.chucknorris.io/jokes/random")
    elsif params[:category].present?
      uri = URI("https://api.chucknorris.io/jokes/random?category=#{params[:category]}")
    elsif params[:query].present?
      @query = params[:query]
      uri = URI("https://api.chucknorris.io/jokes/search?query=#{@query}")
    else
      uri = URI("https://api.chucknorris.io/jokes/random")
    end

    response = Net::HTTP.get(uri)
    data = JSON.parse(response)

    if data["result"]
      @results = data["result"]
      @paginated_jokes = Kaminari.paginate_array(@results).page(params[:page]).per(5)

      if params[:email].present?
        ChuckNorrisMailer.with(
          email: params[:email],
          results: @results,
          query: @query
        ).search_results.deliver_later

        flash[:notice] = t("email.sent")
      end
    else
      @joke = data["value"]
    end
  end
end
