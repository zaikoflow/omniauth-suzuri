require 'spec_helper'

describe OmniAuth::Strategies::Suzuri do
  subject do
    described_class.new({})
  end

  context "client options" do
    it 'returns correct site' do
      expect(subject.options.client_options.site).to eq("https://suzuri.jp")
    end

    it 'returns correct authorize_url' do
      expect(subject.options.client_options.authorize_url).to eq("/oauth/authorize")
    end

    it 'returns correct token_url' do
      expect(subject.options.client_options.token_url).to eq("/oauth/token")
    end
  end

  context "uid" do
    before do
      allow(subject).to receive(:raw_info) { { "id" => "suzuri" } }
    end

    it 'returns correct uid' do
      expect(subject.uid).to eq("suzuri")
    end
  end

  context "info" do
    before do
      allow(subject).to receive(:raw_info) { { "name" => "suzuri1", "displayName" => "suzuri2",
                                               "avatarUrl" => "https://localhost" } }
    end

    it 'returns correct info' do
      expect(subject.info).to eq({ name: "suzuri1", displayName: "suzuri2",
                                   avatarUrl: "https://localhost" })
    end
  end

  context "extra" do
    before do
      allow(subject).to receive(:raw_info) { { "id" => "suzuri" } }
    end

    it 'returns correct extra block' do
      expect(subject.extra).to eq({ raw_info: { "id" => "suzuri" } })
    end
  end

  describe "#raw_info" do
    let(:access_token) { double('AccessToken', options: {}) }
    let(:response) { double('Response', parsed: { "user" => { "id" => "suzuri" } } ) }

    before do
      allow(subject).to receive(:access_token) { access_token }
    end

    it "returns raw_info" do
      allow(access_token).to receive(:get).with('/api/v1/user') { response }
      expect(subject.raw_info).to eq({ "id" => "suzuri" })
    end
  end

  describe "#callback_url" do
    it "returns callback url" do
      allow(subject).to receive(:full_host) { "http://localhost" }
      allow(subject).to receive(:script_name) { "/1" }

      expect(subject.callback_url).to eq "http://localhost/1/auth/suzuri/callback"
    end
  end
end
