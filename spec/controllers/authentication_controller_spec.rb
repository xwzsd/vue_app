require 'rails_helper'

RSpec.describe AuthenticationController, type: :controller do

  describe "GET #authenticate_user" do
    it "returns http success" do
      get :authenticate_user
      expect(response).to have_http_status(:success)
    end
  end

end
