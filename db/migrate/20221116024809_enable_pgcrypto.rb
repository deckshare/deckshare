# frozen_string_literal: true

# Enable the pgcrypto extension for UUID primary key generation.
class EnablePgcrypto < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
  end
end
