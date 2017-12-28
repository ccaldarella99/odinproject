#write your code here
def add(x, y)
  x+y
end

def subtract(x, y)
  x-y
end

def sum(arr)
  arr.inject(0) { | sum, add | sum+add }
end

def multiply(*args)
  args.inject(1) { |mult, prod| mult*prod }
end

def power(x, y)
  x**y
end

def factorial(f)
  f> 1 ? f * factorial(f-1) : 1
end
