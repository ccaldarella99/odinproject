require "caesar_cipher"

describe "Caesar Cipher" do
  it "should encode a string with 5" do
    s = caesar_cipher("What a string!", 5)
    s.should == "Bmfy f xywnsl!"
  end
end

describe "Caesar Cipher" do
  it "should encode a string with 25" do
    s = caesar_cipher("Hello, World", 25)
    s.should == "Gdkkn, Vnqkc"
  end
end

describe "Caesar Cipher" do
  it "using a number greater than 26" do
    s = caesar_cipher("This is a SECRET message", 57)
    s.should == "Ymnx nx f XJHWJY rjxxflj"
  end
end

describe "Caesar Cipher" do
  it "should not change the string with 0" do
    s = caesar_cipher("What a string!", 0)
    s.should == "What a string!"
  end
end

describe "Caesar Cipher" do
  it "should not change the string with 26" do
    s = caesar_cipher("What a string!", 26)
    s.should == "What a string!"
  end
end

describe "Caesar Cipher" do
  it "using a negative number" do
    s = caesar_cipher("What a string!", -37)
    s.should == "Lwpi p higxcv!"
  end
end
