require_relative '../lib/features.rb'

class LinterLogic
  def initialize(archivo)
    @archivo = archivo
  end

  def getting_file_name
    File.basename(@archivo)
  end

  def valid_file_lines?
    file = File.open(@archivo, 'r')
    count_file_size = file.readlines.size
    return true if count_file_size < Features::TAMANO_LINEAS_ARCHIVO

    false
  end

  def extra_space_at_end
    resultado = []
    File.foreach(@archivo).with_index do |line, line_num|
      space_at_end = line.count(' ') - line.rstrip.count(' ')
      resultado.push(line_num + 1) if space_at_end > Features::IDENTATION
    end
    resultado
  end

  def two_empty_lines
    resultado = []
    previous_line = nil
    File.foreach(@archivo).with_index do |line, line_num|
      resultado.push(line_num + 1) if empty_line?(line) && empty_line?(previous_line)
      previous_line = line
    end
    resultado
  end

  def single_row_max_characters
    resultado = []
    File.foreach(@archivo).with_index do |line, line_num|
      resultado.push(line_num + 1) if line.to_s.size > Features::TAMANO_LINEA
    end
    resultado
  end

  def break_line_after_method
    resultado = []
    previous_line = ''
    File.foreach(@archivo).with_index do |line, line_num|
      resultado.push(line_num + 1) if !empty_line?(line) && previous_line.include?(Features::CLOSE_METHOD)
      previous_line = line
    end
    resultado
  end

  def break_line_after_comment
    resultado = []
    previous_line = ''
    File.foreach(@archivo).with_index do |line, line_num|
      resultado.push(line_num + 1) if !empty_line?(line) && comment?(previous_line)
      previous_line = line
    end
    resultado
  end

  def comments_space
    resultado = []
    File.foreach(@archivo).with_index do |line, line_num|
      next unless comment?(line)

      resultado.push(line_num + 1) if !line[2].eql?(' ') || !line[line.length - 4].eql?(' ')
    end
    resultado
  end

  private

  def empty_line?(line)
    return true if line.delete("\n").length.zero?

    false
  end

  def comment?(line)
    comment_line = Features::COMMENTS
    return true if line[0].eql?(comment_line) && line[line.length - 2].eql?(comment_line)

    false
  end
end
