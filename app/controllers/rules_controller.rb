include RulesHelper

class RulesController < ApplicationController

  # GET /rules
  def index
 
	end

  def search

    if params[:q].present? 

  		# @rules = Rule.search(params[:q])
  		@rules = Section.search_sections(params[:q])
      
      results = Rules_helper.new
   
      @rules = results.make_results_hash(@rules)
      cookies[:results] = results.to_json
      @check = true
  	else

  		@rules = nil
      @check = false
  	end
  end


  def details
    id = params[:id]
    results = JSON.parse(cookies[:results])
    
    @details = results["results"][id]
    
  end

end
