puts 'Cleaning database...'
Restaurant.destroy_all

puts 'Creating restaurants...'

restaurants = [
  {
    name: 'Dishoom',
    address: '7 Boundary St, London E2 7JE',
    phone_number: '0175 3182266',
    category: 'Indian'
  },
  {
    name: 'Le Terroirs',
    address: 'Trafalgar Square, London E2 7JE',
    phone_number: '0175 3182613',
    category: 'French'
  }
]

Restaurant.create!(restaurants)
puts 'Finished'
