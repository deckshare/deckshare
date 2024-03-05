# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Pokemon::Card do
  describe 'class methods' do
    describe '.ability_names' do
      subject(:_ability_names) { described_class.ability_names }

      it {
        is_expected.to contain_exactly('Cursed Land',
                                       'Voraciousness',
                                       'Fully Blooming Energy',
                                       'Zooming Draw',
                                       'Nest Stash',
                                       'Well-Baked Body',
                                       'Clairvoyant Sense',
                                       'Infernal Reign',
                                       'Electrogenesis',
                                       'Swelling Flash',
                                       'Protective Mycelium',
                                       'Drifting Dodge',
                                       'Enriching Oil',
                                       'Super Cold',
                                       'Dazzling Gaze',
                                       'Balloon Therapy',
                                       'Quaking Demolition',
                                       'Semi-Blooming Energy',
                                       'Fire Off',
                                       'Exploding Energy',
                                       'Assaulting Hunt',
                                       'Restart',
                                       'Toxic Wetland',
                                       'Dust Field',
                                       'Electricity Pouches',
                                       'Intimidating Howl',
                                       'Transformative Start',
                                       'Freezing Disaster',
                                       'Shivery Chill',
                                       'Ardent Dancing',
                                       'Double Type',
                                       'Dino Cry',
                                       'Mischievous Lock',
                                       'Hearsay',
                                       'Strange Behavior',
                                       'Flare Veil',
                                       'Psychic Embrace',
                                       'Rumbling Engine',
                                       'Pressure',
                                       'Flying Entry',
                                       'Expanding Body',
                                       'Gather Materials',
                                       'Squawk and Seize',
                                       'Insta-Flock',
                                       'Blessed Salt',
                                       'Tandem Unit',
                                       'Mysterious Comet',
                                       'Adverse Weather',
                                       'Leadership',
                                       'Quick Search',
                                       'Fettered in Misfortune',
                                       'Safeguard',
                                       'Night Gate',
                                       'Electrical Grounding')
      }
    end

    describe '.count' do
      subject(:_count) { described_class.count }

      it { is_expected.to eq(253) }
    end

    describe '.attack_names' do
      subject(:_attack_names) { described_class.attack_names }

      it {
        is_expected.to contain_exactly('Grasping Draw',
                                       'Hypnosis',
                                       'Stompy Stomp',
                                       'Razor Leaf',
                                       'Wild Charge',
                                       'Graveyard Gamboling',
                                       'Aqua Dive',
                                       'Feint',
                                       'Strength',
                                       'Scrap Pickup',
                                       'Hypnoblast',
                                       'Monkey Beatdown',
                                       'Splup',
                                       'Play Rough',
                                       'Finest Selection',
                                       'Tiny Charge',
                                       'Knocking Hammer',
                                       'Flap',
                                       'Gentle Slap',
                                       'Dynamite Punch',
                                       'Scintillating Surfing',
                                       'Solar Beam',
                                       'Ambush',
                                       'Great Bash',
                                       'Crisis Punch',
                                       'Will-O-Wisp',
                                       'Ascension',
                                       'Forest Blast',
                                       'Punishing Scissors',
                                       'Zap Kick',
                                       'Nightmare',
                                       'Hide',
                                       'Sharp Fin',
                                       'Flowery Zephyr',
                                       'Night Eyes',
                                       'Salt Cannon',
                                       'Unseen Claw',
                                       'Rest',
                                       'Poisonous Gem',
                                       'Buster Tail',
                                       'Avenging Knuckle',
                                       'Lavish Hospitality',
                                       'Rollout',
                                       'Frost Smash',
                                       'Speed Attack',
                                       'Beat',
                                       'Speed Wing',
                                       'Swift',
                                       'Ram',
                                       'Twisting Strike',
                                       'Jet Punch',
                                       'Hail Blade',
                                       'Slow-Acting Syncope',
                                       'Last Respects',
                                       'Cinder Cannon',
                                       'Drool',
                                       'Guard Press',
                                       'Ballistic Beak',
                                       'Colorful Graffiti',
                                       'Headbutt Bounce',
                                       'Fade Out',
                                       'Shine On',
                                       'Gigantic Bolt',
                                       'Psy Bolt',
                                       'Electro Paws',
                                       'Wild Kick',
                                       'Mise en Place',
                                       'Call for Family',
                                       'Sleep Inducer',
                                       'Dominating Echo',
                                       'Needle Bone',
                                       'Chest-ouflage',
                                       'Genome Hacking',
                                       'Triple Strike',
                                       'Volcanic Heat',
                                       'Friend Tackle',
                                       'Bang Boom Chain',
                                       'Blaze Ball',
                                       'Mach Cross',
                                       'Heavy Splash',
                                       'Psychic Loop',
                                       'Ball Roll',
                                       'Scratch',
                                       'Everyone Discharge',
                                       'Magnum Punch',
                                       'Attraction Wave',
                                       'Increasing Spice',
                                       'Whimsy Tackle',
                                       'Lead',
                                       'Psybeam',
                                       'Miracle Force',
                                       'Singe',
                                       'Blaze Dash',
                                       'Covetous Ivy',
                                       'Slap',
                                       'Covert Flight',
                                       'Find a Home',
                                       'Combustion',
                                       'Head Bolt',
                                       'Family Attack',
                                       'Spit Poison',
                                       'Special Hammer',
                                       'Raging Punch',
                                       'Powerful Spin',
                                       'Heat Blast',
                                       'Mind Jack',
                                       'Electro Ball',
                                       'Flame Surge',
                                       'Heat Tackle',
                                       'Headstrike',
                                       'Ghost Eye',
                                       'Pulverizing Press',
                                       'Rolling Tackle',
                                       'Super Psy Bolt',
                                       'Growl',
                                       'Slight Intrusion',
                                       'Dark Slumber',
                                       'Dimensional Hand',
                                       'Combat Tackle',
                                       'Colony Rush',
                                       'Pin Missile',
                                       'Flare',
                                       'Mimed Games',
                                       'Razor Fin',
                                       'Bite',
                                       'Peck',
                                       'Valiant Evolution',
                                       'Dark Cutter',
                                       'Thudding Press',
                                       'Perfume Press',
                                       'Freeze-Dry',
                                       'Splashing Dodge',
                                       'Balloon Blast',
                                       'Raging Horns',
                                       'Spicy Headbutt',
                                       'Revival Blessing',
                                       'Fairy Wind',
                                       'Blustery Wind',
                                       'Magical Shot',
                                       'Spin Turn',
                                       'Apply Oil',
                                       'Knock Away',
                                       'Tackle',
                                       'Motivate',
                                       'Fickle Attack',
                                       'Thunder',
                                       'Accelerating Stab',
                                       'Bubble Drain',
                                       'Reckless Charge',
                                       'Dig Claws',
                                       'Wild Tackle',
                                       'Punch',
                                       'Nutrients',
                                       'Light Punch',
                                       'Rear Kick',
                                       'Double-Edged Slash',
                                       'Iron-Clad Roll',
                                       'Lambaste',
                                       'Psyshot',
                                       'Slim Screw',
                                       'Minor Errand-Running',
                                       'Steady Firebreathing',
                                       'Playful Kick',
                                       'Headbang',
                                       'Hack At',
                                       'Blazing Destruction',
                                       'Berry Search',
                                       'Burning Darkness',
                                       'Spray Fluid',
                                       'Land Scoop',
                                       'Super Singe',
                                       'Leer',
                                       'Into the Deep',
                                       'United Wings',
                                       'Joust',
                                       'Gust',
                                       'Jealously Singe',
                                       'Low Kick',
                                       'Tumbling Attack',
                                       'Loud Mix',
                                       'Agility',
                                       'Collect',
                                       'Photon Blaster',
                                       'Teleportation Attack',
                                       'United Thunder',
                                       'Fluffy Breeze',
                                       'Cut',
                                       'Furious Kicks',
                                       'Aqua Spark',
                                       'Slashing Claw',
                                       'Curse Spreading',
                                       'Release Rage',
                                       'Wing Attack',
                                       'Wild Impact',
                                       'Cragalanche',
                                       'Lightning Ball',
                                       'Undersea Tunnel',
                                       'Psy Ball',
                                       'Thunder Shock',
                                       'Corkscrew Punch',
                                       'Salt Coating',
                                       'Allure',
                                       'Acceleration Drive',
                                       'Rage Fist',
                                       'Enhanced Fang',
                                       'Headbutt',
                                       'Rev',
                                       'Psychic',
                                       'Double Draw',
                                       'Pierce',
                                       'Justice Kick',
                                       'Mud-Slap',
                                       'Life Sucker',
                                       'Curl Up',
                                       'Fighting Sword',
                                       'Flame Cannon',
                                       'Pika Bolt')
      }
    end

    describe '.regulation_marks' do
      subject(:_regulation_marks) { described_class.regulation_marks }

      it { is_expected.to contain_exactly('G', nil) }
    end

    describe '.subtypes' do
      subject(:_subtypes) { described_class.subtypes }

      it {
        is_expected.to contain_exactly('Ancient',
                                       'Basic',
                                       'ex',
                                       'Future',
                                       'Item',
                                       'Pokémon Tool',
                                       'Stadium',
                                       'Stage 1',
                                       'Stage 2',
                                       'Supporter',
                                       'Tera')
      }
    end

    describe '.supertypes' do
      subject(:_supertypes) { described_class.supertypes }

      it { is_expected.to contain_exactly('Pokémon', 'Trainer', 'Energy') }
    end

    describe '.types' do
      subject(:_types) { described_class.types }

      it {
        is_expected.to contain_exactly('Colorless',
                                       'Darkness',
                                       'Dragon',
                                       'Fighting',
                                       'Fire',
                                       'Grass',
                                       'Lightning',
                                       'Metal',
                                       'Psychic',
                                       'Water')
      }
    end
  end

  describe 'instance methods' do
    subject(:card) { described_class.find_by(card_id:) }

    let(:card_id) { 'sv4pt5-59' }

    describe '#printings' do
      subject(:_printings) { card.printings.pluck(:card_id) }

      it { is_expected.to contain_exactly('sv4pt5-219') }
    end

    describe '#to_param' do
      subject(:_to_param) { card.to_param }

      it { is_expected.to eq(card_id) }
    end

    describe '#to_s' do
      subject(:_to_s) { card.to_s }

      it { is_expected.to eq('Paldean Clodsire ex - Paldean Fates 59 / 91') }
    end
  end
end
