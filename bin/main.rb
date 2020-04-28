# !/usr/bin/env ruby

require './lib/action_listeners.rb'
puts 'Enter your CSS file path: '
file_path = gets.chomp
file_path = './examples/style.css' if file_path.empty?
al = ActionListener.new(file_path)
puts al.result
