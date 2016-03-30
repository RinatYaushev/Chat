module Backoffice
  class Session
    include ActiveModel::Model
    include Draper::Decoratable

    attr_reader :username, :password

    def initialize params={}
      params = params.try(:symbolize_keys) || {}

      @username = params[:username]

      @password = params[:password]
    end

    validate do |model|
      if user
        model.errors.add :password, 'is invalid' unless user.authenticate password
      else
        model.errors.add :username, 'not found'
      end
    end

    def save
      user if valid?
    end

    private

    def user
      @user ||= Backoffice::User.find_by name: username
    end
  end
end
