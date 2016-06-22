require_relative 'Baraja'
class Mano
  def initialize(baraja)
    @mi_mano = []
    5.times{ @mi_mano << baraja.pop }
  end

  def show
    @mi_mano
  end
end

b = Baraja.new
m = Mano.new(b)

puts m.show
