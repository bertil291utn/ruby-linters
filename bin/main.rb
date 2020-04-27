require_relative 'action_listeners.rb'
# al = ActionListener.new('./examples/other_sample.css')
al = ActionListener.new('./examples/style.css')
puts al.action_file_name
puts al.action_valid_file_lines
puts al.action_two_empty_lines
puts al.action_single_row_max_characters
puts al.action_break_line_after_method
puts al.action_break_line_after_comment
puts al.action_comments_space
puts al.action_blank_space_after_name
puts al.action_repeated_method_name
puts al.action_colon_line
