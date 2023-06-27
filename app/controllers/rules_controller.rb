include RulesHelper


class RulesController < ApplicationController

  def info

  end

  def reindex
    system(' bundle exec rake searchkick:reindex:all')
  end

  # GET /rules
  def index
	 

	end

  def search

    if params[:q].present? 

  		if params[:q].include?('"')
        @rules = Section.search_sections_exact(params[:q])

      elsif (params[:q].include?('/'))
        # Take user query
        query = params[:q].split("/")[1]
        @rules = Rule.search_rules(query)
        # Now call hash function designed for rules
        helper = Rules_helper.new
        @rules = helper.make_results_hash_rules(@rules)
        @check = true
        render :search
        return 
     
      else
        @rules = Section.search_sections(params[:q])
      end
     
      results = Rules_helper.new
    if @rules.present?
      @rules = results.make_results_hash(@rules)
    else
      @rules = {}
      puts "Rules did not return anything !"
    end

      

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
    begin
      results = Rails.cache.read('results')
      results = JSON.parse(results)
    rescue 
     
      redirect_to context_url( id, "NIL")
      return
    end
     

    @details = results["results"][id]
    @rules_id = id
    
  end

  def context
    # This comes after details and shows entire sections 
    rule_id = params[:rule_id]
    if params[:section_id] != "NIL"
      @section_ids = JSON.parse(params[:section_id])
    else
      @section_ids = nil
    end

    @rule = Rule.find(rule_id)
    @sections = @rule.sections
    


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
