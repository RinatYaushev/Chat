class Apidocs::Pictures
  include Swagger::Blocks

  swagger_path '/rooms/{room_id}/pictures' do
    operation :get do
      key :description, 'List of pictures'
      key :tags, ['pictures']
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
        key :description, 'Pictures collection'
        schema do
          key :type, :array
          items do
            key :'$ref', :OutputPicture
          end
        end
      end
    end
  end

  swagger_path '/rooms/{room_id}/pictures' do
    operation :post do
      key :description, 'Create picture'
      key :tags, ['pictures']
      key :consumes, ['multipart/form-data']
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
        key :name, 'picture[image]'
        key :in, :formData
        key :description, 'Upload image'
        key :required, true
        key :type, :file
      end
      response 200 do
        key :description, 'Picture'
        schema do
          key :'$ref', :OutputPicture
        end
      end
      response 422 do
        schema do
          key :'$ref', :PictureErrors
        end
      end
    end
  end

  swagger_schema :OutputPicture do
    key :required, [:id, :image, :user, :room]
    property :id do
      key :type, :integer
    end
    property :image do
      key :type, :string
    end
    property :user do
      key :type, :object
      key :'$ref', :OutputProfile
    end
    property :room do
      key :type, :object
      key :'$ref', :OutputRoom
    end
  end

  swagger_schema :PictureErrors do
    property :errors do
      property :image do
        key :type, :array
        items do
          key :type, :string
        end
      end
    end
  end
end
