# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#require 'mtg_sdk'

# User.create_admin


 jeskai_control = Deck.new(name: 'Jeskai Control')
 dredge = Deck.new(name: 'Dredge Deck')
 dnt = Deck.new(name:'Death and Taxes')

jeskai_control.cards.build(

        id: 500, name: "Divine Gambit", text: "Exile target artifact, creature, or enchantment an...", power: 0, toughness: 0, cmc: 2, rarity: "Uncommon", card_type: "Sorcery", artist: "Joe Slucher", colors: "[\"White\"]", set: "KHM", flavor: "There are rules, and then there are gods.", mana_cost: "{W}{W}", image_url: "http://gatherer.wizards.com/Handlers/Image.ashx?mu...", loyalty: 0
    
)

jeskai_control.cards.build(
        id: 501, name: "Axgard Braggart", text: "Boast — {1}{W}: Untap Axgard Braggart. Put a +1/+1...", power: 3, toughness: 3, cmc: 4, rarity: "Common", card_type: "Creature — Dwarf Warrior", artist: "Svetlin Velinov", colors: "[\"White\"]", set: "KHM", flavor: "\"Heavy? Ha! The Trollking of Mossrun was heavy, an...", mana_cost: "{3}{W}", image_url: "http://gatherer.wizards.com/Handlers/Image.ashx?mu...", loyalty: 0

)

dredge.cards.build(
        id: 502, name: "Battershield Warrior", text: "Boast — {1}{W}: Creatures you control get +1/+1 un...", power: 2, toughness: 2, cmc: 3, rarity: "Uncommon", card_type: "Creature — Human Warrior", artist: "Colin Boyer", colors: "[\"White\"]", set: "KHM", flavor: "\"I need no axe to best these weaklings.\"", mana_cost: "{2}{W}", image_url: "http://gatherer.wizards.com/Handlers/Image.ashx?mu...", loyalty: 0
)

dredge.cards.build(
        id: 503, name: "Bound in Gold", text: "Enchant permanent\nEnchanted permanent can't attack...", power: 0, toughness: 0, cmc: 3, rarity: "Common", card_type: "Enchantment — Aura", artist: "Victor Adame Minguez", colors: "[\"White\"]", set: "KHM", flavor: "\"Trespassers will be smelted.\"\n—Axgard inscription", mana_cost: "{2}{W}", image_url: "http://gatherer.wizards.com/Handlers/Image.ashx?mu...", loyalty: 0
)

dnt.cards.build(
        id: 504, name: "Clarion Spirit", text: "Whenever you cast your second spell each turn, cre...", power: 2, toughness: 2, cmc: 2, rarity: "Uncommon", card_type: "Creature — Spirit", artist: "Anastasia Ovchinnikova", colors: "[\"White\"]", set: "KHM", flavor: "To the living, the horn sounds faint and mournful,...", mana_cost: "{1}{W}", image_url: "http://gatherer.wizards.com/Handlers/Image.ashx?mu...", loyalty: 0
)

dnt.cards.build(
        id: 505, name: "Codespell Cleric", text: "Vigilance\nWhen Codespell Cleric enters the battlef...", power: 1, toughness: 1, cmc: 1, rarity: "Common", card_type: "Creature — Human Cleric", artist: "Manuel Castañón", colors: "[\"White\"]", set: "KHM", flavor: "\"Today we are not Beskir or Tuskeri. We must fight...", mana_cost: "{W}", image_url: "http://gatherer.wizards.com/Handlers/Image.ashx?mu...", loyalty: 0
)


jeskai_control.save
dredge.save
dnt.save





card_data = MTG::Card.where(set: 'znr').all
    

    card_data.each do |data|
        puts 'generating card data...'
        cards = Card.create(
            name: data.name,
            text: data.text,
            power: data.power.to_i,
            toughness: data.toughness.to_i,
            cmc: data.cmc.to_i,
            rarity: data.rarity,
            artist: data.artist,
            flavor: data.flavor,
            loyalty: data.loyalty.to_i,
            image_url: data.image_url,
            colors: data.colors.to_s,
            set: data.set,
            card_type: data.type,
            mana_cost: data.mana_cost.to_s,
            multiverse_id: data.multiverse_id
        )
        cards.save
        puts "#{cards.name} generated"
    end


#     set_data = MTG::Set.all
    

#         set_data.each do |data|
#         puts 'generating set data...'
#         sets = MtgSet.create(
#             name: data.name,
#             code: data.code,
#             release_date: data.release_date,
            

#         )
#         sets.save
#         puts "#{sets.name} generated"
#     end

    




#     formats = ['Standard', 'Historic', 'Modern', 'Legacy', 'Vintage', 'Commander']
