require 'rails_helper'

RSpec.describe ToDosController, type: :controller do

  describe 'POST #create' do
    let(:user) { create :user }
    let(:compaign) { create :compaign, expert_id: user.id }
    let(:valid_attributes) { { task: 'Todo task', status: 'Todo status' } }

    context 'with valid params' do
      it 'creates a new todo' do
        sign_in(user)
        expect {
          post :create, params: { compaign_id: compaign.id, to_do: valid_attributes }
        }.to change(ToDo, :count).by(1)
      end

      it 'redirects to the compaign' do
        sign_in(user)
        post :create, params: { compaign_id: compaign.id, to_do: valid_attributes }
        expect(response).to redirect_to(Compaign.last)
      end
    end

    context 'with invalid params' do
      let(:invalid_attributes) { { task: nil, status: nil } }
      it 'does not create a new tag' do
        sign_in(user)
        expect {
          post :create, params: { compaign_id: compaign.id, to_do: invalid_attributes }
        }.to_not change(ToDo, :count)
      end

      it 'renders the new template' do
        sign_in(user)
        post :create, params: { compaign_id: compaign.id, to_do: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PATCH #update' do
    let(:user) { create :user }
    let(:compaign) { create :compaign, expert_id: user.id }
    let(:todo) { create :to_do, compaign_id: compaign.id }

    context 'with valid params' do
      let(:new_attributes) { { task: 'u Todo task', status: 'u Todo status' } }

      it 'updates the todo' do
        sign_in(user)
        patch :update, params: { compaign_id: compaign.id, id: todo.id, to_do: new_attributes }
        todo.reload
        expect(todo.task).to eq('u Todo task')
        expect(todo.status).to eq('u Todo status')
      end

      it 'redirects to the compaign' do
        sign_in(user)
        patch :update, params: { compaign_id: compaign.id, id: todo.id, to_do: new_attributes }
        expect(response).to redirect_to(Compaign.last)
      end
    end

    context 'with invalid params' do
      let(:invalid_attributes) { { task: nil, status: nil } }

      it 'does not update the todo' do
        sign_in(user)
        patch :update, params: { compaign_id: compaign.id, id: todo.id, to_do: invalid_attributes }
        todo.reload
        expect(todo.task).to eq('Todo task')
        expect(todo.status).to eq('Completed')
      end

      it 'renders the edit template' do
        sign_in(user)
        patch :update, params: { compaign_id: compaign.id, id: todo.id, to_do: invalid_attributes }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:user) { create :user }
    let!(:compaign) { create :compaign, expert_id: user.id }
    let!(:todo) { create :to_do, compaign_id: compaign.id }
    it 'destroys the topic' do
      sign_in(user)
      expect {
        delete :destroy, params: { compaign_id: compaign.id, id: todo.id }
      }.to change(ToDo, :count).by(-1)
    end

    it 'redirects to the compaign' do
      sign_in(user)
      delete :destroy, params: { compaign_id: compaign.id, id: todo.id }
      expect(response).to redirect_to(Compaign.last)
    end
  end
end
