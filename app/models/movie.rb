class Movie < ActiveRecord::Base
  def self.with_ratings(ratings_list)
    # if ratings_list is an array such as ['G', 'PG', 'R'], retrieve all
    #  movies with those ratings
    # if ratings_list is nil, retrieve ALL movies
    if ratings_list.nil?
      return Movie.all
    else
      processed_ratings = [] 
      ratings_list.each do |x|
        processed_ratings.push(x.upcase)
      end
      return Movie.where(rating: processed_ratings)
    end
  end

  def self.all_ratings
    return Movie.pluck(:rating).uniq
  end
end
