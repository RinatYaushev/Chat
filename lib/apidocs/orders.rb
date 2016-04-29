class Apidocs::Orders
  include Swagger::Blocks

  swagger_path '/orders' do
    operation :get do
      key :description, 'List of orders'
      key :tags, ['orders']
      parameter do
        key :name, 'Authorization'
        key :in, :header
        key :description, 'Input example: Token token="value"'
        key :required, true
        key :type, :string
        key :default, 'Token token="value"'
      end
      response 200 do
        key :description, 'Orders collection'
        schema do
          key :type, :array
          items do
            key :'$ref', :OutputOrder
          end
        end
      end
    end
  end

  swagger_path '/orders/{id}' do
    operation :get do
      key :description, 'Show order'
      key :tags, ['orders']
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
        key :description, 'Order'
        schema do
          key :'$ref', :OutputOrder
        end
      end
    end
  end

  swagger_path '/orders' do
    operation :post do
      key :description, 'Create order'
      key :tags, ['orders']
      parameter do
        key :name, 'Authorization'
        key :in, :header
        key :description, 'Input example: Token token="value"'
        key :required, true
        key :type, :string
        key :default, 'Token token="value"'
      end
      parameter do
        key :name, :order
        key :in, :body
        key :description, 'Order params'
        key :required, true
        schema do
          key :'$ref', :InputOrderSchema
        end
      end
      response 200 do
        key :description, 'Order'
        schema do
          key :'$ref', :OutputOrder
        end
      end
      response 422 do
        schema do
          key :'$ref', :OrderErrors
        end
      end
    end
  end

  swagger_path '/orders/{id}' do
    operation :delete do
      key :description, 'Delete order'
      key :tags, ['orders']
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
        key :description, 'Order id'
        key :required, true
        key :type, :integer
      end
    end
  end

  swagger_schema :InputOrderSchema do
    key :required, [:order]
    property :order do
      key :type, :object
    end
  end

  swagger_schema :OutputOrder do
    key :required, [:id, :total, :user_id, :purchases]
    property :id do
      key :type, :integer
    end
    property :total do
      key :type, :float
      key :default, '0.0'
    end
    property :user_id do
      key :type, :integer
    end
    property :purchases do
      key :type, :array
      items do
        key :'$ref', :OutputPurchase
      end
    end
  end

  swagger_schema :OrderErrors do
    property :errors do
      property :purchases do
        key :type, :array
        items do
          key :type, :string
        end
      end
      property :quantity do
        key :type, :array
        items do
          key :type, :string
        end
      end
    end
  end
end
