# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
cats = [
  {
    name: 'Franklin',
    age: 5,
    hobbies: 'eating toilet paper',
    image: 'https://unsplash.com/photos/7DXQtl__9Cw'
  },
  {
    name: 'Solo',
    age: 2,
    hobbies: 'loves the scratching post',
    image: 'https://unsplash.com/photos/a-cat-sitting-on-t
    op-of-a-cat-tree-hgGZPMWaKjA'
  },
  {
    name: 'Belinda',
    age: 10,
    hobbies: 'biting people face while asleep',
    image: 'https://unsplash.com/photos/uhnbTZC7N9k'
  }
]

cats.each do |each_cat|
  Cat.create each_cat
  puts "creating cat #{each_cat}"
end