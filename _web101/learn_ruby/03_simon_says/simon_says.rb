#write your code here
def echo(words)
  words
end

def shout(words)
  words.upcase
end

def repeat(words, *args)
  allwords = words
  if (args.length < 1)
    allwords = allwords + " " + words
  else
    for i in 2..args[0]
      allwords = allwords + " " + words
    end
  end
  allwords
#  puts allwords
end

def start_of_word(words, n)
  words[0,n]
end

def first_word(words)
  arr = words.split
  arr[0]
end

def titleize(words)
  arr = words.split
  length = arr.length - 1
  arr[0][0,1] = arr[0][0,1].upcase
  for i in 1..length
    if(arr[i].length >3 && arr[i] != "over")
      arr[i][0,1] = arr[i][0,1].upcase
    end
  end
  arr.join(" ")
end

