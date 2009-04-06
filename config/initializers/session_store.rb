# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_simple-notebook_session',
  :secret      => '604ec223a93f2c39a4f1c5aaa9681524e5906f2975ea7c19d6bd09f7c8acec18be4117c3cd290491c0d7b852c2febc27cab0ee7062c44b218a0483c704dd12f2'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
