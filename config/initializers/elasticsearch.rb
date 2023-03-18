require 'elasticsearch'

# create a new Elasticsearch client object with authentication credentials
#client = Elasticsearch::Client.new(
  #url: 'https://localhost:9200/',
  #user: 'elastic',
 # password: 'iv*S=stj_yIWZfjgK=-c'
#)

# config/initializers/elasticsearch.rb
client = Elasticsearch::Client.new(
  cloud_id: '12241899da9a43d5a42c17e2b5f65cab:dXMtY2VudHJhbDEuZ2NwLmNsb3VkLmVzLmlvOjQ0MyQ0OGYwYTQ5OWQ5Nzg0NjlmODAwMGY0MGI1NWFmZmNjYSRjZjUzNmVhMTMyYTA0MjRmYWEyNDFhNWRlM2I0MTFkNQ==',
  api_key: { id: 'eH_V9YYBUfpF6Ugm6BIw', api_key: 'V_FVxOyTQMuexYHRqRl42A' }
)

# configure Searchkick to use the Elasticsearch client
Searchkick.client = Elasticsearch::Client.new(

  cloud_id: '12241899da9a43d5a42c17e2b5f65cab:dXMtY2VudHJhbDEuZ2NwLmNsb3VkLmVzLmlvOjQ0MyQ0OGYwYTQ5OWQ5Nzg0NjlmODAwMGY0MGI1NWFmZmNjYSRjZjUzNmVhMTMyYTA0MjRmYWEyNDFhNWRlM2I0MTFkNQ==',
  api_key: { id: 'eH_V9YYBUfpF6Ugm6BIw', api_key: 'V_FVxOyTQMuexYHRqRl42A' }
)
