# frozen_string_literal: true

module Pokemon
  module CardsHelper
    def card_image(card, size: :large)
      raise ArgumentError, "#{size} must be :large or :small" unless %i[large small].include?(size)

      image_tag(card.images[size], alt: card, title: card, class: 'img-fluid')
    end
  end
end
