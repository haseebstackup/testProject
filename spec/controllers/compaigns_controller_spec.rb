require 'rails_helper'

RSpec.describe CompaignsController, type: :controller do
  describe 'GET #index' do
    let(:user) { create :user }
    it 'returns a success response' do
      sign_in(user)
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do

    let(:user) { create :user }
    let(:compaign) { create :compaign, expert_id: user.id }

    it 'returns a success response' do
      sign_in(user)
      get :show, params: { id: compaign.id }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    let(:user) { create :user }
    let(:valid_attributes) { { title: 'Test Compaign', purpose: 'Test Purpose', duration: 'within 1 week',expert_id: user.id } }

    context 'with valid params' do
      it 'creates a new compaign' do
        sign_in(user)
        expect {
          post :create, params: { compaign: valid_attributes }
        }.to change(Compaign, :count).by(1)
      end

      it 'redirects to the created compaign' do
        sign_in(user)
        post :create, params: { compaign: valid_attributes }
        expect(response).to redirect_to(Compaign.last)
      end
    end

    context 'with invalid params' do
      let(:invalid_attributes) { { title: nil, purpose: nil, duration: nil, expert_id: nil } }
      it 'does not create a new compaign' do
        sign_in(user)
        expect {
          post :create, params: { compaign: invalid_attributes }
        }.to_not change(Compaign, :count)
      end

      it 'renders the new template' do
        sign_in(user)
        post :create, params: { compaign: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PATCH #update' do
    let(:user) { create :user }
    let(:compaign) { create :compaign, expert_id: user.id }

    context 'with valid params' do
      let(:new_attributes) { { title: 'U Test Compaign', purpose: 'U Test Purpose', duration: 'within 1 month' ,expert_id: user.id} }


      it 'updates the compaign' do
        sign_in(user)
        patch :update, params: { id: compaign.id, compaign: new_attributes }
        compaign.reload
        expect(compaign.title).to eq('U Test Compaign')
        expect(compaign.purpose).to eq('U Test Purpose')
      end

      it 'redirects to the compaign' do
        sign_in(user)
        patch :update, params: { id: compaign.id, compaign: new_attributes }
        expect(response).to redirect_to(compaign)
      end
    end

    context 'with invalid params' do
      let(:invalid_attributes) { { title: nil, purpose: nil, duration: nil, expert_id: nil } }

      it 'does not update the compaign' do
        sign_in(user)
        patch :update, params: { id: compaign.id, compaign: invalid_attributes }
        compaign.reload
        expect(compaign.title).to eq('Campaign title')
        expect(compaign.purpose).to eq('Campaign purpose')
      end

      it 'renders the edit template' do
        sign_in(user)
        patch :update, params: { id: compaign.id, compaign: invalid_attributes }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:user) { create :user }
    let!(:compaign) { create :compaign, expert_id: user.id }
    it 'destroys the compaign' do
      sign_in(user)
      expect {
        delete :destroy, params: { id: compaign.id }
      }.to change(Compaign, :count).by(-1)
    end

    it 'redirects to the compaigns list' do
      sign_in(user)
      delete :destroy, params: { id: compaign.id }
      expect(response).to redirect_to(compaigns_path)
    end
  end
end
