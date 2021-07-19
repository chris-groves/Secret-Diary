class SecretDiary
  attr_accessor :access_status

  def initialize(access_status)
    @access_status = access_status
  end

  def locked?
    access_status.locked?
  end

  def add_entry
    raise 'Diary is locked!' if locked?
  end

  def get_entries
    raise 'Diary is locked!' if locked?
  end
end
