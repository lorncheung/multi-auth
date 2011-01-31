class Authentication < ActiveRecord::Base

  AUTH_OPTIONS = ['facebook','twitter','google','yahoo']

  def self.create_with_omniauth(omniauth)
    create! do |authentication|
      authentication.name = omniauth["user_info"]["name"]
      authentication.uid = omniauth["uid"]
      authentication.provider = omniauth["provider"]
    end
  end



end
