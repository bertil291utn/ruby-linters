# rubocop:disable Layout/LineLength
require_relative 'linter_logic.rb'
require_relative '../lib/archivo.rb'

class ActionListener
  def initialize(archivo)
    @linter_logic = LinterLogic.new
    @archivo = Archivo.new(archivo)
  end

  def al_init_file
    library_add = {}
    previous_line = ''
    result = action_file_name + "\n"
    File.foreach(@archivo.archivo).with_index do |line, line_num|
      # #two_empty_lines
      two_empty_lines_result = @linter_logic.two_empty_lines(line, line_num, previous_line)
      result += 'Expected only one break line, line num: ' + two_empty_lines_result.to_s + "\n" unless two_empty_lines_result.nil?

      # #single_row_max_characters
      single_row_max_characters_result = @linter_logic.single_row_max_characters(line, line_num)
      result += "Expected only  #{Features::TAMANO_LINEA} characters line num: " + single_row_max_characters_result.to_s + "\n" unless single_row_max_characters_result.nil?

      # #break_line_after_method
      break_line_after_method_result = @linter_logic.break_line_after_method(line, line_num, previous_line)
      result += 'Expected break line after close method, line num: ' + break_line_after_method_result.to_s + "\n" unless break_line_after_method_result.nil?

      # #sadasdas
      if @linter_logic.open_method_name?(line)
        new_line = @linter_logic.clean_mehtod_name(line)
        repeated_method_name_result = @linter_logic.repeated_method_name(line_num, library_add, new_line)
        result += 'You have repeated classes. ' + repeated_method_name_result[0].to_s + " and #{repeated_method_name_result[1]} has `#{repeated_method_name_result[2]}` class\n" unless repeated_method_name_result.nil?
      end

      # repeated all foreach
      previous_line = line
      library_add[line_num + 1] = new_line
    end
    result
  end

  def action_file_name
    result = "=========================================\n"
    result += "#{@archivo.getting_file_name}\n"
    result += '========================================='
    result
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
