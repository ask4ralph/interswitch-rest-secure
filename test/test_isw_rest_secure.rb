require 'test/unit'
require 'isw_rest_secure'
require "base64"

class IswRestSecureTest < Test::Unit::TestCase

  

  def test_generate_authorization
    assert_equal "InterswitchAuth " + Base64.encode64('IKIAC48CB151885D99D0F15395F124AA6E4C24BE952D'), IswRestSecure.generate_authorization('IKIAC48CB151885D99D0F15395F124AA6E4C24BE952D')
  end


  def test_generate_auth_headers
    http_method = "POST"
    url = "https://developer.interswitchng.com"
    tran_parameters = ["44", "sum"]
    client_id  = 'IKIAC48CB151885D99D0F15395F124AA6E4C24BE952D'
    secret  = 'W60Ce5PlidQ72fMEyZ2qXlFPrStoQb004zFmtJHF5Z0='

    headers = IswRestSecure.generate_auth_headers(
      :client_id => client_id,
      :secret => secret,
      :http_method => http_method, 
      :url => url, 
      :tran_parameters => tran_parameters
    )
    #TODO test headers
  end


end
