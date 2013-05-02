module RUT

  def digitoValido(dv)
    ['0','1','2','3','4','5','6','7','8','9','k','K'].include?(dv)
  end

  def getDigito(rut)
    dvr='0'
    suma=0
    mul=2
    rut.reverse.split("").each do |c|
      suma=suma+c.to_i*mul
      if mul==7
        mul=2
      else
        mul+=1
      end
    end
    res=suma%11
    if res==1
      return 'k'
    elsif res==0
      return '0'
    else
      return 11-res
    end
  end

  def digitoCorrecto(crut)
    return false if crut.size < 2
    if crut.size > 2
      rut=crut[0...crut.size-1]
    else
      rut=crut[0]
    end
    dv=crut[crut.size-1]
    return false if !digitoValido(dv)
    if rut.nil? || dv.nil?
      return 0 #TODO ?
    end
    dvr=getDigito(rut)
    dvr.to_s==dv.downcase
  end

  def quitarFormato(rut)
    rut=rut.delete "."
    rut=rut.delete "-"
  end

  def validar(texto)
    texto=self.quitarFormato(texto)
    return false if texto.size < 2
    texto.split("").each do |c|
      return false if !digitoValido(c)
    end
    invertido=texto.reverse
    dtexto=invertido[0]+"-"
    cnt=0
    i=1
    j=2
    for x in 1...texto.size do
      if cnt==3
        dtexto=dtexto+"."
        j+=1
        dtexto=dtexto+invertido[x]
        cnt=1
      else
        dtexto=dtexto+invertido[x]
        cnt+=1
      end
      i+=1
      j+=1
    end
    invertido=""
    i=dtexto.size-1
    j=0
    (0..i).to_a.reverse.each do |y|
      invertido=invertido+dtexto[y]
      j+=1
    end
    return digitoCorrecto(texto)
  end

  def formatear
    #TODO
  end

  module_function :digitoValido, :getDigito, :digitoCorrecto, :quitarFormato, :validar

end