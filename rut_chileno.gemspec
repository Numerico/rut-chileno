Gem::Specification.new do |s|
  s.name  =   'rut_chileno'
  s.version = '0.22'
  s.date  = '2013-04-29'
  s.summary = 'formateo y validacion R.U.T.'
  s.authors = ["Numerico"]
  s.email = 'webmaster@numerica.cl'
  s.files = Dir['lib/*']
  s.add_development_dependency 'test/unit'
  s.add_development_dependency 'pry'
  s.homepage = 'https://github.com/Numerico/rut-chileno'
end
