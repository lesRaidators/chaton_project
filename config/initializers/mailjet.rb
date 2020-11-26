Mailjet.configure do |config|
  config.api_key = ENV['MAILJET_LOGIN']
  config.secret_key = ENV['MAILJET_PWD']
  config.default_from = 'kingcat@yopmail.com'
  config.api_version = 'v3.1'
end