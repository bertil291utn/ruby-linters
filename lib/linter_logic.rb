require_relative '../lib/features.rb'

class LinterLogic
  def initialize(archivo)
    @archivo = archivo
  end

  def validate_length_lines?
    file = File.open(@archivo, 'r')
    count_file_size = file.readlines.size
    return false if count_file_size > Features::TAMANO_ARCHIVO_LINEAS

    true
  end
end
