require 'elasticsearch/model'

class Rule < ApplicationRecord

 	has_many :sections 

 	searchkick

  

end
