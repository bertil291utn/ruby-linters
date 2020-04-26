# rubocop:disable Layout/LineLength
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
    it 'returns an array with elements (numbers of the line where there are more than two blank space at the end of each line)' do
      expect(linter_logic.extra_space_at_end).to eq([])
    end
  end

  describe '#two_empty_lines?' do
    it 'returns an array with elements (number of the line where the are more than two empty lines) ' do
      expect(linter_logic.two_empty_lines).to eq([])
    end
  end

  describe '#single_row_max_characters' do
    it 'returns array with elements which has more than total number lines ' do
      expect(linter_logic.single_row_max_characters).to eq([51])
    end
  end
  describe '#break_line_after_method' do
    it 'sdfsdf' do
      expect(linter_logic.break_line_after_method).to eq([18, 29])
    end
  end
end

# rubocop:enable Layout/LineLength
