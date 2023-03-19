require 'elasticsearch'

# create a new Elasticsearch client object with authentication credentials
#client = Elasticsearch::Client.new(
  #url: 'https://localhost:9200/',
  #user: 'elastic',
 # password: 'iv*S=stj_yIWZfjgK=-c'
#)

# config/initializers/elasticsearch.rb
Searchkick.client_options = {
  url: ENV["ELASTICSEARCH_URL"],
  transport_options: {
    request: { timeout: 5 }
  }
}

