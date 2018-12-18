class MovieDB::APIService
    BASE_URL= 'https://api.themoviedb.org/3'
    API_KEY = 'e3e861af668ce8312bacb827e7e78bc5'

    def self.query_movie_db(query)
        results = RestClient.get("#{BASE_URL}/search/movie?api_key=#{API_KEY}&query=#{query}")

        json = JSON.parse(results)
        json["results"].each do |movie_hash|
            MovieDB::Movie.new(movie_hash)
        end
    end
    def self.query_single_movie(movie)
        if !movie.tagline 
            results = RestClient.get("#{BASE_URL}/movie/#{movie.id}?api_key=#{API_KEY}")

            json = JSON.parse(results)
            movie.update(json)
        end
    end
end