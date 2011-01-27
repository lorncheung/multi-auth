require 'openid/store/filesystem'
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '158422030875905', '4059c67a930318fd73cf75d28adf0352'
  provider :twitter, 'SGGrzkZoUXjvyKdFH6zlA', '5ya4pagOOOMHjF4cQgwcHLBL9ZOZHZeeZpv7Eqr7a4'
  provider :openid, OpenID::Store::Filesystem.new('tmp')
  use OmniAuth::Strategies::OpenID, OpenID::Store::Filesystem.new('/tmp'), :name => 'yahoo', :identifier => 'yahoo.com' 
  use OmniAuth::Strategies::OpenID, OpenID::Store::Filesystem.new('/tmp'), :name => 'google', :identifier => 'https://www.google.com/accounts/o8/id' 
end 
