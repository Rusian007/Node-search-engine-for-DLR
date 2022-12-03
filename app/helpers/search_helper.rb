module SearchHelper

    class SearchResults
        
        def initialize(title, section, subsec)
            @title = title.to_s.delete('[]').delete('""')
            @section = section.to_s.delete('[]').delete('""')
            @subsection = subsec.to_s.delete('"').delete('[]')
        end

        def returnTitle()
            return @title
        end

        def returnSection()
            return @section
        end

        def returnSubSection()
            return @subsection
        end

    end
    
end
