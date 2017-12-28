
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(input, dict)
	_ret = {}
  
  lowerInput = input.downcase
  dictLength = dict.length
  retArr = []
  temp = 0
  
  i=0
  while (i < dictLength)
    if(lowerInput.match(dict[i].downcase))
      temp = lowerInput.scan(dict[i].downcase).size
        _ret[dict[i]] = temp
    end
    i += 1
  end
  
	puts _ret
end


puts "TRY: \'below\'"
substrings("below", dictionary)
#=> { "below" => 1, "low" => 1 }

puts "TRY: \'Howdy partner, sit down! How's it going?\'"
substrings("Howdy partner, sit down! How's it going?", dictionary)
# => { "down" => 1, "how" => 2, "howdy" => 1,"go" => 1, "going" => 1, "it" => 2, "i" => 3, "own" => 1,"part" => 1,"partner" => 1,"sit" => 1 }

#system('pause')
