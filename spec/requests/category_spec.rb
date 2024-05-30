require 'rails_helper'

RSpec.describe "Categories", type: :request do
  describe 'GET /index' do
    context 'quando há categorias cadastradas' do
      it 'retorna uma lista de categorias' do
        category1 = Category.create(description: 'Categoria 01')
        category2 = Category.create(description: 'Categoria 02')

        get '/categories'

        expect(response).to have_http_status(:ok)
        expect(response.body).to include(category1.to_json)
        expect(response.body).to include(category2.to_json)
      end

      it 'quando não há categorias cadastradas' do
        get '/categories'
        expect(JSON.parse(response.body)).to eq([])
      end
    end
  end
end
