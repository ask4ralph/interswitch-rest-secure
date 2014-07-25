
interswitch-rest-secure

<img src="https://badge.fury.io/rb/interswitch-rest-secure.png" alt="Gem Version" />

A simple gem to scan a string, find and mask mastercard, visa and verve credit/debit card pans.


## Installation

1. Add interswitch-rest-secure to your Gemfile. 

        gem 'interswitch-rest-secure'

1. Run a bundle install on your project 

        bundle install

1. Require Interswitch Secure in your controller or helper classes

        require 'isw_rest_secure'

## Usage

1. Supply parameters required to generate the basic security headers for the Interswitch API

		#returns a hash of the required headers
	    headers = IswRestSecure.generate_auth_headers(
	      :client_id => "your client id", #visit developer.interswitchng.com to get your app key
	      :secret =>  "some secret",
	      :http_method => "POST", 
	      :url => 'https://sandbox.interswitchng.com/api/v1/authentications?key=value',
	      :tran_parameters => ["some param", "another param"] #optional array of ordered additional parameters to be signed,
	      :content_type => :json #or :xml
	    )

1. Retrieve the headers from the hash or just feed the hash into your REST client 
        
       
		#you can access the header values as follows
		authorization = headers["Authorization"]
		signature = headers["Signature"]
		timestamp = headers["Timestamp"]
		nonce = headers["Nonce"]
		signature_method = headers["SignatureMethod"]
		content_type = headers["Content-Type"]

		# Or just feed directly into RestClient 
		RestClient.post(auth_url, {'some key' => "some value"}.to_json, headers ) { |response, request, result, &block|...

		# Add additional custom headers to the hash as needed
		headers[:custom_header] => "custom header value"




