include RulesHelper


class RulesController < ApplicationController

  def reindex
    system(' bundle exec rake searchkick:reindex:all')
  end

  # GET /rules
  def index
	 

	end

  def search

    if params[:q].present? 

  		# @rules = Rule.search(params[:q])
  		@rules = Section.search_sections(params[:q])
      
      results = Rules_helper.new
   
      @rules = results.make_results_hash(@rules)

      # Store data in cache Storage
      Rails.cache.write('results', results.to_json )

     
     
      @check = true
  	else

  		@rules = nil
      @check = false
  	end
  end


  def details
    id = params[:id]
    
     results = Rails.cache.read('results')
      results = JSON.parse(results)
     # change to sqLite

    @details = results["results"][id]
    
  end

  def upload
    if params[:json_input].present? 
      begin
        parsed_json = JSON.parse(params[:json_input].gsub(/\r\n/, ""))

        for object in parsed_json do 
        
         

          rule = Rule.create!(
            title: object['title'],
            subsection: object['subsection'],
            year: object['year']
          )

          sections = object['section']

          for section in sections do
            Section.create!(
              section_text: section,
              rule: rule
            )
          end

        end
        render json: parsed_json, status: :ok
      rescue JSON::ParserError => e
        render json: { error: e.message }, status: :unprocessable_entity
      end
      
    end
    
  end

end
