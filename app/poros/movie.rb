class Movie
  attr_reader :title, :id, :vote_average, :genres, :runtime, :overview, :total_results, :cast, :reviews

  def initialize(results)
    @title = results[:title]
    @id = results[:id]
    @vote_average = results[:vote_average]
    @genres = results[:genres]
    @runtime = results[:runtime]
    @overview = results[:overview]
    @total_results = results[:total_results]
    @cast = results[:cast]
    @reviews = results[:reviews]
  end

  def genres_translated
    @genres.map do |genre_hash|
      genre_hash[:name]
    end
  end

end
