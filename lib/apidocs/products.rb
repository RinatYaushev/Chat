class Apidocs::Products
  include Swagger::Blocks

  swagger_path '/products' do
    operation :get do
      key :description, 'List of products'
      key :tags, ['products']
      parameter do
        key :name, 'Authorization'
        key :in, :header
        key :description, 'Input example: Token token="value"'
        key :required, true
        key :type, :string
        key :default, 'Token token="value"'
      end
      response 200 do
        key :description, 'Products collection'
        schema do
          key :type, :array
          items do
            key :'$ref', :OutputProduct
          end
        end
      end
    end
  end

  swagger_path '/products/{id}' do
    operation :get do
      key :description, 'Show product'
      key :tags, ['products']
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
        key :description, 'Product'
        schema do
          key :'$ref', :OutputProduct
        end
      end
    end
  end

  swagger_path '/products' do
    operation :post do
      key :description, 'Create product'
      key :tags, ['products']
      parameter do
        key :name, 'Authorization'
        key :in, :header
        key :description, 'Input example: Token token="value"'
        key :required, true
        key :type, :string
        key :default, 'Token token="value"'
      end
      parameter do
        key :name, :product
        key :in, :body
        key :description, 'Product params'
        key :required, true
        schema do
          key :'$ref', :InputProductSchema
        end
      end
      response 200 do
        key :description, 'Product'
        schema do
          key :'$ref', :OutputProduct
        end
      end
      response 422 do
        schema do
          key :'$ref', :ProductErrors
        end
      end
    end
  end

  swagger_path '/products/{id}' do
    operation :patch do
      key :description, 'Update product'
      key :tags, ['products']
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
        key :description, 'Product id'
        key :required, true
        key :type, :integer
      end
      parameter do
        key :name, :product
        key :in, :body
        key :description, 'Product params'
        key :required, true
        schema do
          key :'$ref', :InputProductSchema
        end
      end
      response 200 do
        key :description, 'Product'
        schema do
          key :'$ref', :OutputProduct
        end
      end
      response 422 do
        schema do
          key :'$ref', :ProductErrors
        end
      end
    end
  end

  swagger_path '/products/{id}' do
    operation :delete do
      key :description, 'Delete product'
      key :tags, ['products']
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
        key :description, 'Product id'
        key :required, true
        key :type, :integer
      end
    end
  end

  swagger_schema :InputProductSchema do
    key :required, [:product]
    property :product do
      key :type, :object
      key :properties, {
        name: {
          type: :string
        },
        price: {
          type: :number,
          format: :float
        }
      }
    end
  end

  swagger_schema :OutputProduct do
    key :required, [:id, :name, :price]
    property :id do
      key :type, :integer
    end
    property :name do
      key :type, :string
    end
    property :price do
      key :type, :number
      key :format, :float
    end
  end

  swagger_schema :ProductErrors do
    property :errors do
      property :name do
        key :type, :array
        items do
          key :type, :string
        end
      end
      property :price do
        key :type, :array
        items do
          key :type, :string
        end
      end
    end
  end
end
