class Apidocs::Purchases
  include Swagger::Blocks

  swagger_path '/purchases' do
    operation :get do
      key :description, 'List of purchases'
      key :tags, ['purchases']
      parameter do
        key :name, 'Authorization'
        key :in, :header
        key :description, 'Input example: Token token="value"'
        key :required, true
        key :type, :string
        key :default, 'Token token="value"'
      end
      response 200 do
        key :description, 'Purchases collection'
        schema do
          key :type, :array
          items do
            key :'$ref', :OutputPurchase
          end
        end
      end
    end
  end

  swagger_path '/purchases/{id}' do
    operation :get do
      key :description, 'Show purchase'
      key :tags, ['purchases']
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
        key :description, 'Purchase'
        schema do
          key :'$ref', :OutputPurchase
        end
      end
    end
  end

  swagger_path '/purchases' do
    operation :post do
      key :description, 'Create purchase'
      key :tags, ['purchases']
      parameter do
        key :name, 'Authorization'
        key :in, :header
        key :description, 'Input example: Token token="value"'
        key :required, true
        key :type, :string
        key :default, 'Token token="value"'
      end
      parameter do
        key :name, :purchase
        key :in, :body
        key :description, 'Purchase params'
        key :required, true
        schema do
          key :'$ref', :InputPurchaseSchema
        end
      end
      response 200 do
        key :description, 'Purchase'
        schema do
          key :'$ref', :OutputPurchase
        end
      end
      response 422 do
        schema do
          key :'$ref', :PurchaseErrors
        end
      end
    end
  end

  swagger_path '/purchases/{id}' do
    operation :patch do
      key :description, 'Update purchase'
      key :tags, ['purchases']
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
        key :description, 'Purchase id'
        key :required, true
        key :type, :integer
      end
      parameter do
        key :name, :purchase
        key :in, :body
        key :description, 'Purchase params'
        key :required, true
        schema do
          key :'$ref', :InputPurchaseSchema
        end
      end
      response 200 do
        key :description, 'Purchase'
        schema do
          key :'$ref', :OutputPurchase
        end
      end
      response 422 do
        schema do
          key :'$ref', :PurchaseErrors
        end
      end
    end
  end

  swagger_path '/purchases/{id}' do
    operation :delete do
      key :description, 'Delete purchase'
      key :tags, ['purchases']
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
        key :description, 'Purchase id'
        key :required, true
        key :type, :integer
      end
    end
  end

  swagger_schema :InputPurchaseSchema do
    key :required, [:purchase]
    property :purchase do
      key :type, :object
      key :'$ref', :InputPurchase
    end
  end

  swagger_schema :InputPurchase do
    key :required, [:product_id, :quantity]
    property :product_id do
      key :type, :integer
    end
    property :quantity do
      key :type, :integer
    end
  end

  swagger_schema :OutputPurchase do
    key :required, [:id, :quantity, :sum, :user_id, :product_id, :order_id]
    property :id do
      key :type, :integer
    end
    property :quantity do
      key :type, :integer
    end
    property :sum do
      key :type, :float
      key :default, '0.0'
    end
    property :user_id do
      key :type, :integer
    end
    property :product_id do
      key :type, :integer
    end
    property :order_id do
      key :type, :integer
    end
  end

  swagger_schema :PurchaseErrors do
    property :errors do
      property :product_id do
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
