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

describe Coder do
  subject do
    Coder.create!(name: 'Test User', email: 'user@example.com')
  end

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:verified) }
  it { should respond_to(:email_hash) }
  it { should respond_to(:token) }

  it { should be_valid }

  it 'should have valid factory' do
    expect(create(:coder)).to be_valid
  end

  it 'is must have a name' do
    subject.name = nil
    expect(subject).to be_invalid
  end

  it 'is must have an email' do
    subject.email = nil
    expect(subject).to be_invalid
  end

  it 'should have an unique email' do
    coder1 = Coder.create(name: 'Test User', email: 'user@example.com')
    coder2 = Coder.create(name: 'Test User', email: 'user@example.com')
    expect(coder1).to be_valid
    expect(coder2).to be_invalid
  end

  it 'should send thanks email' do
    coder1 = Coder.create(name: 'Test User', email: 'user@example.com')
    expect(coder1).to be_valid
  end
end
