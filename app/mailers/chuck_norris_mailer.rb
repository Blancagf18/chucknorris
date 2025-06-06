class ChuckNorrisMailer < ApplicationMailer
  default from: "blancafloresss18@gmail.com"

  def search_results
    @results = params[:results]
    @query = params[:query]

    mail(to: params[:email], subject: "Resultados de búsqueda para: #{@query}")
  end
end
