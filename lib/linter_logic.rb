# rubocop:disable Style/GuardClause
require_relative 'features.rb'

class LinterLogic
  def initialize; end

  def two_empty_lines(line, line_num, previous_line)
    return (line_num + 1) if empty_line?(line) && empty_line?(previous_line)
  end

  def single_row_max_characters(line, line_num)
    return (line_num + 1) if line.to_s.size > Features::TAMANO_LINEA
  end

  def break_line_after_method(line, line_num, previous_line)
    close_method = Features::CLOSE_METHOD
    unless line.include?(close_method) && previous_line.include?(close_method)
      return (line_num + 1) if !empty_line?(line) && previous_line.include?(close_method)
    end
  end

  def break_line_after_comment(line, line_num, previous_line)
    return(line_num + 1) if !empty_line?(line) && comment?(previous_line)
  end

  def comments_space(line, line_num)
    if comment?(line)
      return (line_num + 1) if !line[2].eql?(' ') || !line[line.length - 4].eql?(' ')
    end
  end

  def blank_space_after_name(line, line_num)
    if open_method_line?(line)
      return (line_num + 1) unless line[line.length - 3].eql?(' ')
    end
  end

  def repeated_method_name(line_num, library_add, new_line)
    unless library_add.key(new_line).nil?
      resultado_temp = [library_add.key(new_line)]
      resultado_temp.push(line_num + 1)
      resultado_temp.push(new_line)
      resultado_temp
    end
  end

  def colon_line(line, line_num)
    if method_rule_line?(line)
      return (line_num + 1) unless colon?(line)
    end
  end

  def semicolon_line(line, line_num)
    if method_rule_line?(line)
      return(line_num + 1) unless semicolon?(line)
    end
  end

  def clean_mehtod_name(line)
    line.lstrip
    line.delete!("\n")
    line.delete!('{')
  end

  def open_method_name?(line)
    open_method_line = Features::OPEN_METHOD
    no_name_initials = Features::NO_NAME_INITIALS
    if !line[0].eql?(' ') && last_char_line(line).eql?(open_method_line)
      return true if no_name_initials.all? { |elem| !elem.eql?(line[0]) }
    end

    false
  end

  private

  def method_rule_line?(line)
    blank_space_count = line.size - line.lstrip.length
    blank_space = blank_space_count.eql?(4) || blank_space_count.eql?(2)
    method_rule_condition = blank_space && !line.include?('{') && !line.include?('}')
    return true if method_rule_condition

    false
  end

  def semicolon?(line)
    return true if last_char_line(line).eql?(';')

    false
  end

  def colon?(line)
    return true if line.include?(':')

    false
  end

  def open_method_line?(line)
    open_method_line = Features::OPEN_METHOD
    return true if last_char_line(line).eql?(open_method_line)

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

# rubocop:enable Style/GuardClause
