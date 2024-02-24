module Types
  class ArrayOfStrings < ActiveRecord::Type::Value
    def type
      :array_of_strings
    end
  end
end
