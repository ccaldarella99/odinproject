require "caesar_cipher"

describe "Caesar Cipher" do
  
  it "should encode a string" do
    s = caesar_cipher("What a string!", 5)
    s.should == "Bmfy f xywnsl!"
  end
  
end