require './lib/access_status'

describe AccessStatus do
  subject(:access_status) { described_class.new }

  context "when diary is changed from locked to unlocked" do
    it { expect { (subject.unlock) }.to change { subject.locked? }.from(true).to(false) }
  end

  context "when diary is changed from unlocked to locked" do
    before { subject.unlock }

    it { expect { (subject.lock) }.to change { subject.locked? }.from(false).to(true) }
  end
end
