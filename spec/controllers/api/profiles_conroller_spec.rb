require 'rails_helper'

RSpec.describe Api::ProfilesController, type: :controller do
  it { should route(:get, '/api/users/1/profile').to(action: :show, user_id: 1) }
end
