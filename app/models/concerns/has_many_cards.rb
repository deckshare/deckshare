# frozen_string_literal: true

module HasManyCards
  def add!(card, quantity: 1)
    raise RangeError, "#{quantity} not greater than 0" unless quantity.positive?

    find_or_initialize_by(card:).increment(:quantity, quantity).save!
  end

  def remove!(card, quantity: 1)
    card = find_by!(card:)

    case quantity
    when card.quantity
      card.destroy!
    when 1...card.quantity
      card.decrement(:quantity, quantity).save!
    else
      raise RangeError, "#{quantity} not in range 1..#{card.quantity}"
    end
  end
end
