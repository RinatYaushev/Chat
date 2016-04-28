class Apidocs::Avatar
  include Swagger::Blocks

  swagger_path '/profile/avatar' do
    operation :patch do
      key :description, 'Upload avatar'
      key :tags, ['profile']
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
        key :name, 'user[avatar]'
        key :in, :formData
        key :description, 'Upload user avatar'
        key :required, true
        key :type, :file
      end
      response 200 do
        key :description, 'Set up avatar to user'
      end
    end
  end
end
