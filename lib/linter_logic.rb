require_relative '../lib/features.rb'

class LinterLogic
  def initialize(archivo)
    @archivo = archivo
  end

  def valid_file_lines?
    file = File.open(@archivo, 'r')
    count_file_size = file.readlines.size
    return true if count_file_size < Features::TAMANO_ARCHIVO_LINEAS

    false
  end

  def extra_space_at_end
    File.foreach(@archivo).with_index do |line, line_num|
      space_at_end = line.lstrip.count(' ')
      return line_num if space_at_end > Features::IDENTATION
    end
    -1
  end
end
