class Carta
  attr_reader :numero, :pinta, :valor

  def initialize(pinta, numero, valor)
    @pinta = pinta
    @valor = valor
    @numero = numero
  end

  def to_s
    # "#{self.numero} #{self.pinta} - #{self.valor}"
    "#{self.numero} #{self.pinta}"
  end

  def to_h
    hash = {}
    hash[:pinta] = self.pinta
    hash[:numero] = self.numero
    hash[:valor] = self.valor
    return hash
  end
end
