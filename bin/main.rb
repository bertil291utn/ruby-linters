require_relative 'action_listeners.rb'
al = ActionListener.new('./examples/style.css')
al.action_validate_length_lines?
