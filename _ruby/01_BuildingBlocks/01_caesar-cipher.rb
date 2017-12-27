

def caesar_cipher(words, shift)
	arr1 = []
	#words.scan(/./) { |letter| arr1 << letter }
	_ret = ""
	newShift = shift%26
	tempLetter = ""
	newLetter = ""
	tempCode = 0
	newCode = 0
	
	i=0
	while(i < words.length)
		tempCode = words[i].ord.to_i
		newCode = tempCode + newShift
		if(tempCode > 64 && tempCode < 91)
			if(newCode <= 64 || newCode >= 91)
				newCode = newCode - 26
			end
			newLetter = newCode.chr
		elsif(tempCode > 96 && tempCode < 123)
			if(newCode <= 96 || newCode >= 123)
				newCode = newCode - 26
			end
			newLetter = newCode.chr
		else
			newLetter = words[i]
		end
		arr1 << newLetter
		i +=1
	end
	
	_ret = arr1.join
	puts _ret
end


caesar_cipher("What a string!", 5)

#system('pause')
