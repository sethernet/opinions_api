require 'net/http'
require 'nokogiri'
require 'json'

module OpinionService
  class << self
    def parse(search)
      html = Net::HTTP.get(URI.parse(search))
      doc = Nokogiri::HTML(html)
      opinion_name = doc.css('.q-title').text

      if opinion_name.empty?
        @opinions = ""
      else
        yes_percentage = doc.css('.yes-text').text.split(/%/).first
        no_percentage = doc.css('.no-text').text.split(/%/).first
        yes_args = doc.css('.args-yes')
        no_args = doc.css('.args-no')

        yes_arguments = []
        no_arguments = []

        yes_args.search('li').each do |li|
          if !li.search('h2').empty?
            yes_arguments.push(
                title: li.search('h2').text,
                text: li.search('p').text,
                author: li.search('.qt a').first.text.include?("\n") ? "" : li.search('.qt a').first.text
            )
          end
        end

        no_args.search('li').each do |li|
          if !li.search('h2').empty?
            no_arguments.push(
                title: li.search('h2').text,
                text: li.search('p').text,
                author: li.search('.qt a').first.text.include?("\n") ? "" : li.search('.qt a').first.text
            )
          end
        end

        opinionJson = { opinion_name: opinion_name, yes_percentage: yes_percentage, no_percentage: no_percentage, yes_arguments: yes_arguments, no_arguments: no_arguments}
        JSON.pretty_generate(opinionJson)
      end
    end
  end
end