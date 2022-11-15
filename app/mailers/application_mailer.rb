# frozen_string_literal: true

# ActionMailer mailer base class.
class ApplicationMailer < ActionMailer::Base
  default from: 'support@deckshare.io'
  layout 'mailer'
end
