require 'open-uri'
open('http_access_log', 'wb') do |file|
  file << open('https://s3.amazonaws.com/tcmg412-fall2016/http_access_log').read
end