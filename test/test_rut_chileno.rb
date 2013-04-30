require 'test/unit'
require 'rut_chileno'
require 'yaml'
require 'pry'

class RutTest < Test::Unit::TestCase

  def test_get_digito
    #TODO helper
    yaml=YAML.load_file(File.dirname(__FILE__)+'/fixtures.yml')
    mirut=yaml['ok']
    
    assert_equal RUT::getDigito(mirut['rut']), mirut['dv']
  end

  def test_digito_correcto
    #TODO helper
    yaml=YAML.load_file(File.dirname(__FILE__)+'/fixtures.yml')
    mirut=yaml['ok']

    ("a".."z").each do |i|
      if i!=mirut['dv']
        assert !RUT::digitoCorrecto(mirut['rut']+i)
      else
        assert RUT::digitoCorrecto(mirut['rut']+i)
      end
    end

    for i in 0..9 do
      if i!=mirut['dv']
        assert !RUT::digitoCorrecto(mirut['rut']+i.to_s)
      else
        assert RUT::digitoCorrecto(mirut['rut']+i.to_s)
      end
    end
  end

  def test_digito_valido
    for i in 0..9 do
      assert RUT::digitoValido i.to_s
    end
    for i in [*('a'..'z'),*('A'..'Z')] do
      assert !RUT::digitoValido(i) unless i.casecmp('k')
    end
    assert RUT::digitoValido('k')
    assert RUT::digitoValido('K')
  end

  def test_valido
    yaml=YAML.load_file(File.dirname(__FILE__)+'/fixtures.yml')
    rut=yaml['formats']

    #TODO clean syntax
    ruts=[]
    full_text=rut['full_points']+'-'+rut['dv']
  ruts << full_text
    lower_text=rut['full_points']+'-'+rut['dv'].downcase
  ruts << lower_text
    no_hyphen=rut['full_points']+rut['dv']
  ruts << no_hyphen
    lower_no_hyphen=rut['full_points']+rut['dv'].downcase
  ruts << lower_no_hyphen
    no_points=rut['no_points']+'-'+rut['dv']
  ruts << no_points
    lower_no_points=rut['no_points']+'-'+rut['dv'].downcase
  ruts << lower_no_points
    no_points_no_hyphen=rut['no_points']+rut['dv']
  ruts << no_points_no_hyphen
    lower_no_points_no_hyphen=rut['no_points']+rut['dv'].downcase
  ruts << lower_no_points_no_hyphen
    left_point=rut['left_point']+'-'+rut['dv']
  ruts << left_point
    right_point=rut['right_point']+'-'+rut['dv']
  ruts << right_point
    lower_left_point=rut['left_point']+'-'+rut['dv'].downcase
  ruts << lower_left_point
    lower_right_point=rut['right_point']+'-'+rut['dv'].downcase
  ruts << lower_right_point
    left_point_no_hyphen=rut['left_point']+rut['dv']
  ruts << left_point_no_hyphen
    right_point_no_hyphen=rut['right_point']+rut['dv']
  ruts << right_point_no_hyphen
    lower_left_point_no_hyphen=rut['left_point']+rut['dv'].downcase
  ruts << lower_left_point_no_hyphen
    lower_right_point_no_hyphen=rut['right_point']+rut['dv'].downcase
  ruts << lower_right_point_no_hyphen

    #TESTS
    ruts.each do |r|
      assert RUT::validar(r), r.inspect
    end

  end

  #TODO
  #def test_quitar_formato
  #def test_formatear

end