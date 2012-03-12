class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name

  has_many :authentications

  class << self
    def find_for_facebook_oauth(access_token, signed_in_resource=nil)
      data = access_token.extra.raw_info
      authentication = Authentication.new(:provider => access_token.provider,
                                          :uid => access_token.uid,
                                          :token => access_token.credentials.token)
      if user = User.where(:email => data.email).first
        user
      else
        user = User.create!(:email => data.email,
                            :first_name => data.first_name,
                            :last_name => data.last_name,
                            :password => Devise.friendly_token[0,20])
      end
      user.authentications << authentication
      user
    end
  end
end
