require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    before do
        sign_in(user)
    end
    describe 'GET #index' do
        let(:user) { create :user }
        it 'returns a success response' do
        get :index
        expect(response).to be_successful
        end
    end

    describe 'GET #show' do

        let(:user) { create :user }

        it 'returns a success response' do
        get :show, params: { id: user.id }
        expect(response).to be_successful
        end
    end

    describe 'DELETE #destroy' do
        let(:user) { create :user }

        it 'destroys the user' do
        expect {
            delete :destroy, params: { id: user.id }
        }.to change(User, :count).by(-1)
        end

        it 'redirects to the users list' do
        delete :destroy, params: { id: user.id }
        expect(response).to redirect_to(root_path)
        end
    end
end
