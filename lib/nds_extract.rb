# Provided, don't edit
require 'directors_database'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point

def movies_with_director_key(name, movies_collection)
  dir_movie_array = []
  movie_index = 0
  while movie_index < movies_collection.length do
    dir_movie_array << movie_with_director_name(name, movies_collection[movie_index])
    movie_index += 1
  end
  dir_movie_array
end

def gross_per_studio(collection)
  total_per_studio = {}
  index = 0
  while index < collection.length do
   studio = collection[index][:studio]
    gross = collection[index][:worldwide_gross]
    if !total_per_studio[studio]
      total_per_studio[studio] = gross
    else
      total_per_studio[studio] += gross
    end
  index += 1
  end
  total_per_studio
end

def movies_with_directors_set(source)
  dir_index = 0
  directors_set = []
  while dir_index < source.length do
    cur_director = source[dir_index][:name]
    movies_array = source[dir_index][:movies]
    mov_index = 0
    while mov_index < movies_array.length do
      movies_array[mov_index][:director_name] = cur_director
      mov_index += 1
    end
    directors_set << movies_array
    dir_index += 1
  end
  directors_set
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
