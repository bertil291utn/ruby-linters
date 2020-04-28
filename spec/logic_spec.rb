require_relative '../lib/linter_logic.rb'

RSpec.describe LinterLogic do
  archivo = './examples/style.css'
  let(:archivo) { Archivo.new(archivo) }
  let(:linter_logic) { LinterLogic.new }

  describe '#two_empty_lines?' do
    it 'returns an array with elements (number of the line where the are more than two empty lines) ' do
      resultado = []
      previous_line = ''
      File.foreach(archivo).with_index do |line, line_num|
        result = linter_logic.two_empty_lines(line, line_num, previous_line)
        resultado.push(result) unless result.nil?
        previous_line = line
      end
      expect(resultado).to eql([93])
    end
  end

  describe '#single_row_max_characters' do
    it 'returns array with elements which has more than total number lines ' do
      resultado = []
      File.foreach(archivo).with_index do |line, line_num|
        result = linter_logic.single_row_max_characters(line, line_num)
        resultado.push(result) unless result.nil?
      end
      expect(resultado).to eql([56])
    end
  end

  describe '#break_line_after_method' do
    it 'returns array with elements which has no empty line after a method ' do
      resultado = []
      previous_line = ''
      File.foreach(archivo).with_index do |line, line_num|
        result = linter_logic.break_line_after_method(line, line_num, previous_line)
        resultado.push(result) unless result.nil?
        previous_line = line
      end
      expect(resultado).to eql([78])
    end
  end

  describe '#break_line_after_comment' do
    it 'returns array with elements which has no empty line after comments ' do
      resultado = []
      previous_line = ''
      File.foreach(archivo).with_index do |line, line_num|
        result = linter_logic.break_line_after_comment(line, line_num, previous_line)
        resultado.push(result) unless result.nil?
        previous_line = line
      end
      expect(resultado).to eql([79])
    end
  end

  describe '#comments_space' do
    it 'returns array with elements which has no blank spaces after and before comment tags ' do
      resultado = []
      File.foreach(archivo).with_index do |line, line_num|
        result = linter_logic.comments_space(line, line_num)
        resultado.push(result) unless result.nil?
      end
      expect(resultado).to eql([78])
    end
  end

  describe '#blank_space_after_name' do
    it 'returns array with elements which has no blank spaces before close method brackets  ' do
      resultado = []
      File.foreach(archivo).with_index do |line, line_num|
        result = linter_logic.blank_space_after_name(line, line_num)
        resultado.push(result) unless result.nil?
      end
      expect(resultado).to eql([79])
    end
  end

  describe '#repeated_method_name' do
    it 'returns matrix with elements (firstline,secondline, class) which has repeatd classes' do
      resultado = []
      library_add = {}
      File.foreach(archivo).with_index do |line, line_num|
        if linter_logic.open_method_name?(line)
          new_line = linter_logic.clean_mehtod_name(line)
          result = linter_logic.repeated_method_name(line_num, library_add, new_line)
          resultado.push(result) unless result.nil?
        end
        library_add[line_num + 1] = new_line
      end
      expect(resultado).to eql([[19, 39, '.titles-font-family '], [89, 94, '.hidden-section-title ']])
    end
  end

  describe '#colon_line' do
    it 'returns array with number lines where there\'s no colon :' do
      resultado = []
      File.foreach(archivo).with_index do |line, line_num|
        result = linter_logic.colon_line(line, line_num)
        resultado.push(result) unless result.nil?
      end
      expect(resultado).to eql([11, 20, 66, 101])
    end
  end

  describe '#semicolon_line' do
    it 'returns array with number lines where there\'s no semicolon :' do
      resultado = []
      File.foreach(archivo).with_index do |line, line_num|
        result = linter_logic.semicolon_line(line, line_num)
        resultado.push(result) unless result.nil?
      end
      expect(resultado).to eql([24, 66, 101])
    end
  end
end
