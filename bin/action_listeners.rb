require_relative '../lib/linter_logic.rb'

class ActionListener
  def initialize(archivo)
    @linter_logic = LinterLogic.new(archivo)
  end

  def action_valid_file_lines
    return "More than #{Features::TAMANO_ARCHIVO_LINEAS} lines is not allowed" unless @linter_logic.valid_file_lines?
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
      result = "MORE THAN ONE EMPTY LINE \n"
      two_space.each { |elem| result += 'Line number: ' + elem.to_s + "\n" }
    end
    result
  end
end
