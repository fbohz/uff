# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#UFF 
#location needs to be saved first.
bogota = Location.new(city: "Bogota", country: "Colombia", continent: "South America")

candelaria1 = Wall.new(active: true, address: "la candelaria", description: "colorful art collaboration of Rodez and Pez in 2018")

candelaria1.location = bogota

rodez = Artist.new(name: "Rodez",
    bio: "Rodez is a visual artist who has created and exhibited graphic art and public works in several countries worldwide. He has published over 50 books for children and adults and he has been illustrator for magazines and newspapers in America and Europe. His work is recognized through publications and exhibitions and he has obtained several awards for this. Rodez is the father of two other prominent Colombian artists, Nomanda and Malegria.",
    hometown: "Bogota",
    instagram: "https://www.instagram.com/rodez.art/",
    website: "https://www.facebook.com/pages/category/Artist/Rodez-217105104978132/"
    )

pez = Artist.new(
    name: "Pez",
    bio: "Spanish graffitti artist. Pez started painting in 1999 in his hometown Barcelona. Specifically, he got into street art writing his signature, which soon took the shape of a fish. Little by little his tags turned into the shape of a smiling blue fish, and he became a celebrity throughout Barcelona.",
    hometown: "Barcelona",
    instagram: "https://www.instagram.com/pezbarcelona/?hl=en",
    website: "https://el-pez.com/"
    )

t1 = Tag.create(name: "fantasy")
t2 = Tag.create(name: "abstract")
t3 = Tag.create(name: "urban")

candelaria1.artists += [rodez, pez]
candelaria1.tags += [t1, t2, t3]
candelaria1.save
candelaria1.artist_walls.last.update(contribution_details: "collaboration between pez and rodez")

# ACCESSING DATA e.g.
# check changes
#candelaria1.artist_walls.last.contribution_details 

#get number of artists contributing to project
# candelaria1.artists.length
#get wall city 
#candelaria1.location.city
#get artist tags
#pez.tags.first.name

#get artists locations
#pez.locations.first.city

#get bravos
#candelaria1.bravos.length

#MORE LOCATIONS
washingtondc = Location.new(city: "Washington DC", country: "United States", continent: "North America")