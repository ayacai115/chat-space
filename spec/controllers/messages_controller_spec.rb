require 'rails_helper'

describe MessagesController do
  describe "user access" do
    before :each do
      user = create(:user)
      sign_in user
    end

    describe 'POST #create' do
      context 'with valid params' do
        it "saves the new message in the database" do
          group = create(:group)
          message = build(:message)
          expect{
            post :create, group_id: group[:id], message: attributes_for(:message)
          }.to change(Message, :count).by(1)
        end

        it "redirects to groups#show" do
          group = create(:group)
          message = build(:message)
          post :create, group_id: group[:id], message: attributes_for(:message)
          expect(response).to redirect_to group_path(group[:id])
        end
      end

      context "with invalid params" do
        it "doesn't save the message" do
          group = create(:group)
          expect{
            post :create, group_id: group[:id], message: attributes_for(:invalid_message)
          }.not_to change(Message, :count)
        end

        it "redirects to group_path" do
          group = create(:group)
          post :create, group_id: group[:id], message: attributes_for(:invalid_message)
          expect(response).to redirect_to group_path(group[:id])
        end
      end
    end
  end

  describe "guest access" do

    describe 'POST #create' do
      it "requires login" do
        message = build(:message)
        post :create, group_id: message[:group_id]
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
