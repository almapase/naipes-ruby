require_relative 'Baraja'
require 'pp'

class Mano
  def initialize(baraja)
    @mi_mano = {}
    @valor = 0
    5.times{ |i| @mi_mano["carta#{i+1}"] = baraja.pop }
    cartas_por_pinta
    cartas_por_valor
  end

  def show
    puts "mano "
    pp show_mano
    # puts "pintas "
    # pp @pintas
    # puts "valores "
    # pp @valores

    case
    when val_carta_mayor == 14 && escala? && color?
      puts "Tengo Escala Real"
    when escala? && color?
      puts "Tengo Escala de color"
    when poker?
      puts "Tengo Poker"
    when full?
      puts "Tengo Full"
    when color?
      puts "Tengo Color"
    when escala?
      puts "Tengo Escala"
    when trio?
      puts "Tengo Trio"
    when cuantos_pares == 2
      puts "Tengo Doble Par"
    when cuantos_pares == 1
      puts "Tengo un Par"
    else
      puts "Mi carta mayor es: #{carta_mayor}"
    end
  end

  private

  # muestra la mano pinta mas numero en un hash
  def show_mano
    @mi_mano.sort_by{|k, v| v[:valor]}.to_h.map {|k, v| {k => {v[:numero] => v[:pinta]}} }
  end

  # verifica si hay un ESCALA en la mano.
  # ESCALA: numeros seguidos de cualquier pinta.
  def escala?
    valores = @mi_mano.sort_by {|k, v| v[:valor]}.to_h.map{|k, v| [v[:valor]] }.flatten
    valores.each_with_index do |val, index|
      return false unless val == (valores[index + 1] - 1)
      return true if index == (valores.size - 2)
    end
  end

  # verifica si hay un POKER en la mano.
  # POKER: dos pares de la misma pinta.
  def poker?
    cuantos_pares == 2 && @pares.group_by{|k, v| k}.size == 1
  end

  # verifica si hay un FULL en la mano.
  # FULL: una par y un trio.
  def full?
    par? && trio?
  end

  # devuelve el valor de la carta mayor de la mano.
  def val_carta_mayor
    @carta_mayor = @mi_mano.sort_by {|k, v| v[:valor]}.last
    @carta_mayor[1][:valor]
  end

  # devuelve la carta mayor de la mano.
  def carta_mayor
    "#{@carta_mayor[1][:numero]} #{@carta_mayor[1][:pinta]}"
  end

  # crea un arreglo de pares y devuelve cuantos pares hay en la mano.
  def cuantos_pares
    @pares = []
    @pares = @valores.to_h.select{|k, v| (2..2).cover?(v)}
    @pares.size
  end

  # verifica si hay pares en la mano.
  def par?
    cuantos_pares >= 1
  end

  # verifica si hay un trio en la mano.
  def trio?
    @valores.to_h.select{|k, v| (3..3).cover?(v)}.size == 1
  end

  # de vuelve true si la mano es de un solo color.
  def color?
    cartas_por_pinta
    @pintas[0][1] == 5
  end

  # crea un arreglo con pintas y cantidad cartas por pinta.
  def cartas_por_pinta
    @pintas = []
    @pintas = @mi_mano.group_by{|k, v| v[:pinta]}.map{|k, v| [k, v.count]}
  end

  # crea un arreglo con pintas y cantidad cartas por pinta.
  def cartas_por_valor
    @valores = []
    @valores = @mi_mano.group_by{|k, v| v[:valor]}.map{|k, v| [k, v.count]}
  end
end

b = Baraja.new
m = Mano.new(b)
m.show
