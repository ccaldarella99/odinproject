

def fibs(n)
	return n if(n == 0 || n == 1)

	_ret = 1
	previous=0
	(n-1).times do
		tmp = _ret
		_ret = previous + tmp
		previous = tmp
	end
	_ret
end


def fibs_rec(n)
	return n < 2 ? n : fibs_rec(n-1) + fibs_rec(n-2)
end


puts fibs(5)
puts fibs_rec(6)

#system('pause')
