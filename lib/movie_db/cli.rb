class MovieDB::CLI

    def start
        puts "Welcome to the Movie DB CLI!!!"
        menu
    end

    def menu
        puts "What movie would you like to search for?"

        input = gets.strip

        MovieDB::APIService.query_movie_db(input)

        MovieDB::Movie.all.each.with_index(1) do |m, i|
            puts "#{i}. #{m.title}"
        end

        puts "What movie would you like to view information on?"

        input = gets.strip

        movie = MovieDB::Movie.all[input.to_i - 1]

        MovieDB::APIService.query_single_movie(movie)

        puts "Revenue: #{movie.revenue}"
        puts "Budget: #{movie.budget}"
        puts "Tagline: #{movie.tagline}"
    end

end