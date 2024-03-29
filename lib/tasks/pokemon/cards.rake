# frozen_string_literal: true

require_relative '../../../config/environment'

namespace :pokemon do
  namespace :cards do
    desc 'Load Pokémon card data'
    task load: :environment do
      total = 0

      sets = Rails.env.test? ? Pokemon::Set.where(set_id: %w[sve sv4pt5]) : Pokemon::Set.all

      sets.each do |set|
        Searchkick.callbacks(:bulk) do
          data_url = "https://github.com/PokemonTCG/pokemon-tcg-data/raw/master/cards/en/#{set.set_id}.json"
          data = URI.open(data_url)
          cards = JSON.load(data)

          total += cards.count
          puts "Loading #{cards.count} cards for #{set.name}"

          cards.map(&:with_indifferent_access).each do |card_data|
            card_id = card_data.delete(:id)
            card_data.deep_transform_keys! { |key| key.to_s.underscore }

            set.cards.unscope(:readonly).find_or_initialize_by(card_id:).update(**card_data)
          end
        end
      end

      puts "Loaded #{total} cards"
    end
  end
end
