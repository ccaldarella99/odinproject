class Book
# write your code here
  attr_accessor :title
  
  def title=(str)
    arr = str.split
    length = arr.length - 1
    arr[0][0,1] = arr[0][0,1].upcase
    for i in 1..length
      if(arr[i].length >3 && arr[i] != "over")
        arr[i][0,1] = arr[i][0,1].upcase
      elsif(arr[i] != "a" && arr[i] != "an" && arr[i] != "and" && arr[i] != "of" && arr[i] != "in" && arr[i] != "the")
        arr[i][0,1] = arr[i][0,1].upcase
      end
    end
    @title = arr.join(" ")
  end

end
