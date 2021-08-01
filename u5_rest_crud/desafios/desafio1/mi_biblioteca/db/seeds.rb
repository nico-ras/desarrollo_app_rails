# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



100.times do |i|
    current_state = Book.states.keys.sample
    Book.create(
        title: Faker::Book.title, 
        state: current_state, 
        author: Faker::Book.author, 
        loaned_date: Date.today - (i+1).days, 
        returning_date: Date.today + (i+1).days, 
        lend_to: Faker::Artist.name
    )
end