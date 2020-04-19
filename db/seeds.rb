# frozen_string_literal: true

# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

Page.destroy_all
Product.destroy_all
Category.destroy_all
Province.destroy_all
require 'net/http'
require 'json'

Province.create(name: 'Alberta', acronym: 'AB', P_PST: 0, P_GST: 5)
Province.create(name: 'British Columbia', acronym: 'BC', P_PST: 7, P_GST: 5)
Province.create(name: 'Manitoba', acronym: 'MB', P_PST: 8, P_GST: 5)
Province.create(name: 'New Brunswick', acronym: 'NB', P_PST: 10, P_GST: 5, P_HST: 15)
Province.create(name: 'Newfoundland and Labrador', acronym: 'NL', P_PST: 10, P_GST: 5, P_HST: 15)
Province.create(name: 'Northwest Territories', acronym: 'NT', P_GST: 5)
Province.create(name: 'Nova Scotia', acronym: 'NS', P_PST: 10, P_GST: 5, P_HST: 15)
Province.create(name: 'Nunavut', acronym: 'NU', P_GST: 5)
Province.create(name: 'Ontario', acronym: 'ON', P_PST: 8, P_GST: 5, P_HST: 13)
Province.create(name: 'Prince Edward Island', acronym: 'PE', P_PST: 10, P_GST: 5, P_HST: 15)
Province.create(name: 'Québec',  acronym: 'QC', P_PST: 9.975, P_GST: 5)
Province.create(name: 'Saskatchewan', acronym: 'SK', P_PST: 6, P_GST: 5)
Province.create(name: 'Yukon', acronym: 'YK', P_GST: 5)

categories = ['Commedy', 'Crime', 'Drama', 'Romance', 'Western', 'Film Noir']

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
  commedy.each do |_key, value|
    if value['category'] == cat.name
      p = Product.create(name: value['name'], description: value['description'], price: value['price'], image: value['img_link'], is_in_stock: true, category_id: cat.id)
    end
  end

  crime.each do |_key, value|
    if value['category'] == cat.name
      p = Product.create(name: value['name'], description: value['description'], price: value['price'], image: value['img_link'], is_in_stock: true, category_id: cat.id)
    end
  end

  drama.each do |_key, value|
    if value['category'] == cat.name
      p = Product.create(name: value['name'], description: value['description'], price: value['price'], image: value['img_link'], is_in_stock: true, category_id: cat.id)
    end
  end

  romance.each do |_key, value|
    if value['category'] == cat.name
      p = Product.create(name: value['name'], description: value['description'], price: value['price'], image: value['img_link'], is_in_stock: true, category_id: cat.id)
    end
  end

  western.each do |_key, value|
    if value['category'] == cat.name
      p = Product.create(name: value['name'], description: value['description'], price: value['price'], image: value['img_link'], is_in_stock: true, category_id: cat.id)
    end
  end

  noir.each do |_key, value|
    if value['category'] == cat.name
      p = Product.create(name: value['name'], description: value['description'], price: value['price'], image: value['img_link'], is_in_stock: true, category_id: cat.id)
    end
  end
end

Page.create(title: 'About Old Movies', content: 'Fill this in.', permalink: 'about_us')
Page.create(title: 'Contact Us', content: 'Fill this in.', permalink: 'contact')

if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
end
