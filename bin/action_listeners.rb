require_relative '../lib/linter_logic.rb'
require_relative '../lib/features.rb'

class ActionListener
  def initialize(archivo)
    @linter_logic = LinterLogic.new(archivo)
  end

  def action_validate_length_lines?
    if @linter_logic.validate_length_lines?
      puts "Respected max length for code. Check [Less than #{Features::TAMANO_ARCHIVO_LINEAS} lines]"
    else
      puts "More than #{Features::TAMANO_ARCHIVO_LINEAS} lines is not allowed"
    end
  end
end
