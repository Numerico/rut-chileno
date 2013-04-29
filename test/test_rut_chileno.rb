require 'test/unit'
require 'rut_chileno'
require 'yaml'

class RutTest < Test::Unit::TestCase

  def test_get_digito
    #TODO helper
    yaml=YAML.load_file(File.dirname(__FILE__)+'/fixtures.yml')
    mirut=yaml['ok']
    
    rut=RUT.new
    assert_equal rut.getDigito(mirut['rut']), mirut['dv']
  end

  def test_digito_correcto
    #TODO helper
    yaml=YAML.load_file(File.dirname(__FILE__)+'/fixtures.yml')
    mirut=yaml['ok']

    rut=RUT.new
    ("a".."z").each do |i|
      if i!=mirut['dv']
        assert !rut.digitoCorrecto(mirut['rut']+i)
      else
        assert rut.digitoCorrecto(mirut['rut']+i)
      end
    end
    
    for i in 0..9 do
      if i!=mirut['dv']
        assert !rut.digitoCorrecto(mirut['rut']+i.to_s)
      else
        assert rut.digitoCorrecto(mirut['rut']+i.to_s)
      end
    end
  end
end
