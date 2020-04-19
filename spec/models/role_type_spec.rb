require 'rails_helper'

RSpec.describe RoleType, type: :model do
  subject { build(:role_type) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a code" do
    replica = subject.clone
    replica.code = nil
    expect(replica).to_not be_valid
  end
  it { should validate_presence_of(:code) }

  it "is not valid without a name" do
    replica = subject.clone
    replica.name = nil
    expect(replica).to_not be_valid
  end
  it { should validate_presence_of(:name) }

  it "is not valid without a internal_admin_type" do
    replica = subject.clone
    replica.internal_admin_type = nil
    expect(replica).to_not be_valid
  end
  it { should_not allow_value(nil).for(:internal_admin_type) }

  it "is not valid without a internal_application_type" do
    replica = subject.clone
    replica.internal_application_type = nil
    expect(replica).to_not be_valid
  end
  it {  should_not allow_value(nil).for(:internal_application_type) }

  it "is not valid without a ordering_party_type" do
    replica = subject.clone
    replica.ordering_party_type = nil
    expect(replica).to_not be_valid
  end
  it { should_not allow_value(nil).for(:ordering_party_type) }

  it "is not valid without a courier_type" do
    replica = subject.clone
    replica.courier_type = nil
    expect(replica).to_not be_valid
  end
  it { should_not allow_value(nil).for(:courier_type) }

  it "is not valid without a supplier_type" do
    replica = subject.clone
    replica.supplier_type = nil
    expect(replica).to_not be_valid
  end
  it { should_not allow_value(nil).for(:supplier_type) }

  it "is not valid without a has_duration" do
    replica = subject.clone
    replica.has_duration = nil
    expect(replica).to_not be_valid
  end
  it {  should_not allow_value(nil).for(:has_duration) }

  it "is not valid without a has_invoice" do
    replica = subject.clone
    replica.has_invoice = nil
    expect(replica).to_not be_valid
  end
  it {  should_not allow_value(nil).for(:has_invoice) }

end
