# rubocop:disable Layout/LineLength
# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity
# rubocop:disable Metrics/MethodLength
require_relative 'linter_logic.rb'
require_relative '../lib/archivo.rb'

class ActionListener
  attr_reader :result

  def initialize(archivo)
    @linter_logic = LinterLogic.new
    @archivo = Archivo.new(archivo)
    @result = al_init_methods
  end

  def al_init_methods
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

      # #break_line_after_comment
      break_line_after_comment_result = @linter_logic.break_line_after_comment(line, line_num, previous_line)
      result += 'Expected break line after comment, line num: ' + break_line_after_comment_result.to_s + "\n" unless break_line_after_comment_result.nil?

      # #comments_space
      comments_space_result = @linter_logic.comments_space(line, line_num)
      result += 'Expected blank space between comments , line num: ' + comments_space_result.to_s + "\n" unless comments_space_result.nil?

      # #blank_space_after_name
      blank_space_after_name_result = @linter_logic.blank_space_after_name(line, line_num)
      result += 'Expected blank space after method name , line num: ' + blank_space_after_name_result.to_s + "\n" unless blank_space_after_name_result.nil?

      # #repeated_method_name
      if @linter_logic.open_method_name?(line)
        new_line = @linter_logic.clean_mehtod_name(line)
        repeated_method_name_result = @linter_logic.repeated_method_name(line_num, library_add, new_line)
        result += 'You have repeated classes. ' + repeated_method_name_result[0].to_s + " and #{repeated_method_name_result[1]} has `#{repeated_method_name_result[2]}` class\n" unless repeated_method_name_result.nil?
      end

      # #colon_line
      colon_line_result = @linter_logic.colon_line(line, line_num)
      result += 'Expected colon, line num: ' + colon_line_result.to_s + "\n" unless colon_line_result.nil?

      # #semicolon_line
      semicolon_line_result = @linter_logic.semicolon_line(line, line_num)
      result += 'Expected semicolon, line num: ' + semicolon_line_result.to_s + "\n" unless semicolon_line_result.nil?

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
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
# rubocop:enable Metrics/MethodLength
