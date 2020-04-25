require_relative 'action_listeners.rb'
# al = ActionListener.new('./examples/other_sample.css')
al = ActionListener.new('./examples/style.css')
puts al.action_valid_file_lines
puts al.action_extra_space_at_end
puts al.action_two_empty_lines
