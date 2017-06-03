require 'rails_helper'

describe GroupsController do

  describe "user access" do
    before :each do
      user = create(:user)
      sign_in user
    end

    describe 'GET #show' do
      before :each do
        @group = create(:group)
        get :show, id: @group
      end

      it "assigns the requested group to @group" do
        expect(assigns(:group)).to eq @group
      end

      it "assigns the requested message to @message" do
        expect(assigns(:message)).to be_truthy
      end

      it "renders the :show template" do
        expect(response).to render_template :show
      end
    end
  end

  describe "guest access" do

    describe 'GET #show' do
      it "requires login" do
        group = create(:group)
        get :index, id: group[:id]
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
