require_relative 'carta'

class Baraja
  def initialize()
    pintas = [:Corazón, :Pica, :Trébol, :Diamante]
    @cartas = []
    pintas.each do |e|
      for i in 2..14
        case i
        when 2..10
          @cartas << Carta.new(e, i.to_s, i).to_h
        when 11
          @cartas << Carta.new(e, 'J', i).to_h
        when 12
          @cartas << Carta.new(e, 'Q', i).to_h
        when 13
          @cartas << Carta.new(e, 'K', i).to_h
        when 14
          @cartas << Carta.new(e, 'A', i).to_h
        end
      end
    end
    barajar()
  end

  def pop
    @cartas.pop
  end

  def barajar
    @cartas.shuffle!
  end
end

# bara_i = Baraja.new
#
# puts bara_i.barajar
# puts "+++++++++++++"
# puts bara_i.barajar
# puts "+++++++++++++"
# puts bara_i.barajar
# puts "+++++++++++++"
# puts bara_i.barajar
# puts "+++++++++++++"
# puts bara_i.barajar
