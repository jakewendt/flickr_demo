# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_flickr_demo_session',
  :secret      => 'f094659362707744a0535671d87f9fa810f53948a255defba457139980635ad7efcc922bcbb98db4cfc01516925d6a91edc22ec6844bc79ca5fa82948d0210df'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
