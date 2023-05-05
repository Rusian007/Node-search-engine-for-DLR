class Section < ApplicationRecord
  belongs_to :rule
  searchkick highlight: [:section_text]

   
  def self.search_sections(query)
  	result_array = []
    search_results = Section.search(query, includes: [:rule], highlight: true)
  
   search_results.with_highlights.each do |section, highlights|
   	
  		


  		result = { 
          id: section.id, 
          rule_id: section.rule_id,
          section_text: section.section_text,
          highlighted: highlights[:section_text] 

        }

        result_array << result
	  end

	  return result_array
  end

  def self.search_sections_exact(query)
  	result_array = []
    search_results = Section.search(query, includes: [:rule], match: :phrase, highlight: true)
  
   search_results.with_highlights.each do |section, highlights|
   	
  		


  		result = { 
          id: section.id, 
          rule_id: section.rule_id,
          section_text: section.section_text,
          highlighted: highlights[:section_text] 

        }

        result_array << result
	  end
    puts(result_array)
	  return result_array
  end
  
  
  
end
