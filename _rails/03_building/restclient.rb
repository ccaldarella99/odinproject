class UseRestClient
  require 'rest-client'
  
  attr_accessor :input, :response, :hasResp, :search
  
  def initialize
    @search = nil
    @response = nil
    @hasResp = false
    @input = getUserInput
  end
  
  def setBool
    if(@response.code.to_i >= 200 && @response.code.to_i < 400)
      @hasResp = true
    end
  end
  
  def getClient
    @response = RestClient.get('http://bing.com/search', {params: {q: @search, go: 'Submit Query', qs: 'ds', form: 'QBLH'}})
  end
  
  def getUserInput
    @search = gets.chomp
    @input = "bing.com/search, {params: {q: #{@search}, go: Submit Query, qs: ds, form: QBLH}}"
    self.getClient
    setBool
  end
  
  def returnCode
    _ret = @hasResp ? @response.code : "Not Found"
  end
  
  def returnCookies
    _ret = @hasResp ? @response.cookies : "Not Found"
  end
  
  def returnHeaders
    _ret = @hasResp ? @response.headers : "Not Found"
  end
  
  def returnBody
    _ret = @hasResp ? @response.body : "Not Found"
  end
end

bing = UseRestClient.new()
puts "Search: #{bing.search}"
puts "Response Code: #{bing.returnCode}"
puts "Cookies: #{bing.returnCookies}"
puts "Headers: #{bing.returnHeaders}"
#puts "Body: #{bing.returnBody}"
