class Carta

  def initialize(pinta, numero)
    @pinta = pinta
    @numero = numero
  end

  def to_s
    "#{@numero} #{@pinta}"
  end
end
