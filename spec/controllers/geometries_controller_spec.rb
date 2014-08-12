require 'rails_helper'

describe GeometriesController do
  describe 'POST #create' do
    let(:model) { create(:model_with_sizes) }
    let(:size) { model.sizes.first }

    context 'with valid attributes' do
      before do
        xhr :post, :create, model_id: model.id, size_id: size.id
      end

      it 'assigns the requested model to @model' do
        expect(assigns(:size)).to eq size
      end

      it 'assigns the requested size to @size' do
        expect(assigns(:size)).to eq size
      end

      it 'renders the :create template' do
        expect(response).to render_template :create
      end
    end

    context 'with invalid attributes' do
      it 'returns a 400 status code' do
        xhr :post, :create, model_id: 20, size_id: 20
        expect(response.code).to eq "400"
      end
    end
  end
end
