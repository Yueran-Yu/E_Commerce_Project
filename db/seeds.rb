# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all
Category.destroy_all

require 'net/http'
require 'json'

categories = ['Commedy','Crime','Drama','Romance','Western', 'Film Noir']

categories.each do |c|
  Category.create(name: c)
end

commedy_uri = URI('https://raw.githubusercontent.com/Yueran-Yu/Scrape-Web-Data/master/OldMoives/Outputs/commedy.json')
crime_uri = URI('https://raw.githubusercontent.com/Yueran-Yu/Scrape-Web-Data/master/OldMoives/Outputs/crime.json')
drama_uri = URI('https://raw.githubusercontent.com/Yueran-Yu/Scrape-Web-Data/master/OldMoives/Outputs/drama.json')
romance_uri = URI('https://raw.githubusercontent.com/Yueran-Yu/Scrape-Web-Data/master/OldMoives/Outputs/romance.json')
western_uri = URI('https://raw.githubusercontent.com/Yueran-Yu/Scrape-Web-Data/master/OldMoives/Outputs/western.json')
noir_uri = URI('https://raw.githubusercontent.com/Yueran-Yu/Scrape-Web-Data/master/OldMoives/Outputs/film_noir.json')

commedy_response = Net::HTTP.get(commedy_uri)
crime_response = Net::HTTP.get(crime_uri)
drama_response = Net::HTTP.get(drama_uri)
romance_response = Net::HTTP.get(romance_uri)
western_response = Net::HTTP.get(western_uri)
noir_response = Net::HTTP.get(noir_uri)

commedy = JSON.parse(commedy_response)
crime = JSON.parse(crime_response)
drama = JSON.parse(drama_response)
romance = JSON.parse(romance_response)
western = JSON.parse(western_response)
noir = JSON.parse(noir_response)


Category.all.each do |cat|
  commedy.each do |key, value|
    if value['category'] == cat.name
      Product.create(name: value['name'], description: value['description'], price: value['price'], image: value['img_link'], is_in_stock: true, category_id: cat.id)
    end
  end

  crime.each do |key, value|
    if value['category'] == cat.name
      Product.create(name: value['name'], description: value['description'], price: value['price'], image: value['img_link'], is_in_stock: true, category_id: cat.id)
    end
  end

  drama.each do |key, value|
    if value['category'] == cat.name
      Product.create(name: value['name'], description: value['description'], price: value['price'], image: value['img_link'], is_in_stock: true, category_id: cat.id)
    end
  end

  romance.each do |key, value|
    if value['category'] == cat.name
      Product.create(name: value['name'], description: value['description'], price: value['price'], image: value['img_link'], is_in_stock: true, category_id: cat.id)
    end
  end

  western.each do |key, value|
    if value['category'] == cat.name
      Product.create(name: value['name'], description: value['description'], price: value['price'], image: value['img_link'], is_in_stock: true, category_id: cat.id)
    end
  end

  noir.each do |key, value|
    if value['category'] == cat.name
      Product.create(name: value['name'], description: value['description'], price: value['price'], image: value['img_link'], is_in_stock: true, category_id: cat.id)
    end
  end
end




