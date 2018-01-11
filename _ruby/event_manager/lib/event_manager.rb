require "csv"
require 'google/apis/civicinfo_v2'
require 'erb'


template_letter = File.read "form_letter.html.erb"
erb_template = ERB.new template_letter
 

def legislators_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'
  
  begin
    civic_info.representative_info_by_address(
      address: zip,
      levels: 'country',
      roles: ['legislatorUpperBody','legislatorLowerBody']
    ).officials
  rescue
    "You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials"
  end
end

def save_thank_you_letters(id, form_letter)
  Dir.mkdir("output") unless Dir.exists? "output"
  filename = "output/thanks_#{id}.html"
  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end

def cleanPhoneNumbers(phone)
  m = /1*(\()*\d\d\d(\-|\))*\s*\.*\d\d\d\s*\-*\.*\d\d\d\d/.match(phone)
  unless(m)
    return ""
  end
  phone
end

def timeTargeting(datetime)
  time = /.*\s(\d*\d):(\d\d)/.match(datetime)
  time[1,2]
end

def dayOfTheWeek(datetime)
  date = /(\d*\d)\/(\d*\d)\/(\d\d)/.match(datetime)
  mm = date[1].to_i
  dd = date[2].to_i
  yyyy = 2000 + date[3].to_i
  d = Date.new(yyyy,mm,dd)
#  dayName(d.wday)
  d.wday
end

def dayName(num)
  days = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
  days[num]
end

def dayMax(arr)
  i = 0
  max = 0
  maxIn = 0
  arr.each do |x|
    if(x > max)
      max = x
      maxIn = i
    end
    i += 1
  end
  maxIn
end


puts "EventManager initialized!"
file_name = "event_attendees.csv"
form_file = "form_letter.html"


template_letter = File.read form_file
avgTime = 0
i = 0
dayArray = [0,0,0,0,0,0,0]

contents = CSV.open file_name, headers: true, header_converters: :symbol
contents.each do |row|
  id = row[0]
  name = row[:first_name]
  phone = cleanPhoneNumbers(row[:homephone])
  datetime = row[:regdate]
  time = timeTargeting(datetime)
  dotw = dayOfTheWeek(datetime)
#  zipcode = row[:zipcode].to_s.rjust(5, '0')[0..4]
#  legislators = legislators_by_zipcode(zipcode)
  
#  form_letter = erb_template.result(binding)
#  save_thank_you_letters(id, form_letter)
  puts "#{name} #{phone}"
  avgTime += time[0].to_i
  i += 1
  dayArray[dotw] += 1
end

freq = dayName(dayMax(dayArray))

puts "Average time of day is: #{avgTime/i}:00"
puts "Most common Day of the Week is: #{freq}"

