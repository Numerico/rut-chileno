Gem::Specification.new do |s|
  s.name  =   'rut_chileno'
  s.version = '0.5'
  s.date  = '2013-05-23'
  s.summary = 'format & validate chilean R.U.T.'
  s.authors = ["Numerico"]
  s.email = 'webmaster@numerica.cl'
  s.files = Dir['lib/*']
  s.add_development_dependency 'test/unit'
  s.add_development_dependency 'pry'
  s.homepage = 'https://github.com/Numerico/rut-chileno'
end
