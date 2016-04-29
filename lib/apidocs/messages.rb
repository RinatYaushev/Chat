class Apidocs::Messages
  include Swagger::Blocks

  swagger_path '/rooms/{room_id}/messages' do
    operation :get do
      key :description, 'List of messages'
      key :tags, ['messages']
      parameter do
        key :name, 'Authorization'
        key :in, :header
        key :description, 'Input example: Token token="value"'
        key :required, true
        key :type, :string
        key :default, 'Token token="value"'
      end
      parameter do
        key :name, :room_id
        key :in, :path
        key :description, 'Room id'
        key :required, true
        key :type, :integer
      end
      response 200 do
        key :description, 'Messages collection'
        schema do
          key :type, :array
          items do
            key :'$ref', :OutputMessage
          end
        end
      end
    end
  end

  swagger_path '/rooms/{room_id}/messages' do
    operation :post do
      key :description, 'Create message'
      key :tags, ['messages']
      parameter do
        key :name, 'Authorization'
        key :in, :header
        key :description, 'Input example: Token token="value"'
        key :required, true
        key :type, :string
        key :default, 'Token token="value"'
      end
      parameter do
        key :name, :room_id
        key :in, :path
        key :description, 'Room id'
        key :required, true
        key :type, :integer
      end
      parameter do
        key :name, :message
        key :in, :body
        key :description, 'Message params'
        key :required, true
        schema do
          key :'$ref', :InputMessageSchema
        end
      end
      response 200 do
        key :description, 'Message'
        schema do
          key :'$ref', :OutputMessage
        end
      end
      response 422 do
        schema do
          key :'$ref', :MessageErrors
        end
      end
    end
  end

  swagger_schema :InputMessageSchema do
    key :required, [:message]
    property :message do
      key :type, :object
      key :properties, {
        content: {
          type: :string
        }
      }
    end
  end

  swagger_schema :OutputMessage do
    key :required, [:id, :content, :user_id, :room_id]
    property :id do
      key :type, :integer
    end
    property :content do
      key :type, :string
    end
    property :user_id do
      key :type, :integer
    end
    property :room_id do
      key :type, :integer
    end
  end

  swagger_schema :MessageErrors do
    property :errors do
      property :content do
        key :type, :array
        items do
          key :type, :string
        end
      end
    end
  end
end
