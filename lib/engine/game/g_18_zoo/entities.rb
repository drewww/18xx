# frozen_string_literal: true

module Engine
  module Game
    module G18ZOO
      module Entities
        COMPANIES = [
          {
            sym: 'HOLIDAY',
            name: 'Holiday',
            value: 3,
            desc: 'Choose a family, its reputation mark goes one tick to the right.',
            abilities: [{ type: 'no_buy', owner_type: 'player' }],
          },
          {
            sym: 'MIDAS',
            name: 'Midas',
            value: 2,
            desc: 'When turn order is appointed, seize the Priority (Squirrel 1).',
            abilities: [{ type: 'no_buy', owner_type: 'player' }],
          },
          {
            sym: 'TOO_MUCH_RESPONSIBILITY',
            name: 'Too much responsibility',
            value: 1,
            desc: 'Get 3$N.',
            abilities: [{ type: 'no_buy', owner_type: 'player' },
                        { type: 'description', description: 'Get 3$N', when: 'any' }],
          },
          {
            sym: 'LEPRECHAUN_POT_OF_GOLD',
            name: 'Leprechaun pot of gold',
            value: 2,
            desc: 'Earn 2$N now, and at the start of each SR.',
            abilities: [{ type: 'no_buy', owner_type: 'player' }],
          },
          {
            sym: 'IT_IS_ALL_GREEK_TO_ME',
            name: 'It’s all greek to me',
            value: 2,
            desc: 'After your action in a SR, do another one.',
            abilities: [{ type: 'no_buy', owner_type: 'player' }],
          },
          {
            sym: 'WHATSUP',
            name: 'Whatsup',
            value: 3,
            desc: 'During SR, a family can buy the first available squirrel, deactivated. Reputation moves one tick.',
            abilities: [{ type: 'no_buy', owner_type: 'player' }],
          },
          {
            sym: 'RABBITS',
            name: 'Rabbits',
            value: 3,
            desc: 'Two bonus upgrades, even illegal or before the phase.',
            abilities: [
              {
                type: 'tile_lay',
                owner_type: 'corporation',
                closed_when_used_up: true,
                connect: false,
                count: 2,
                special: true,
                reachable: true,
                must_lay_together: false,
                when: 'owning_corp_or_turn',
                tiles: [],
                hexes: [],
              },
            ],
          },
          {
            sym: 'MOLES',
            name: 'Moles',
            value: 3,
            desc: '4 special tiles, that can upgrade any plain tiles, even illegal.',
            abilities: [
              {
                type: 'tile_lay',
                owner_type: 'corporation',
                closed_when_used_up: true,
                connect: false,
                count: 4,
                special: true,
                reachable: true,
                must_lay_together: false,
                when: 'owning_corp_or_turn',
                tiles: %w[80 X80 81 X81 82 X82 83 X83],
                hexes: [],
              },
            ],
          },
          {
            sym: 'ANCIENT_MAPS',
            name: 'Ancient maps',
            value: 1,
            desc: 'Build two additional yellow tiles.',
            abilities: [
              {
                type: 'tile_lay',
                owner_type: 'corporation',
                closed_when_used_up: true,
                connect: false,
                count: 2,
                special: false,
                reachable: true,
                must_lay_together: true,
                when: 'owning_corp_or_turn',
                tiles: %w[],
                hexes: [],
              },
            ],
          },
          {
            sym: 'HOLE',
            name: 'Hole',
            value: 2,
            desc: 'Mark two R areas anywhere on the map, so they are connected.',
            abilities: [
              {
                type: 'assign_hexes',
                when: 'owning_corp_or_turn',
                count: 2,
                hexes: [],
                owner_type: 'corporation',
              },
            ],
          },
          {
            sym: 'ON_DIET',
            name: 'On diet',
            value: 3,
            desc: 'Put a depot in addition to the allowed spaces.',
            abilities: [
              {
                type: 'token',
                owner_type: 'corporation',
                price: 0,
                extra_slot: true,
                from_owner: true,
                when: 'owning_corp_or_turn',
                hexes: [],
              },
            ],
          },
          {
            sym: 'SPARKLING_GOLD',
            name: 'Sparkling gold',
            value: 1,
            desc: 'Get 2$N / 1$N when you build on a M / MM tile.',
            abilities: [
              {
                type: 'tile_discount',
                discount: 2,
                owner_type: 'corporation',
              },
              {
                type: 'tile_income',
                income: 1,
                terrain: 'mountain',
                owner_type: 'corporation',
                owner_only: true,
              },
              {
                type: 'tile_income',
                income: 2,
                terrain: 'hill',
                owner_type: 'corporation',
                owner_only: true,
              },
            ],
          },
          {
            sym: 'THAT_IS_MINE',
            name: "That's mine!",
            value: 2,
            desc: 'Book anywhere an open place for a station tile.',
          },
          {
            sym: 'WORK_IN_PROGRESS',
            name: 'Work in progress',
            value: 2,
            desc: 'Block anywhere a free place of a station tile.',
          },
          {
            sym: 'CORN',
            name: 'Corn',
            value: 2,
            desc: 'Chooses a tile with its own depot; the station worths +30.',
            abilities: [
              {
                type: 'assign_hexes',
                when: 'owning_corp_or_turn',
                hexes: [],
                owner_type: 'corporation',
              },
              {
                type: 'assign_corporation',
                when: 'sold',
                owner_type: 'corporation',
              },
            ],
          },
          {
            sym: 'TWO_BARRELS',
            name: 'Two barrels',
            value: 2,
            desc: 'Use twice, to double the value of all O tiles – don’t collect the O in treasury.',
            abilities: [
              {
                type: 'description',
                description: 'Double O tiles',
                owner_type: 'corporation',
                count: 2,
                when: 'route',
                count_per_or: 1,
              },
            ],
          },
          {
            sym: 'A_SQUEEZE',
            name: 'A squeeze',
            value: 2,
            desc: 'Take an additional 3$N if at least one squirrel runs an O.',
          },
          {
            sym: 'BANDAGE',
            name: 'Bandage',
            value: 1,
            desc: 'Mark a squirrel – it runs as a 1S. It cannot be sold; but can be dismissed'\
            ' (otherwise family cannot purchase new squirrel).',
          },
          {
            sym: 'WINGS',
            name: 'Wings',
            value: 2,
            desc: 'During the run, a squirrel at will can skip a tokened-out station.',
          },
          {
            sym: 'A_SPOONFUL_OF_SUGAR',
            name: 'A spoonful of sugar',
            value: 3,
            desc: 'A squirrel at will runs one more station - not applicable to 4J or 2J.',
          },
        ].freeze

        CORPORATIONS = [
          {
            sym: 'CR',
            float_percent: 20,
            name: '(H1) CROCODILES',
            logo: '18_zoo/crocodile',
            shares: [40, 20, 20, 20, 20],
            max_ownership_percent: 120,
            always_market_price: true,
            tokens: [0, 2, 4, 4],
            color: '#00af14',
          },
          {
            sym: 'GI',
            float_percent: 20,
            name: '(H2) GIRAFFES',
            logo: '18_zoo/giraffe',
            shares: [40, 20, 20, 20, 20],
            max_ownership_percent: 120,
            always_market_price: true,
            tokens: [0, 2],
            color: '#fff793',
            text_color: 'black',
          },
          {
            sym: 'PB',
            float_percent: 20,
            name: '(H3) POLAR BEARS',
            logo: '18_zoo/polar-bear',
            shares: [40, 20, 20, 20, 20],
            max_ownership_percent: 120,
            always_market_price: true,
            tokens: [0, 2, 4, 4],
            color: '#efebeb',
            text_color: 'black',
          },
          {
            sym: 'PE',
            float_percent: 20,
            name: '(H4) PENGUINS',
            logo: '18_zoo/penguin',
            shares: [40, 20, 20, 20, 20],
            max_ownership_percent: 120,
            always_market_price: true,
            tokens: [0, 2, 4, 4],
            color: '#55b7b7',
            text_color: 'black',
          },
          {
            sym: 'LI',
            float_percent: 20,
            name: '(H5) LIONS',
            logo: '18_zoo/lion',
            shares: [40, 20, 20, 20, 20],
            max_ownership_percent: 120,
            always_market_price: true,
            tokens: [0, 2, 4],
            color: '#df251a',
          },
          {
            sym: 'TI',
            float_percent: 20,
            name: '(H6) TIGERS',
            logo: '18_zoo/tiger',
            shares: [40, 20, 20, 20, 20],
            max_ownership_percent: 120,
            always_market_price: true,
            tokens: [0, 2],
            color: '#ffa023',
            text_color: 'black',
          },
          {
            sym: 'BB',
            float_percent: 20,
            name: '(H7) BROWN BEAR',
            logo: '18_zoo/brown-bear',
            shares: [40, 20, 20, 20, 20],
            max_ownership_percent: 120,
            always_market_price: true,
            tokens: [0, 2, 4],
            color: '#ae6d1d',
          },
          {
            sym: 'EL',
            float_percent: 20,
            name: '(H8) ELEPHANT',
            logo: '18_zoo/elephant',
            shares: [40, 20, 20, 20, 20],
            max_ownership_percent: 120,
            always_market_price: true,
            tokens: [0, 2, 4],
            color: '#858585',
          },
        ].freeze

        CORPORATIONS_BY_MAP = {
          map_a: %w[GI PB PE LI TI],
          map_b: %w[CR GI PB PE BB],
          map_c: %w[CR LI TI BB EL],
          map_d: %w[CR GI PB PE LI TI BB],
          map_e: %w[CR GI PB PE TI BB EL],
          map_f: %w[CR GI PE LI TI BB EL],
        }.freeze

        CORPORATION_COORDINATES_BY_MAP = {
          map_a: { 'GI' => 'K9', 'PB' => 'N10', 'PE' => 'K17', 'LI' => 'E15', 'TI' => 'H14' },
          map_b: { 'CR' => 'H3', 'GI' => 'K10', 'PB' => 'N11', 'PE' => 'K18', 'BB' => 'I6' },
          map_c: { 'CR' => 'I3', 'LI' => 'F16', 'TI' => 'I15', 'BB' => 'J6', 'EL' => 'E5' },
          map_d: {
            'CR' => 'H3',
            'GI' => 'K10',
            'PB' => 'N11',
            'PE' => 'K18',
            'LI' => 'E16',
            'TI' => 'H15',
            'BB' => 'I6',
          },
          map_e: {
            'CR' => 'H3',
            'GI' => 'K10',
            'PB' => 'N11',
            'PE' => 'K18',
            'TI' => 'H15',
            'BB' => 'I6',
            'EL' => 'D5',
          },
          map_f: {
            'CR' => 'I3',
            'GI' => 'L10',
            'PE' => 'L18',
            'LI' => 'F16',
            'TI' => 'I15',
            'BB' => 'J6',
            'EL' => 'E5',
          },
        }.freeze
      end
    end
  end
end
