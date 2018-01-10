
#File.open("text.txt").each{ |line| puts line }

#text = ''
#line_count = 0
#File.open("text.txt").each do |line|
#  line_count +=1
#  text << line
#end

lines = File.readlines("text.txt")
line_count = lines.size
text = lines.join

total_characters = text.length
total_characters_nospaces = text.gsub(/\s+/,"").length

words_scan = text.scan(/\w+/).length
words_split = text.split.length

sentence_count = text.split(/\.|\?|!/).length
paragraph_count = text.split(/\n\n/).length

puts "#{line_count} lines"
puts "#{total_characters} characters"
puts "#{total_characters_nospaces} characters without spaces"
puts "#{words_scan} words, using \'scan\'"
puts "#{words_split} words, using \'split\'"
puts "#{sentence_count} sentences, using \'split\'"
puts "#{paragraph_count} paragraphs, using \'split\'\n\n"


puts "#{sentence_count/paragraph_count} sentences per paragraph (average)"
puts "#{words_split/sentence_count} words per sentence (average)\n\n"


stop_words = %w{the a by on for of are with just but and to the my I has some in}

new_text = %q{Los Angeles has some of the nicest weather in the country}
words = new_text.scan(/\w+/)
key_words = words.select { |word| !stop_words.include?(word) }

puts key_words.join(" ")






