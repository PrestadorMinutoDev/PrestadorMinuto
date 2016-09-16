# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

operators = Operator.create([{ name: 'Default' }, { name: 'Tim' }])
cities = City.create([{ name: 'Belo Horizonte' }])
countries = Country.create([{ name: 'Brazil' }])
states = State.create([{ name: 'SP' },{ name: 'RJ' },{ name: 'MG' } ])
postalcode = PostalCode.create([{ zip_number: '30840000' }])