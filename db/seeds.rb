# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

# movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# Character.create(name: 'Luke', movie: movies.first)

LineItem.destroy_all
ShoppingCart.destroy_all
OrderProduct.destroy_all
Order.destroy_all
Address.destroy_all
Province.destroy_all
Page.destroy_all
Product.destroy_all
Category.destroy_all
DeviseUser.destroy_all

require "net/http"
require "json"

categories = ["Commedy", "Crime", "Drama", "Romance", "Western", "Film Noir"]

categories.each do |c|
  Category.create(name: c)
end

commedy_uri = URI("https://raw.githubusercontent.com/Yueran-Yu/Scrape-Web-Data/master/OldMoives/Outputs/commedy.json")
crime_uri = URI("https://raw.githubusercontent.com/Yueran-Yu/Scrape-Web-Data/master/OldMoives/Outputs/crime.json")
drama_uri = URI("https://raw.githubusercontent.com/Yueran-Yu/Scrape-Web-Data/master/OldMoives/Outputs/drama.json")
romance_uri = URI("https://raw.githubusercontent.com/Yueran-Yu/Scrape-Web-Data/master/OldMoives/Outputs/romance.json")
western_uri = URI("https://raw.githubusercontent.com/Yueran-Yu/Scrape-Web-Data/master/OldMoives/Outputs/western.json")
noir_uri = URI("https://raw.githubusercontent.com/Yueran-Yu/Scrape-Web-Data/master/OldMoives/Outputs/film_noir.json")

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
    if value["category"] == cat.name
      p = Product.create(name: value["name"], description: value["description"], price: value["price"], image: value["img_link"], is_in_stock: true, category_id: cat.id)
    end
  end

  crime.each do |key, value|
    if value["category"] == cat.name
      p = Product.create(name: value["name"], description: value["description"], price: value["price"], image: value["img_link"], is_in_stock: true, category_id: cat.id)
    end
  end

  drama.each do |key, value|
    if value["category"] == cat.name
      p = Product.create(name: value["name"], description: value["description"], price: value["price"], image: value["img_link"], is_in_stock: true, category_id: cat.id)
    end
  end

  romance.each do |key, value|
    if value["category"] == cat.name
      p = Product.create(name: value["name"], description: value["description"], price: value["price"], image: value["img_link"], is_in_stock: true, category_id: cat.id)
    end
  end

  western.each do |key, value|
    if value["category"] == cat.name
      p = Product.create(name: value["name"], description: value["description"], price: value["price"], image: value["img_link"], is_in_stock: true, category_id: cat.id)
    end
  end

  noir.each do |key, value|
    if value["category"] == cat.name
      p = Product.create(name: value["name"], description: value["description"], price: value["price"], image: value["img_link"], is_in_stock: true, category_id: cat.id)
    end
  end
end

Page.create(title: "About Old Movies", content: "Fill this in.", permalink: "about_us")
Page.create(title: "Contact Us", content: "Fill this in.", permalink: "contact")

prov = [["Alberta", "AB", 0.05, 0.00, 0.00],
        ["British Columbia", "BC", 0.05, 0.07, 0.00],
        ["Manitoba", "MB", 0.05, 0.07, 0.00],
        ["New Brunswick", "NB", 0.05, 0.10, 0.15],
        ["Newfoundland and Labrador", "NL", 0.05, 0.10, 0.15],
        ["Northwest Territories", "NT", 0.00, 0.00, 0.00],
        ["Nova Scotia", "NS", 0.05, 0.10, 0.15],
        ["Nunavut", "NU", 0.00, 0.08, 0.10],
        ["Ontario", "ON", 0.05, 0.08, 0.13],
        ["Prince Edward Island", "PE", 0.00, 0.00, 0.15],
        ["Quebec", "QC", 0.09975, 0.05, 0.14975],
        ["Saskatchewan", "SK", 0.06, 0.05, 0.11],
        ["Yukon", "YT", 0.00, 0.05, 0.05]]

prov.each do |p|
  Province.create(name: p[0], acronym: p[1], P_GST: p[2], P_PST: p[3], P_HST: p[4])
end

AdminUser.create!(email: "admin@example.com", password: "password", password_confirmation: "password") if Rails.env.development?
