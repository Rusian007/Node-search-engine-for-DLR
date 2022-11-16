require 'faraday'
require 'faraday/net_http'
include SearchHelper

class SearchController < ApplicationController
    Faraday.default_adapter = :net_http

    def start

    end

    def postSearch
        queryField = params[:query].to_s
        url = "http://localhost:8983/solr/dlrsearch/select?indent=true&q.op=OR&q=section:#{queryField}"
        response = Faraday.get(url)
  
        body = JSON.parse(response.body)
        
        objArray=[]

        for record in body['response']['docs'] do 
            objArray << SearchResults.new(record['title'], record['section'])
            
        end
        @activity = objArray
    end

end
