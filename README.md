rut-chileno
===========

ruby gem to validate and format chilean R.U.T.

install as ruby gem
```
	$ gem install rut_chileno
```
or add to Gemfile in Ruby on Rails
```ruby
	gem 'rut_chileno'
```
then
```
	$ bundle install
```

One example use could be in a validator class
```ruby
class RUTValidator < ActiveModel::Validator
  require 'rut_chileno'
  def validate(record)
    unless RUT::validar(record.rut)
      record.errors[:rut] << I18n.t(:invalid_rut)
    end
  end
end
```
which is then referenced from a model
```ruby
class Person < ActiveRecord::Base
  validates_with RUTValidator
end
```
but let your imagation fly


----------------------------------------

based on jQuery library by Joaquin Nuñez

http://joaquinnunez.cl/jQueryRutPlugin/
