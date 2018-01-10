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


puts "EventManager initialized!"
file_name = "event_attendees.csv"
form_file = "form_letter.html"


template_letter = File.read form_file

contents = CSV.open file_name, headers: true, header_converters: :symbol
contents.each do |row|
  id = row[0]
  name = row[:first_name]
  zipcode = row[:zipcode].to_s.rjust(5, '0')[0..4]
  legislators = legislators_by_zipcode(zipcode)
  
  form_letter = erb_template.result(binding)
  save_thank_you_letters(id, form_letter)
end


