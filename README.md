# Linter for CSS files
This linter checks simpler error like and suggests alternatives to improve your code

## Rules
- More than two break line 
- More than 53 characters in a single line
- Have a break line after method and comment
- Have blank space after the class name 
- Repeated method name
- Have colon and/or in a method line

## Built With

- Ruby 2.6

## Getting start

In order to start with the project:

1. You need to have Ruby environment installed. [Click here for instructions](https://www.ruby-lang.org/en/documentation/installation/)
2. Clone [this repository :blue_book:](https://github.com/bertil291utn/ruby-linters.git)
3. Run the main file
    - In a terminal window write `ruby `*`[your_file_path]`*`main.rb`
4. Once you get the file to enter your CSS file path. By default, it is set `style.css` in the examples folder, it doesn't matter always it has been returned a file it's going to return value 

| Without path                                                 | With path                                                    |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| ![image](https://user-images.githubusercontent.com/24902525/80442912-935c5400-88d3-11ea-903c-0cdc57b98303.png) | ![image](https://user-images.githubusercontent.com/24902525/80443037-e3d3b180-88d3-11ea-836b-58f81e6d68c5.png) |


## Testing
> We are using [RSpec testing tool](https://rspec.info/) to test all enumerable methods. Also some detailed [documentation](https://relishapp.com/rspec/docs) about this tool

### Install
- In a terminal window type `gem install rspec`
- Once rspec install has finished, type `rspec --init`
- You will see a folder `spec` and a file `.rspec`
- Inside `spec` folder you'll see a `spec_helper.rb` file.

### Run
> We have already created a file called `logic_spec.rb`, if you want to create another one with the end *`[your file name]`*`_spec.rb`
- Open `./spec/logic_spec.rb` file
- Open a terminal window and type `rspec`
- If all test were passed you will see: 

![image](https://user-images.githubusercontent.com/24902525/80443376-ade2fd00-88d4-11ea-9929-aa82b2616d2a.png)


Else you'll see a red message, then check errors and fix them 

## Author

👤 **Bertil Tandayamo**

- Github: [@bertil291utn](https://github.com/bertil291utn)
- Twitter: [@btandayamo](https://twitter.com/batandayamo)
- Linkedin: [Bertil Tandayamo](http://bit.ly/bertil_linkedin)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to submit a new suggestion [issues page](https://github.com/bertil291utn/ruby-linters/issues).

## Show your support

Hit the ⭐️ button if you like this project!