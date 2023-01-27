require 'faraday'
require 'faraday/net_http'
include SearchHelper

class SearchController < ApplicationController
    Faraday.default_adapter = :net_http

    def start

    end

    def postSearch
        queryField = params[:query].to_s
        url = "http://localhost:8983/solr/dlr_search/select?indent=true&q.op=OR&q=section:#{queryField}%2C%0Atitle:#{queryField}&sort=year desc"
        response = Faraday.get(url)
  
        body = JSON.parse(response.body)
        

        objArray=[]
    
        if !body['response']['docs'].empty?
            for record in body['response']['docs'] do 
                subsec = record['subsection']
                year = record['year']
                objArray << SearchResults.new(record['title'][0], record['section'], subsec, year)
            
        end
    end
        @activity = objArray
    end

    def all
        url = "http://127.0.0.1:8983/solr/dlr_search/select?indent=true&q.op=OR&q=*%3A*"
        response = Faraday.get(url)
  
        body = JSON.parse(response.body)
        @show = body['response']['docs'][0]['section'][0]
    end

end
