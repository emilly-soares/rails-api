require "rails_helper"

RSpec.describe "/clients", type: :request do
  let(:valid_attributes) {
    {
      nome: "Emilly",
      sobrenome: "Soares",
      endereco: "Rua Exemplo",
    }
  }

  let(:invalid_attributes) {
    {
      nome: "123",
      sobrenome: "45464",
      endereco: "12",
    }
  }

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Client.create! valid_attributes
      get clients_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      client = Client.create! valid_attributes
      get client_url(client), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Client" do
        expect {
          post clients_url,
               params: { client: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Client, :count).by(1)
      end

      it "renders a JSON response with the new client" do
        post clients_url,
             params: { client: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Client" do
        expect {
          post clients_url,
               params: { client: invalid_attributes }, headers: valid_headers, as: :json
        }.to change(Client, :count).by(0)
      end

      it "renders a JSON response with errors for the new client" do
        post clients_url,
             params: { client: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          nome: "João",
          sobrenome: "Silva",
          endereco: "Rua Nova"
        }
      }

      it "updates the requested client" do
        client = Client.create! valid_attributes
        patch client_url(client),
              params: { client: new_attributes }, headers: valid_headers, as: :json
        client.reload
        expect(client.nome).to eq("João")
        expect(client.sobrenome).to eq("Silva")
        expect(client.endereco).to eq("Rua Nova")
      end

      it "renders a JSON response with the client" do
        client = Client.create! valid_attributes
        patch client_url(client),
              params: { client: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders 
