# rubocop:disable Style/GuardClause

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
    unless extra_space.empty?
      puts 'BLANK SPACES AT THE END OF LINE' unless extra_space.empty?
      extra_space.each { |elem| puts 'Line number: ' + elem.to_s }
    end
  end
end

# rubocop:enable Style/GuardClause
