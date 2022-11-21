# frozen_string_literal: true

# Set confirmed_at for the given user to the current time, if it isn't already
# set.
class ConfirmUser < Actor
  input :user

  def call
    user.update!(confirmed_at: Time.zone.now) unless user.confirmed?
  end
end
