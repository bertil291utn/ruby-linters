# A simple linter for Ruby
> I created a Linter that looks for each .rb files inside of a directory (including sub-directories) and suggest better alternatives for your Ruby code.

## Rules on this Linter:
- The number of lines in each file shouldn't be more than 140.
- The amount of characters per line is limited to 100.
- There should be no extra spaces at the end of each line.
- No more than one empty line after each method.
- Best alternatives for comparison operators.
- Best alternatives for logical operators.

## Language
- Ruby

## Getting started
In order to use this linter:

1. You need to have ruby environment installed. [Click here for instructions](https://www.ruby-lang.org/en/documentation/installation/)
2. Clone this repository `https://github.com/ghamtre/linter.git`
3. Inside linter directory run `ruby ./bin/main.rb`

## Instructions to change parameters
- Go to `/lib/` directory
- Open `/parameter.rb`
- Inside of class `Parameters` you change the default values of indentation, max characters allowed per line, etc.


### How to make tests for this linter?
- You can run the rspec testing directly from linter directory.

- To modify or add more tests to the project, you can edit ```linter_spec.rb``` file inside of the `/spec/` directory.
- Any new changes to this file must be documented in a pull request before merging.



## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to submit a new suggestion > [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!