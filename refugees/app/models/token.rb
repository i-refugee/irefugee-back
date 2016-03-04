class Token < ActiveRecord::Base
  belongs_to :center
  belongs_to :admin
  
  before_save :generate_unique_secure_token

  def generate_unique_secure_token
    require 'active_support/core_ext/securerandom'
    self.auth_token = SecureRandom.base58(24)
  end



end
