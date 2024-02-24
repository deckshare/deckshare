require_relative '../../../config/environment'

namespace :pokemon do
  namespace :cards do
    desc "Load Pokémon card data"
    task :load do
      total = 0

      Pokemon::Set.all.each do |set|
        data_url = "https://github.com/PokemonTCG/pokemon-tcg-data/raw/master/cards/en/#{set.set_id}.json"
        data = URI.open(data_url)
        cards = JSON.load(data)

        total += cards.count
        puts "Loading #{cards.count} cards for #{set.name}"

        cards.map(&:with_indifferent_access).each do |card_data|
          card_data[:card_id] = card_id = card_data.delete(:id)
          card_data.deep_transform_keys! { |key| key.to_s.underscore }

          set.cards.find_or_initialize_by(card_id:).update(**card_data)
        end
      end

      puts "Loaded #{total} cards"
    end
  end
end
