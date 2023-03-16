module RulesHelper
	class Rules_helper

    

		def make_results_hash(rules)

      
      rule_hash = {}
      # Initialize an empty results hash
      @results = {}

                  # Loop through each hash object in search_results
      rules.each do |hash_object|
        # Find the rule using the rule_id from the hash object
        rule = Rule.find(hash_object[:rule_id])

        # Get the rule_id from the rule object
        rule_id = rule.id

        # Check if the rule_id already exists in the results hash
        if @results.key?(rule_id)
          # If the rule_id exists, append the highlighted section_text to the existing section_text array
        @results[rule_id][:section_text] <<  hash_object[:section_text]
        @results[rule_id][:highlighted] <<  hash_object[:highlighted]
        @results[rule_id][:subsection] <<  rule.subsection
        @results[rule_id][:year] <<  rule.year

        else
          # If the rule_id doesn't exist, create a new hash object with the title and section_text array
        @results[rule_id] = { 
          title: rule.title, 
          section_text: [hash_object[:section_text]],
          highlighted: [hash_object[:highlighted]],
          subsection: rule.subsection,
          year: rule.year
        }

        end
      end
        @results
		end

    def return_details(id)
    
       @results[id]
      
    end
		

	end

	
end
