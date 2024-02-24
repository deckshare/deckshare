require_relative '../../../config/environment'

namespace :pokemon do
  namespace :sets do
    desc "Load Pokémon set data"
    task :load do
      data_url = "https://github.com/PokemonTCG/pokemon-tcg-data/raw/master/sets/en.json"
      data = URI.open(data_url)
      sets = JSON.load(data)

      sets.map(&:with_indifferent_access).each do |set_data|
        set_data[:set_id] = set_id = set_data.delete(:id)
        set_data.deep_transform_keys! { |key| key.to_s.underscore }

        Pokemon::Set.find_or_initialize_by(set_id:).update(**set_data)
      end
    end
  end
end
