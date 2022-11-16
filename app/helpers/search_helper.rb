module SearchHelper

    class SearchResults
        
        def initialize(title, section)
            @title = title.to_s.delete('[]').delete('""')
            @section = section.to_s.delete('[]').delete('""')
        end

        def returnTitle()
            return @title
        end

        def returnSection()
            return @section
        end

    end
    
end
