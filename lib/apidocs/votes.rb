class Apidocs::Votes
  include Swagger::Blocks

  swagger_path '/messages/{message_id}/vote' do
    operation :post do
      key :description, 'Create vote'
      key :tags, ['votes']
      parameter do
        key :name, 'Authorization'
        key :in, :header
        key :description, 'Input example: Token token="value"'
        key :required, true
        key :type, :string
        key :default, 'Token token="value"'
      end
      parameter do
        key :name, :message_id
        key :in, :path
        key :description, 'Message id'
        key :required, true
        key :type, :integer
      end
      parameter do
        key :name, :vote
        key :in, :body
        key :description, 'Vote params'
        key :required, true
        schema do
          key :'$ref', :InputVote
        end
      end
      response 200 do
        key :description, 'Vote'
        schema do
          key :'$ref', :OutputVote
        end
      end
    end
  end

  swagger_path '/pings/{ping_id}/vote' do
    operation :post do
      key :description, 'Create vote'
      key :tags, ['votes']
      parameter do
        key :name, 'Authorization'
        key :in, :header
        key :description, 'Input example: Token token="value"'
        key :required, true
        key :type, :string
        key :default, 'Token token="value"'
      end
      parameter do
        key :name, :ping_id
        key :in, :path
        key :description, 'Ping id'
        key :required, true
        key :type, :integer
      end
      parameter do
        key :name, :vote
        key :in, :body
        key :description, 'Vote params'
        key :required, true
        schema do
          key :'$ref', :InputVote
        end
      end
      response 200 do
        key :description, 'Vote'
        schema do
          key :'$ref', :OutputVote
        end
      end
    end
  end

  swagger_path '/pictures/{picture_id}/vote' do
    operation :post do
      key :description, 'Create vote'
      key :tags, ['votes']
      parameter do
        key :name, 'Authorization'
        key :in, :header
        key :description, 'Input example: Token token="value"'
        key :required, true
        key :type, :string
        key :default, 'Token token="value"'
      end
      parameter do
        key :name, :picture_id
        key :in, :path
        key :description, 'Picture id'
        key :required, true
        key :type, :integer
      end
      parameter do
        key :name, :vote
        key :in, :body
        key :description, 'Vote params'
        key :required, true
        schema do
          key :'$ref', :InputVote
        end
      end
      response 200 do
        key :description, 'Vote'
        schema do
          key :'$ref', :OutputVote
        end
      end
    end
  end

  swagger_schema :InputVote do
    key :required, [:kind]
    property :kind do
      key :type, :integer
      key :enum, [:like, :dislike]
    end
  end

  swagger_schema :OutputVote do
    key :required, [:id, :user_id, :kind]
    property :id do
      key :type, :integer
    end
    property :user_id do
      key :type, :integer
    end
    property :kind do
      key :type, :string
    end
  end
end
