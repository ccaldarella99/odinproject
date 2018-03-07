require "Enumerable"

array1 = [1,3,6,2,9,4,3,6,0,11]
array2 = [1,3,6,2,9,4,3,6,11]
array3 = [2,2,4,8]
array4 = [1,2,3,4,5,-4,-5]
array5 = [-1,-2,-3,-4,-5, 6]
array6 = [1,2,3,4,5]

describe Enumerable do
  it "should enumrate an array" do
    s = array1.my_each { |a| "Value #{a}" }
    s.should == array1
  end
end

describe Enumerable do
  it "should enumrate the Evens only" do
    s = array2.my_select { |num| num.even? }
    s.should == [6,2,4,6]
  end
end

describe Enumerable do
  it "should return true if all are greater than 0" do
 	  s = array3.my_all? { |num| num > 0 }
    s.should == true
  end
end

describe Enumerable do
  it "should return true if any are greater than 0" do
 	  s = array4.my_any? { |num| num > 0 }
    s.should == true
  end
end

describe Enumerable do
  it "should return false if any are greater than 0" do
 	  s = array5.my_none? { |num| num > 0 }
    s.should == false
  end
end

describe Enumerable do
  it "should count items in array" do
 	  s = array6.my_count { |y| y%2==0 }
    s.should == 5
  end
end

