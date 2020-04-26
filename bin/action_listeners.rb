require_relative '../lib/linter_logic.rb'

class ActionListener
  def initialize(archivo)
    @linter_logic = LinterLogic.new(archivo)
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

  def action_extra_space_at_end
    extra_space = @linter_logic.extra_space_at_end
    unless extra_space.empty?
      result = "BLANK SPACES AT THE END OF LINE\n"
      extra_space.each { |elem| result += 'Line number: ' + elem.to_s + "\n" }
    end
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
end
