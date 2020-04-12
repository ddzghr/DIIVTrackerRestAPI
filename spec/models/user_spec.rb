require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a uuid" do
    replica = subject.clone
    replica.uuid = nil
    expect(replica).to_not be_valid
  end
  it { should validate_presence_of(:uuid) }

  it "is not valid without a name" do
    replica = subject.clone
    replica.name = nil
    expect(replica).to_not be_valid
  end
  it { should validate_presence_of(:name) }

  it "is not valid without a email" do
    replica = subject.clone
    replica.email = nil
    expect(replica).to_not be_valid
  end
  it { should validate_presence_of(:email) }

  it "is not valid without a password_digest" do
    replica = subject.clone
    replica.password_digest = nil
    expect(replica).to_not be_valid
  end

  it "is not valid without a password_digest" do
    replica = subject.clone
    replica.password_digest = nil
    expect(replica).to_not be_valid
  end
  it { should validate_presence_of(:password_digest) }

  it "is not valid without a user_active" do
    replica = subject.clone
    replica.user_active = nil
    expect(replica).to_not be_valid
  end
  it { should validate_presence_of(:user_active) }

  it "is not valid without a user_locked" do
    replica = subject.clone
    replica.user_locked = nil
    expect(replica).to_not be_valid
  end
  it { should validate_presence_of(:user_locked) }

  it "is not valid without a email_confirmed" do
    replica = subject.clone
    replica.email_confirmed = nil
    expect(replica).to_not be_valid
  end
  it { should validate_presence_of(:email_confirmed) }

  it "is not valid without a confirm_token" do
    replica = subject.clone
    replica.confirm_token = nil
    expect(replica).to_not be_valid
  end
  it { should validate_presence_of(:confirm_token) }

  it "is not valid without a password_reset_token" do
    replica = subject.clone
    replica.password_reset_token = nil
    expect(replica).to_not be_valid
  end
  it { should validate_presence_of(:password_reset_token) }

  it "is not valid without a created_at" do
    replica = subject.clone
    replica.created_at = nil
    expect(replica).to_not be_valid
  end
  it { should validate_presence_of(:created_at) }

  it "is not valid without a updated_at" do
    replica = subject.clone
    replica.updated_at = nil
    expect(replica).to_not be_valid
  end
  it { should validate_presence_of(:updated_at) }

end
