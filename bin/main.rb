require_relative 'action_listeners.rb'
al = ActionListener.new('./examples/style.css')
puts al.action_valid_file_lines?
puts 'END OF LINE'
puts al.action_extra_space_at_end
