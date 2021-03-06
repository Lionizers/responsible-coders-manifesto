# frozen_string_literal: true

# == Schema Information
#
# Table name: coders
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  token      :string(255)
#  verified   :boolean          default(FALSE)
#  email_hash :string(255)
#

require 'rails_helper'

RSpec.describe CodersController, type: :controller do # rubocop:disable Metrics/BlockLength
  describe 'POST create with valid user' do
    let!(:name) { 'Responsible Guy' }
    let!(:email) { 'guy@example.com' }

    before do
      ActionMailer::Base.deliveries = []
      params = { coder: { name: name, email: email }, format: 'js' }
      post :create, params
    end

    it 'responds with the 200 code' do
      expect(response.status).to be(200)
    end

    it 'creates a new coder' do
      expect(Coder.count).to be 1
    end

    it 'creates the coder with the given name' do
      expect(Coder.first.name).to eq(name)
    end

    it 'creates the coder with the given email' do
      expect(Coder.first.email).to eq(email)
    end

    it 'checks if the coder is valid' do
      expect(Coder.first).to be_valid
    end

    it 'sends an email to the coder' do
      expect(ActionMailer::Base.deliveries.count).to be 1
    end
  end

  context 'when email is already taken' do
    let!(:old_user) { FactoryGirl.create(:coder, name: 'Old user', email: 'guy@example.com') }

    describe 'POST create ' do
      let!(:name) { 'New User' }
      let!(:email) { 'guy@example.com' }

      before do
        ActionMailer::Base.deliveries = []
        params = { coder: { name: name, email: email }, format: 'js' }
        post :create, params
      end

      it 'responds with the 200 code' do
        expect(response.status).to be(200)
      end

      it 'does not create a new coder' do
        expect(Coder.count).to be 1
      end

      it 'does not change the name of the user' do
        expect(Coder.first.name).to eq('Old user')
      end

      it 'does not change the email of the old user' do
        expect(Coder.first.email).to eq(email)
      end

      it 'checks if the coder is valid' do
        expect(Coder.first).to be_valid
      end

      it 'sends an email to the coder' do
        expect(ActionMailer::Base.deliveries.count).to be 0
      end
    end
  end

  describe 'GET verify with valid link' do
    let!(:token) { 'abcde' }
    let!(:coder) { create(:coder) }

    before do
      ActionMailer::Base.deliveries = []
      get :verify, token: coder.token
    end

    it 'sends an email to the coder' do
      expect(ActionMailer::Base.deliveries.count).to be 1
    end

    it 'verifies the coder' do
      coder.reload
      expect(coder.verified).to be true
    end
  end

  describe 'GET verify with invalid link' do
    let!(:token) { 'abcde' }
    let!(:coder) { create(:coder) }

    before do
      ActionMailer::Base.deliveries = []
      get :verify, token: 'not_the_token'
    end

    it 'sends no email to the coder' do
      expect(ActionMailer::Base.deliveries.count).to be 0
    end

    it 'does not verify the coder' do
      coder.reload
      expect(coder.verified).to be false
    end
  end

  describe 'GET verify for an already verified user' do
    let!(:token) { 'abcde' }
    let!(:coder) { create(:coder, verified: true) }

    before do
      ActionMailer::Base.deliveries = []
      get :verify, token: coder.token
    end

    it 'verifies the coder and send second email' do
      coder.reload
      expect(coder.verified).to be true
      expect(ActionMailer::Base.deliveries.count).to be 0
    end
  end
end
