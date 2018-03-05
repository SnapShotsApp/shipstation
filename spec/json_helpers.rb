module JsonHelpers
  def json(name)
    JSON.parse(File.read("fixtures/#{name}.json"))
  end
end
