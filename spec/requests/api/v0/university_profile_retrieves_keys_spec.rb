RSpec.describe 'University Profile Retrieves Reg Keys', type: :request do
  let(:university) { create(:user, role: :university, subscriber: true) }
  let(:credentials) { university.create_new_auth_token }
  let(:headers) { { HTTP_ACCEPT: 'application/json' }.merge!(credentials) }

  describe 'Reg Keys are returned for subscribed user' do
    before do
      get '/api/v0/subscriptions', headers: headers
    end

    it 'returns a 200 response' do
      expect(response.status).to eq 200
    end

    it 'returns 5 registration keys' do
      expect(response_json['data']['registration_keys'].count).to eq 5
    end
  end
end