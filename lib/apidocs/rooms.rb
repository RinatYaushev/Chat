class Apidocs::Rooms
  include Swagger::Blocks

  swagger_path '/rooms' do
    operation :get do
      key :description, 'List of rooms'
      key :tags, ['rooms']
      parameter do
        key :name, 'Authorization'
        key :in, :header
        key :description, 'Input example: Token token="value"'
        key :required, true
        key :type, :string
        key :default, 'Token token="value"'
      end
      response 200 do
        key :description, 'Rooms collection'
        schema do
          key :type, :array
          items do
            key :'$ref', :OutputRoom
          end
        end
      end
    end
  end

  swagger_path '/rooms/{id}' do
    operation :get do
      key :description, 'Show room'
      key :tags, ['rooms']
      parameter do
        key :name, 'Authorization'
        key :in, :header
        key :description, 'Input example: Token token="value"'
        key :required, true
        key :type, :string
        key :default, 'Token token="value"'
      end
      parameter do
        key :name, :id
        key :in, :path
        key :required, true
        key :type, :integer
      end
      response 200 do
        key :description, 'Room'
        schema do
          key :'$ref', :OutputRoom
        end
      end
    end
  end

  swagger_path '/rooms' do
    operation :post do
      key :description, 'Create room'
      key :tags, ['rooms']
      parameter do
        key :name, 'Authorization'
        key :in, :header
        key :description, 'Input example: Token token="value"'
        key :required, true
        key :type, :string
        key :default, 'Token token="value"'
      end
      parameter do
        key :name, :room
        key :in, :body
        key :description, 'Room params'
        key :required, true
        schema do
          key :'$ref', :InputRoomSchema
        end
      end
      response 200 do
        key :description, 'Room'
        schema do
          key :'$ref', :OutputRoom
        end
      end
      response 422 do
        schema do
          key :'$ref', :RoomErrors
        end
      end
    end
  end

  swagger_path '/rooms/{id}' do
    operation :patch do
      key :description, 'Update room'
      key :tags, ['rooms']
      parameter do
        key :name, 'Authorization'
        key :in, :header
        key :description, 'Input example: Token token="value"'
        key :required, true
        key :type, :string
        key :default, 'Token token="value"'
      end
      parameter do
        key :name, :id
        key :in, :path
        key :description, 'Room id'
        key :required, true
        key :type, :integer
      end
      parameter do
        key :name, :room
        key :in, :body
        key :description, 'Room params'
        key :required, true
        schema do
          key :'$ref', :InputRoomSchema
        end
      end
      response 200 do
        key :description, 'Room'
        schema do
          key :'$ref', :OutputRoom
        end
      end
      response 422 do
        schema do
          key :'$ref', :RoomErrors
        end
      end
    end
  end

  swagger_path '/rooms/{id}' do
    operation :delete do
      key :description, 'Delete room'
      key :tags, ['rooms']
      parameter do
        key :name, 'Authorization'
        key :in, :header
        key :description, 'Input example: Token token="value"'
        key :required, true
        key :type, :string
        key :default, 'Token token="value"'
      end
      parameter do
        key :name, :id
        key :in, :path
        key :description, 'Room id'
        key :required, true
        key :type, :integer
      end
    end
  end

  swagger_schema :InputRoomSchema do
    key :required, [:room]
    property :room do
      key :type, :object
      key :'$ref', :InputRoom
    end
  end

  swagger_schema :InputRoom do
    key :required, [:name, :user_ids]
    property :name do
      key :type, :string
    end
    property :user_ids do
      key :type, :array
      items do
        key :type, :integer
      end
    end
  end

  swagger_schema :OutputRoom do
    key :required, [:id, :name, :users]
    property :id do
      key :type, :integer
    end
    property :name do
      key :type, :string
    end
    property :users do
      key :type, :array
      items do
        key :'$ref', :OutputProfile
      end
    end
  end

  swagger_schema :RoomErrors do
    property :errors do
      property :memberships do
        key :type, :array
        items do
          key :type, :string
        end
      end
    end
  end
end
