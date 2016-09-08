class Config
  attr_reader :values

  def initialize(credentials)
    @values = YAML.load_file("#{credentials}_credentials.yml")
  end
end