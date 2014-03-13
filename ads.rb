require "addressable/uri"
require "faraday"

uri = Addressable::URI.new
uri.query_values = {:data_type => "XML", :author => "^Zirm, A", :jou_pick => "NO"}
conn = Faraday.new(:url => "http://adsabs.harvard.edu")

response = conn.get '/cgi-bin/abs_connect', uri.query_values

puts response.body