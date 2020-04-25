require_relative '../lib/linter_logic.rb'

RSpec.describe LinterLogic do
  archivo = './examples/style.css'
  let(:linter_logic) { LinterLogic.new(archivo) }

  describe '#valid_file_lines?' do
    it 'returns true when the number of lines in file is less than featured lines ' do
      expect(linter_logic.valid_file_lines?).to be_truthy
    end
  end

  describe '#extra_space_at_end' do
    it 'returns an array with number of the line where there\'s blank space at the end of each line' do
      expect(linter_logic.extra_space_at_end).to eq([7, 9, 10])
    end
  end
end
