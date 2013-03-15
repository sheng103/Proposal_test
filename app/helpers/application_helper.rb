# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
    require 'nokogiri'
  
  # get html template for the proposal and fill corresponding data in the template 
  def change_content(options = {})
    html_temp = options[:html] # html file to be modified
    page = Nokogiri::HTML.parse(open(html_temp))    
    options[:tags].each { |tag| page.xpath("//#{tag[0]}/text()")[tag[1]-1].content = tag[2] }  
    options[:divs].each { |div| page.css(div[0])[0].content = div[1]}      
    options[:html] = page.to_html   
  end
end
