Rails.root.glob('lib/types/**/*.rb').sort.each { |f| require f }

ActiveModel::Type.register(:array_of_strings, Types::ArrayOfStrings)
