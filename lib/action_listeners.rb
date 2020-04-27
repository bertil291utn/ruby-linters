# rubocop:disable Layout/LineLength
require_relative 'linter_logic.rb'

class ActionListener
  def initialize(archivo)
    @linter_logic = LinterLogic.new(archivo)
    # init_file
  end

  def init_file
    File.foreach(@archivo).with_index do |line, line_num|
    end
  end

  def action_file_name
    result = "=========================================\n"
    result += "#{@linter_logic.getting_file_name}\n"
    result += '========================================='
    result
  end

  def action_valid_file_lines
    return "More than #{Features::TAMANO_LINEAS_ARCHIVO} lines is not allowed" unless @linter_logic.valid_file_lines?
  end

  def action_two_empty_lines
    two_space = @linter_logic.two_empty_lines
    unless two_space.empty?
      result = "MORE THAN ONE BREAK LINE \n"
      two_space.each { |elem| result += 'Line number: ' + elem.to_s + "\n" }
    end
    result
  end

  def action_single_row_max_characters
    single_row_lines = @linter_logic.single_row_max_characters
    unless single_row_lines.empty?
      result = "EXPECTED JUST #{Features::TAMANO_LINEA} characters. Check \u{26A0} \n"
      single_row_lines.each { |elem| result += 'Line number: ' + elem.to_s + "\n" }
    end
    result
  end

  def action_break_line_after_method
    after_method_close = @linter_logic.break_line_after_method
    unless after_method_close.empty?
      result = "EXPECTED NEW BREAK LINE AFTER METHOD . Check \u{26A0} \n"
      after_method_close.each { |elem| result += 'Line number: ' + elem.to_s + "\n" }
    end
    result
  end

  def action_break_line_after_comment
    after_comment_close = @linter_logic.break_line_after_comment
    unless after_comment_close.empty?
      result = "EXPECTED NEW BREAK LINE AFTER COMMENT . Check \u{26A0} \n"
      after_comment_close.each { |elem| result += 'Line number: ' + elem.to_s + "\n" }
    end
    result
  end

  def action_comments_space
    after_comment_space = @linter_logic.comments_space
    unless after_comment_space.empty?
      result = "AFTER OPENING AND CLOSING COMMENTS TAG EXPECTED BLANK SPACE. Check \u{26A0} \n"
      after_comment_space.each { |elem| result += 'Line number: ' + elem.to_s + "\n" }
    end
    result
  end

  def action_blank_space_after_name
    after_comment_space = @linter_logic.blank_space_after_name
    unless after_comment_space.empty?
      result = "BEFORE OPENING METHOD TAG EXPECTED BLANK SPACE. Check \u{26A0} \n"
      after_comment_space.each { |elem| result += 'Line number: ' + elem.to_s + "\n" }
    end
    result
  end

  def action_repeated_method_name
    repeated_method = @linter_logic.repeated_method_name
    unless repeated_method.empty?
      result = "YOU HAVE REPEATED CLASSES. Check \u{26A0} \n"
      repeated_method.each { |elem| result += 'Line number: ' + elem[0].to_s + " and #{elem[1]} has `#{elem[2]}` class\n" }
    end
    result
  end

  def action_colon_line
    colon_missing_line = @linter_logic.colon_line
    unless colon_missing_line.empty?
      result = "COLON IS MISSING . Check \u{26A0} \n"
      colon_missing_line.each { |elem| result += 'Line number: ' + elem.to_s + "\n" }
    end
    result
  end

  def action_semicolon_line
    colon_missing_line = @linter_logic.semicolon_line
    unless colon_missing_line.empty?
      result = "SEMICOLON IS MISSING . Check \u{26A0} \n"
      colon_missing_line.each { |elem| result += 'Line number: ' + elem.to_s + "\n" }
    end
    result
  end
end

# rubocop:enable Layout/LineLength
