# frozen_string_literal: true

module Readonly
  extend ActiveSupport::Concern

  included do
    default_scope -> { readonly }
  end
end
