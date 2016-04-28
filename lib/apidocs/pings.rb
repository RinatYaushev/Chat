class Apidocs::Pings
  include Swagger::Blocks

  swagger_path '/rooms/{room_id}/pings' do
    operation :get do
      key :description, 'List of pings'
      key :tags, ['pings']
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
        key :description, 'Pings collection'
        schema do
          key :type, :array
          items do
            key :'$ref', :OutputPing
          end
        end
      end
    end
  end

  swagger_path '/rooms/{room_id}/pings' do
    operation :post do
      key :description, 'Create ping'
      key :tags, ['pings']
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
        key :name, :ping
        key :in, :body
        key :description, 'Ping params'
        key :required, true
        schema do
          key :'$ref', :InputPingSchema
        end
      end
      response 200 do
        key :description, 'Ping'
        schema do
          key :'$ref', :OutputPing
        end
      end
    end
  end

  swagger_schema :InputPingSchema do
    key :required, [:ping]
    property :ping do
      key :type, :object
    end
  end

  swagger_schema :OutputPing do
    key :required, [:id, :user_id, :room_id]
    property :id do
      key :type, :integer
    end
    property :user_id do
      key :type, :integer
    end
    property :room_id do
      key :type, :integer
    end
  end
end
