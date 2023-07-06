require 'rails_helper'

RSpec.describe DiscussionTopicsController, type: :controller do

  describe 'GET #show' do
    let(:user1) { create :user }
    let(:user2) { create :user, type: "Novice",profession: nil, service: nil }
    let(:compaign) { create :compaign, expert_id: user1.id }
    let(:topic) { create :discussion_topic, novice_id: user2.id, compaign_id: compaign.id }

    it 'returns a success response' do
      sign_in(user2)
      get :show, params: { compaign_id: compaign.id, id: topic.id }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    let(:user1) { create :user }
    let(:user2) { create :user, type: "Novice",profession: nil, service: nil }
    let(:compaign) { create :compaign, expert_id: user1.id }
    let(:valid_attributes) { { title: 'Test Discussion Topic', novice_id: user2.id } }

    context 'with valid params' do
      it 'creates a new topic' do
        sign_in(user2)
        expect {
          post :create, params: { compaign_id: compaign.id, discussion_topic: valid_attributes }
        }.to change(DiscussionTopic, :count).by(1)
      end

      it 'redirects to the compaign' do
        sign_in(user2)
        post :create, params: { compaign_id: compaign.id, discussion_topic: valid_attributes }
        expect(response).to redirect_to(Compaign.last)
      end
    end

    context 'with invalid params' do
      let(:invalid_attributes) { { title: nil, novice_id: nil } }
      it 'does not create a new topic' do
        sign_in(user2)
        expect {
          post :create, params: { compaign_id: compaign.id, discussion_topic: invalid_attributes }
        }.to_not change(DiscussionTopic, :count)
      end

      it 'renders the new template' do
        sign_in(user2)
        post :create, params: { compaign_id: compaign.id, discussion_topic: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PATCH #update' do
    let(:user1) { create :user }
    let(:user2) { create :user, type: "Novice",profession: nil, service: nil }
    let(:compaign) { create :compaign, expert_id: user1.id }
    let(:topic) { create :discussion_topic, novice_id: user2.id, compaign_id: compaign.id }

    context 'with valid params' do
      let(:new_attributes) { { title: 'U Test Discussion'} }

      it 'updates the topic' do
        sign_in(user2)
        patch :update, params: { compaign_id: compaign.id, id: topic.id, discussion_topic: new_attributes }
        topic.reload
        expect(topic.title).to eq('U Test Discussion')
      end

      it 'redirects to the compaign' do
        sign_in(user2)
        patch :update, params: { compaign_id: compaign.id, id: topic.id, discussion_topic: new_attributes }
        expect(response).to redirect_to(Compaign.last)
      end
    end

    context 'with invalid params' do
      let(:invalid_attributes) { { title: nil, novice_id: nil } }

      it 'does not update the topic' do
        sign_in(user2)
        patch :update, params: { compaign_id: compaign.id, id: topic.id, discussion_topic: invalid_attributes }
        topic.reload
        expect(topic.title).to eq('Discussion Topic title')
      end

      it 'renders the edit template' do
        sign_in(user2)
        patch :update, params: { compaign_id: compaign.id, id: topic.id, discussion_topic: invalid_attributes }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:user1) { create :user }
    let!(:user2) { create :user, type: "Novice",profession: nil, service: nil }
    let!(:compaign) { create :compaign, expert_id: user1.id }
    let!(:topic) { create :discussion_topic, novice_id: user2.id, compaign_id: compaign.id }
    it 'destroys the topic' do
      sign_in(user2)
      expect {
        delete :destroy, params: { compaign_id: compaign.id, id: topic.id }
      }.to change(DiscussionTopic, :count).by(-1)
    end

    it 'redirects to the compaign' do
      sign_in(user2)
      delete :destroy, params: { compaign_id: compaign.id, id: topic.id }
      expect(response).to redirect_to(Compaign.last)
    end
  end
end
