require 'rails_helper'

RSpec.describe TagsController, type: :controller do

  describe 'POST #create' do
    let(:user) { create :user }
    let(:compaign) { create :compaign, expert_id: user.id }
    let(:valid_attributes) { { name: 'Tag Test' } }

    context 'with valid params' do
      it 'creates a new tag' do
        sign_in(user)
        expect {
          post :create, params: { compaign_id: compaign.id, tag: valid_attributes }
        }.to change(Tag, :count).by(1)
      end

      it 'redirects to the compaign' do
        sign_in(user)
        post :create, params: { compaign_id: compaign.id, tag: valid_attributes }
        expect(response).to redirect_to(Compaign.last)
      end
    end

    context 'with invalid params' do
      let(:invalid_attributes) { { name: nil } }
      it 'does not create a new tag' do
        sign_in(user)
        expect {
          post :create, params: { compaign_id: compaign.id, tag: invalid_attributes }
        }.to_not change(Tag, :count)
      end

      it 'renders the new template' do
        sign_in(user)
        post :create, params: { compaign_id: compaign.id, tag: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:user) { create :user }
    let!(:compaign) { create :compaign, expert_id: user.id }
    let!(:tag) { create :tag, compaign_id: compaign.id }
    it 'destroys the topic' do
      sign_in(user)
      expect {
        delete :destroy, params: { compaign_id: compaign.id, id: tag.id }
      }.to change(Tag, :count).by(-1)
    end

    it 'redirects to the compaign' do
      sign_in(user)
      delete :destroy, params: { compaign_id: compaign.id, id: tag.id }
      expect(response).to redirect_to(Compaign.last)
    end
  end
end
