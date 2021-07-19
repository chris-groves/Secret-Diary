require './lib/secret_diary'

describe SecretDiary do
  let(:access_status) { AccessStatus.new }
  let(:secret_diary) { described_class.new(access_status) }

  context "when diary is locked" do
    it "throws an error when trying to add an entry" do
      expect { secret_diary.add_entry }.to raise_error('Diary is locked!')
    end

    it "throws an error when trying to view entries" do
      expect { (secret_diary.get_entries) }.to raise_error('Diary is locked!')
    end
  end

  context "when diary is unlocked" do
    before do
      access_status.unlock
    end

    it "allows an entry to be added" do
      expect { (secret_diary.add_entry) }.not_to raise_error
    end

    it "allows entries to be viewed" do
      expect { (secret_diary.add_entry) }.not_to raise_error
    end
  end

  context "when diary is unlocked and then locked" do
    before do
      access_status.unlock
      access_status.lock
    end

    it "throws an error when trying to add an entry" do
      expect { (secret_diary.add_entry) }.to raise_error('Diary is locked!')
    end

    it "throws an error when trying to view entries" do
      expect { (secret_diary.add_entry) }.to raise_error('Diary is locked!')
    end
  end
end
