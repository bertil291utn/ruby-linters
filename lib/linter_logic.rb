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
    close_method = Features::CLOSE_METHOD
    File.foreach(@archivo).with_index do |line, line_num|
      next if line.include?(close_method) && previous_line.include?(close_method)

      resultado.push(line_num + 1) if !empty_line?(line) && previous_line.include?(close_method)
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

  def blank_space_after_name
    resultado = []
    File.foreach(@archivo).with_index do |line, line_num|
      next unless open_method_line?(line)

      resultado.push(line_num + 1) unless line[line.length - 3].eql?(' ')
    end
    resultado
  end

  def repeated_method_name
    library_add = {}
    resultado = []
    File.foreach(@archivo).with_index do |line, line_num|
      next unless open_method_name?(line)

      new_line = clean_mehtod_name(line)
      unless library_add.key(new_line).nil?
        resultado_temp = [library_add.key(new_line)]
        resultado_temp.push(line_num + 1)
        resultado_temp.push(new_line)
        resultado.push(resultado_temp)
      end
      library_add[line_num + 1] = new_line
    end
    resultado
  end

  def colon_line
    resultado = []
    File.foreach(@archivo).with_index do |line, line_num|
      next unless last_char_line(line).eql?(';')

      resultado.push(line_num + 1) unless colon?(line)
    end
    resultado
  end

  private

  def colon?(line)
    return true if line.include?(':')

    false
  end

  def clean_mehtod_name(line)
    line.delete!(' ')
    line.delete!("\n")
    line.delete!('{')
  end

  def open_method_line?(line)
    open_method_line = Features::OPEN_METHOD
    return true if last_char_line(line).eql?(open_method_line)

    false
  end

  def open_method_name?(line)
    open_method_line = Features::OPEN_METHOD
    no_name_initials = Features::NO_NAME_INITIALS
    if !line[0].eql?(' ') && last_char_line(line).eql?(open_method_line)
      return true if no_name_initials.all? { |elem| !elem.eql?(line[0]) }
    end

    false
  end

  def empty_line?(line)
    remove_blank = line.length >= 1 ? line.delete(' ') : line
    return true if remove_blank.delete("\n").length.zero?

    false
  end

  def comment?(line)
    comment_line = Features::COMMENTS
    return true if line[0].eql?(comment_line) && last_char_line(line).eql?(comment_line)

    false
  end

  def last_char_line(line)
    line[line.length - 2]
  end
end
