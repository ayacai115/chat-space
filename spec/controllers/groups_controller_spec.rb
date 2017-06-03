require 'rails_helper'

describe GroupsController do

  describe 'GET #show' do
    let(:group) { create(:group) }

    context "user access" do
      before :each do
        user = create(:user)
        sign_in user
        get :show, id: group
      end

      it "assigns the requested group to @group" do
        expect(assigns(:group)).to eq group
      end

      it "assigns the requested message to @message" do
        expect(assigns(:message)).to be_an_instance_of(Message)
      end

      it "gets all messages of the group" do
        expect(assigns(:group).messages).to eq group.messages
      end

      it "renders the :show template" do
        expect(response).to render_template :show
      end
    end

    context "guest access" do
      it "requires login" do
        get :show, id: group
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
