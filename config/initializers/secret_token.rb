# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
MsaarchCom::Application.config.secret_token = '021f28881c8657ae45bfe24e652c2eb1648ed27ac6810f9ea7f904d63ba44346ff632c9f0d793bc8a46ba938db93c65c89a580b01b41de6a1a36a09d748cf84b'

# TODO: This once we're sure that this doesn't apply... 
#
#    If you are relying on the ability for external applications
#    or JavaScript to be able to read your Rails app's signed
#    session cookies (or signed cookies in general) you should not
#    set secret_key_base until you have decoupled these concerns.
#
#
# MsaarchCom::Application.config.secret_key_base = ''
