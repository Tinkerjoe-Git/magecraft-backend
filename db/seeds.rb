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

    
        id: 500,
        name: "Allied Assault",
        text: "Up to two target creatures each get +X/+X until end of turn, where X is the number of creatures in your party. (Your party consists of up to one each of Cleric, Rogue, Warrior, and Wizard.)",
        power: 0,
        toughness: 0,
        cmc: 3,
        rarity: "Uncommon",
        card_type: "Instant",
        artist: "Josh Hass",
        colors: "[\"White\"]",
        set: "ZNR",
        flavor: "A common foe is the death of old hatreds.",
        mana_cost: "{2}{W}",
        image_url: "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=491622&type=card",
        loyalty: 0

    
)


jeskai_control.save





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
            mana_cost: data.mana_cost.to_s
        )
        cards.save
        puts "#{cards.name} generated"
    end
