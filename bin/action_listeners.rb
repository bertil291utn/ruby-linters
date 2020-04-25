require_relative '../lib/linter_logic.rb'

class ActionListener
  def initialize(archivo)
    @linter_logic = LinterLogic.new(archivo)
  end

  def action_valid_file_lines
    if @linter_logic.valid_file_lines?
      return "Respected max length for code. Check [Less than #{Features::TAMANO_ARCHIVO_LINEAS} lines]"
    end

    "More than #{Features::TAMANO_ARCHIVO_LINEAS} lines is not allowed"
  end

  def action_extra_space_at_end
    extra_space = @linter_logic.extra_space_at_end
    puts 'No extra spaces at the end of lines' if extra_space.empty?

    extra_space.each { |elem| puts 'You have extra spaces at line number: ' + elem.to_s }
  end
end
