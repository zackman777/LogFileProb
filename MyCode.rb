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
puts "**********************************"
puts "|Total number of requests: #{numOfRequests}|"
puts "**********************************"
puts ""
numOfDayRequests = 0
oct94 = 0
nov = 0
dec = 0
jan = 0
feb = 0
mar = 0
apr = 0
may = 0
jun = 0
jul = 0
aug = 0
sep = 0
oct95 = 0
File.open('http_access_log').each do |line|
  if line.include? "Oct" and line.include? "1994" then
    oct94 += 1
  elsif line.include? "Nov"
    nov += 1
  elsif line.include? "Dec"
    dec += 1
  elsif line.include? "Jan"
    jan += 1
  elsif line.include? "Feb"
    feb += 1
  elsif line.include? "Mar"
    mar += 1
  elsif line.include? "Apr"
    apr += 1
  elsif line.include? "May"
    may += 1
  elsif line.include? "Jun"
    jun += 1
  elsif line.include? "Jul"
    jul += 1
  elsif line.include? "Aug"
    aug += 1
  elsif line.include? "Sep"
    sep += 1
  elsif line.include? "Oct" and line.include? "1995"
    oct95 += 1
  end
end
print "********************************\n"
print "|Number of requests per month: |\n"
print "********************************\n"
print "October, 1994:   #{oct94}\n"
print "November, 1994:  #{nov}\n"
print "December, 1994:  #{dec}\n"
print "January, 1995:   #{jan}\n"
print "February, 1995:  #{feb}\n"
print "March, 1995:     #{mar}\n"
print "April, 1995:     #{apr}\n"
print "May, 1995:       #{may}\n"
print "June, 1995:      #{jun}\n"
print "July, 1995:      #{jul}\n"
print "August, 1995:    #{aug}\n"
print "September, 1995: #{sep}\n"
print "October, 1995:   #{oct95}\n"
puts ""
fourerror = 0
File.open('http_access_log').each do |line|
  if line.include? "GET" then
    space = 0
    counter = -1
    while space != 2
      if line[counter] == " "
        space += 1
      end
      if space != 2
        counter -= 1
      end
    end
    if line[counter + 1] == "4"
      fourerror += 1
    end
  end
end
percentage = (fourerror.to_f / numOfRequests).round(2)
print "Percentage of 4xx errors: %#{percentage}"
puts ""
threeerror =  0
File.open('http_access_log').each do |line|
  if line.include? "GET" then
    space = 0
    counter = -1
    while space != 2
      if line[counter] == " "
        space += 1
      end
      if space != 2
        counter -= 1
      end
    end
    if line[counter + 1] == "3"
      threeerror += 1
    end
  end
end
percentage2 = (threeerror.to_f / numOfRequests).round(2)
print "Percentage of 3xx errors: %#{percentage2}"
puts ""
biggest = 0
biggestname = ""
File.open('http_access_log').each do |line|
  if line.include? "GET" then
    spacesize = 0
    counter = -1
    while spacesize != 1
      if line[counter] == " "
        spacesize += 1
      end
      if spacesize != 1
        counter -= 1
      end
    end
    size = line[counter + 1, (counter + 1) * -1].to_i
    if size > biggest
      biggest = size
      space2 = 0
      counter2 = -1
      while space2 != 4
        if line[counter2] == " "
          space2 += 1
        end
        if space2 != 4
          counter2 -= 1
        end
      end
      index1 = counter2 + 1
      space3 = 0
      counter3 = -1
      while space3 != 3
        if line[counter3] == " "
          space3 += 1
        end
        if space3 != 3
          counter3 -= 1
        end
      end
      index2 = counter3
      biggestname = line[index1, index2].to_s
    end
  end
end
puts ""
puts "Most requested file: #{biggestname}"