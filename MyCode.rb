require 'net/http'
Net::HTTP.start("s3.amazonaws.com") { |http|
  resp = http.get("/tcmg412-fall2016/http_access_log")
  open("http_access_log", "wb") { |file|
    file.write(resp.body)
  }
}

