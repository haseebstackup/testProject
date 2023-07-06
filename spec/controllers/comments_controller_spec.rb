require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  let(:user1) { create :user }
  let(:user2) { create :user, type: "Novice",profession: nil, service: nil }
  let(:compaign) { create :compaign, expert_id: user1.id }
  let(:topic) { create :discussion_topic, novice_id: user2.id, compaign_id: compaign.id }
  describe 'POST #create' do
    let(:valid_attributes) { { title: 'Comment title' } }
    context 'with valid params and for compaigns' do
      it 'creates a new comment on compaign' do
        sign_in(user1)
        expect {
          post :create, params: { compaign_id: compaign.id, user_id: user1.id , comment: valid_attributes }
        }.to change(Comment, :count).by(1)
      end

      it 'redirects to the compaign' do
        sign_in(user1)
        post :create, params: { compaign_id: compaign.id, user_id: user1.id , comment: valid_attributes }
        expect(response).to redirect_to(Compaign.last)
      end
    end

    context 'with invalid params' do
      let(:invalid_attributes) { { title: nil } }
      it 'does not create a new comment' do
        sign_in(user1)
        expect {
          post :create, params: { compaign_id: compaign.id, user_id: user1.id , comment: invalid_attributes }
        }.to_not change(Comment, :count)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:comment) { create :comment, commentable_id: compaign.id, commentable_type: "Compaign" , user_id: user1.id }
    it 'destroys the comment' do
      sign_in(user1)
      expect {
        delete :destroy, params: { compaign_id: compaign.id, id: comment.id }
      }.to change(Comment, :count).by(-1)
    end

    it 'redirects to the compaign' do
      sign_in(user1)
      delete :destroy, params: { compaign_id: compaign.id, id: comment.id }
      expect(response).to redirect_to(Compaign.last)
    end
  end
end
