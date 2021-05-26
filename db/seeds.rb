# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'mtg_sdk'


jeskai_control = Deck.new(name: 'Jeskai Control')
dredge = Deck.new(name: 'Dredge Deck')
dnt = Deck.new(name:'Death and Taxes')

jeskai_control.cards.build(
    
)


jeskai_control.save




# Collection.create(name: "Premium Collection")
# Collection.create(name: "Budget Collection")
# Collection.create(name: "Popular Collection")
# card_data = MTG::Card.where(set: 'znr').all
    

#     card_data.each do |data|
#         puts 'generating card data...'
#         cards = Card.create(
#             name: data.name,
#             text: data.text,
#             power: data.power.to_i,
#             toughness: data.toughness.to_i,
#             cmc: data.cmc.to_i,
#             rarity: data.rarity,
#             artist: data.artist,
#             flavor: data.flavor,
#             loyalty: data.loyalty.to_i,
#             image_url: data.image_url,
#             colors: data.colors.to_s,
#             set: data.set,
#             card_type: data.type,
#             mana_cost: data.mana_cost.to_s
#         )
#         cards.save
#         puts "#{cards.name} generated"
#     end
