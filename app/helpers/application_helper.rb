# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def current_user?
    current_user.present?
  end
end
