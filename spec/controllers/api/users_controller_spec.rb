require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do
  it { should route(:post, '/api/users').to(action: :create) }

  it { should route(:put, '/api/users/1').to(action: :update, id: 1) }

  it { should route(:delete, '/api/users/1').to(action: :destroy, id: 1) }
end
