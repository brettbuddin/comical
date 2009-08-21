# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_comics_session',
  :secret      => 'b72a12051653bd3a56c83cdc12230c447815b07c52e0bacba623e286fd2bbb2d7b5e57d80b215cf76e9208c15622550362d407807de08282442af1616b8f73c2'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
