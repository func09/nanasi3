# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ouroba_session',
  :secret      => '552a7731d27b0ff11fb57fa572b4a2745796887be7daf0cac42f65ae9a2ed61ded60384e3eed5bbb927e89723193d4dff25d6c142eba622f52fec0f67e879ce0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
