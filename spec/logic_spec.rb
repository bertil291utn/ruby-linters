require_relative '../lib/linter_logic.rb'

RSpec.describe LinterLogic do
  archivo = './examples/style.css'
  let(:linter_logic) { LinterLogic.new(archivo) }

  describe '#valid_file_lines?' do
    it 'returns true when the number of lines in file is less than featured lines ' do
      expect(linter_logic.valid_file_lines?).to be_truthy
    end
  end

  describe '#two_empty_lines?' do
    it 'returns an array with elements (number of the line where the are more than two empty lines) ' do
      expect(linter_logic.two_empty_lines).to eq([])
    end
  end

  describe '#single_row_max_characters' do
    it 'returns array with elements which has more than total number lines ' do
      expect(linter_logic.single_row_max_characters).to eq([56])
    end
  end

  describe '#break_line_after_method' do
    it 'returns array with elements which has no empty line after a method ' do
      expect(linter_logic.break_line_after_method).to eq([])
    end
  end

  describe '#break_line_after_comment' do
    it 'returns array with elements which has no empty line after comments ' do
      expect(linter_logic.break_line_after_comment).to eq([])
    end
  end

  describe '#comments_space' do
    it 'returns array with elements which has no blank spaces after and before comment tags ' do
      expect(linter_logic.comments_space).to eq([])
    end
  end

  describe '#blank_space_after_name' do
    it 'returns array with elements which has no blank spaces before close method brackets  ' do
      expect(linter_logic.blank_space_after_name).to eq([])
    end
  end

  describe '#repeated_method_name' do
    it 'returns matrix with elements (firstline,secondline, class) which has repeatd classes' do
      expect(linter_logic.repeated_method_name).to eql([[19, 39, '.titles-font-family']])
    end
  end

  describe '#colon_line' do
    it 'returns array with number lines where there\'s no colon :' do
      expect(linter_logic.colon_line).to eql([4])
    end
  end
end
