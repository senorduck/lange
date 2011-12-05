# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_portfolio_session',
  :secret      => '75769650b214a1b986edff1ca79639dd08aa328cbef177009a9c0091e1262a66688ff2d3c0f0c12a0eb40a015e1f250c5c75f76af27d8b8c3700b09a4d13d537'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
