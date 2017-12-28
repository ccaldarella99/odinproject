class Timer
  #write your code here
  attr_accessor :seconds, :time_string
  
  def initialize
    @seconds = 00
    @time_string = "00:00:00"
  end
  
  def seconds=(sec)
    min=0
    hr=0
    if sec<60
      @seconds = sec
    elsif sec > 3600
      hr = sec.to_i / 3600
      min = (sec-(hr * 3600)).to_i / 60
      @seconds = sec.to_i % 60
    else
      min = sec.to_i / 60
      @seconds = sec.to_i % 60
    end
    @seconds = padded(@seconds)
    @time_string = "#{padded(hr)}:#{padded(min)}:#{@seconds}"
  end
  
  def padded(input)
    output = "00"
    if input < 10
      output="0#{input}"
    else
      output = input
    end
    "#{output}"
  end
end
