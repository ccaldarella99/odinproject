#write your code here

def isVowel(letter)
  isFirstLetterAVowel = false
  if(letter[0,1].downcase == "a")
    isFirstLetterAVowel = true
  elsif(letter[0,1].downcase == "e")
    isFirstLetterAVowel = true
  elsif(letter[0,1].downcase == "i")
    isFirstLetterAVowel = true
  elsif(letter[0,1].downcase == "o")
    isFirstLetterAVowel = true
  elsif(letter[0,1].downcase == "u")
    isFirstLetterAVowel = true
  end
  isFirstLetterAVowel
end


def translate(words)
  arr = words.split
  arrLength = arr.length-1
  
  for i in 0..arrLength
    if(isVowel(arr[i][0,1]))
      arr[i] += "ay"
    elsif(arr[i][0,1] == "q" && arr[i][1,1].downcase == "u")
      arr[i] = arr[i][2,arr[i].length] + arr[i][0,2] + "ay"
    elsif(!isVowel(arr[i][0,1]) && arr[i][1,1] == "q" && arr[i][2,1].downcase == "u")
      arr[i] = arr[i][3,arr[i].length] + arr[i][0,3] + "ay"
    elsif(!isVowel(arr[i][0,1]) && !isVowel(arr[i][1,1]) && !isVowel(arr[i][2,1]))
      arr[i] = arr[i][3,arr[i].length] + arr[i][0,3] + "ay"
    elsif(!isVowel(arr[i][0,1]) && !isVowel(arr[i][1,1]))
      arr[i] = arr[i][2,arr[i].length] + arr[i][0,2] + "ay"
    elsif(!isVowel(arr[i][0,1]))
      arr[i] = arr[i][1,arr[i].length] + arr[i][0,1] + "ay"
    end
  end
  arr.join(" ")
end


