# frozen_string_literal: true

module Searchable
  extend ActiveSupport::Concern

  included do
    extend Pagy::Searchkick

    searchkick
  end
end
