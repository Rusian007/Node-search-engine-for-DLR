require 'elasticsearch/model'

class Rule < ApplicationRecord

 	has_many :sections 

 	searchkick

  
   
	 def self.search_rules(query)
		result_array = []
	  	search_results = Rule.search(query)
	
	 	search_results.each do |rule|
		 
			
			result = { 
			id: rule.id, 
			#section_id: rule.rule_id,
			rule_text: rule.title,
			#highlighted: highlights[:section_text] 
  
		  }
  
		  result_array << result
		end
  
		return result_array
	end

end
