# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

City.create(:location => "Boston/Cambridge", zipcode: '02446')
City.create(:location => "New York City", zipcode: '74030')
City.create(location: "Boulder", zipcode: "80303")
City.create(location: "Denver", zipcode: "80202")
