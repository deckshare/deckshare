# frozen_string_literal: true

class Session
  include ActiveModel::API

  attr_accessor :email, :password
end
