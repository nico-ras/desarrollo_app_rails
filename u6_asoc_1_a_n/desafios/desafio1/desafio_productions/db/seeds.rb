# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Band.destroy_all 

20.times do
    band = Band.create(
        name: Faker::Music.band,
        members: rand(1..8),
        debut: Date.today - (5..30).to_a.sample.years,
        band_sort: [0, 1].sample
    )
    puts "Se creo la banda: #{band.name}"
    rand(5..15).times do
        concert = band.concerts.build(
            date: Date.today - (1..30).to_a.sample.days,
            attendace: rand(1_000..50_000),
            duration: rand(30..240)
        )
        concert.save #.build no se guarda automaticamente, en build no es necesario entregar el id de la banda porque lo recibe automaticamente.
        puts "Se creo el concierto en #{concert.date}"
    end
end
