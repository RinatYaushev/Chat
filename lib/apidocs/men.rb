class Apidocs::Men
  include Swagger::Blocks

  swagger_path '/rooms/{room_id}/men' do
    operation :get do
      key :description, 'Show men in room'
      key :tags, ['men']
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
        key :description, 'Men collection'
        schema do
          key :type, :array
          items do
            key :'$ref', :OutputProfile
          end
        end
      end
    end
  end
end
