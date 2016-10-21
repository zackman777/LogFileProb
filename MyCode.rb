require 'net/http'
Net::HTTP.start("s3.amazonaws.com") { |http|
  resp = http.get("/tcmg412-fall2016/http_access_log")
  open("http_access_log", "wb") { |file|
    file.write(resp.body)
  }
}

numOfRequests = 0
File.open('http_access_log').each do |line|
    if line.include? "GET" then
        numOfRequests += 1
    end
end
puts "Total number of requests: #{numOfRequests}"

numOfDayRequests = 0
datevar = ""
File.open('test').each do |line|
  if line.include? "GET" and line.include? "local" then
    datevar = line[11, 11]
  elsif line.include? "GET" and line.include? "remote" then
    datevar = line[12, 11]
  else
    datevar = ""
    numOfDayRequests += 1
  end
  if datevar != "" then
    print "#{datevar}\n"
  end
end

File.open('test').each do |line|
  if line.include? "GET" then
    space = 0
    counter = -1
    two = 0
    while space != 2
      if line[counter] == " "
        space += 1
      end
      if space != 2
        counter -= 1
      end
    end
    if line[counter + 1] == "2"
      two += 1
    end
  end
  print two
end