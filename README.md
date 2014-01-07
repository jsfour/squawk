# Squwak

This project rocks and uses MIT-LICENSE.

It is designed to allow you to add a unique identifier to any model in a rails application. 

Built and tested on ruby 2.0 / Rails 4.0

## Usage

### Installing

Add the gem to your Gemfile

	gem 'squwak', git: 'https://github.com/jsmootiv/squawk.git'


Install & run the migraqtions

	rake squwak:install:migrations
	rake db:migrate


Require the code on any model that you want to include.
	require 'squwak'


Also include the Squwak methods and ask set has_identifier up on any of the classes that you want a uuid created in the DB for.

	require 'squwak'
	class MyModel < ActiveRecord::Base
		include Squwak
		has_identifier ## makes sure that the model gets an identifer


	end


### Finding Models connected to a UUID

Execute the follwing:

	Squwak::Ident.locate_identable STRING_UUID