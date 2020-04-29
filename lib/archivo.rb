class Archivo
  attr_reader :archivo

  def initialize(archivo)
    @archivo = archivo
  end

  def getting_file_name
    File.basename(@archivo)
  end
end
