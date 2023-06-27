

class Api::V1::SearchApiController < ApplicationController
    include ApiHelper
    def hello
        render json: { message: 'Successfully Connected To Server' }
    end
    
    def search
        if params[:q].present?
          if params[:q].include?('"')
            @rules = Section.search_sections_exact(params[:q])
          else
            @rules = Section.search_sections(params[:q])
          end
      
         # results_helper = self.new
          if @rules.present?
            @rules = self.make_results_hash(@rules)
          else
            @rules = {}
            puts "Rules did not return anything!"
          end
      
          # Store data in cache Storage
         # Rails.cache.write('results', @rules.to_json)
      
          @check = true
        else
          @rules = nil
          @check = false
        end
      
        render json: { rules: @rules, check: @check }
      end

      


end
