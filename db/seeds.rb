# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# artists = Artist.create([{name: "The Killers"}, {name: "Walk the Moon"}, {name: "Neck Deep"}, {name: "Anuel AA"}, 
#             {name: "Motley Crue"}])

# genre = Genre.create([{name: "Alternative"}, {name: "Indie"}, {name: "Pop Punk"}, {name: "Reggaeton"}, 
#             {name: "Classic Rock"}])

songs = [{title: "Mr. Brightside", artist_id: 2, genre_id: 2},
            {title: "Jenny Was a Friend of Mine", artist_id: 2, genre_id: 2},
            {title: "Shut Up And Dance", artist_id: 3, genre_id: 3},
            {title: "Quesadilla", artist_id: 3, genre_id: 3},
            {title: "When You Know", artist_id: 4, genre_id: 4},
            {title: "Telling Stories", artist_id: 4, genre_id: 4},
            {title: "No Llores Mujer", artist_id: 5, genre_id: 5},
            {title: "La Jeepeta", artist_id: 5, genre_id: 5},
            {title: "Kickstart My Heart", artist_id: 6, genre_id: 6},
            {title: "Saints of Los Angeles", artist_id: 6, genre_id: 6}
        ]

songs.each do |song|
  Song.create(song)
end

