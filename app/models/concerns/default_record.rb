module DefaultRecord
  def default
    where(default: true).first
  end
end
