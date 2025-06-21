require_relative 'lib/casilla'
require_relative 'lib/check_group'
require_relative 'lib/tablero'

def marcar_tablero(numero, tablero, valores_disponibles)
    return false unless valores_disponibles.key?(numero)
    x = valores_disponibles[numero]["x"]
    y = valores_disponibles[numero]["y"]
    return tablero.puede_mark_casilla(x, y)
end

def main
    valores_disponibles = {
        "1" => {
            "x" => 0,
            "y" => 0
        },
        "2" => {
            "x" => 0,
            "y" => 1
        },
        "3" => {
            "x" => 0,
            "y" => 2
        },
        "4" => {
            "x" => 1,
            "y" => 0
        },
        "5" => {
            "x" => 1,
            "y" => 1
        },
        "6" => {
            "x" => 1,
            "y" => 2
        },
        "7" => {
            "x" => 2,
            "y" => 0
        },
        "8" => {
            "x" => 2,
            "y" => 1
        },
        "9" => {
            "x" => 2,
            "y" => 2
        }
    }

    tablero = Tablero.new
    turno = "X"

    puts "¡Bienvenido al juego de Tic Tac Toe!"
    puts "Para marcar una ubicación, elige un número del 1 al 9 según el tablero:"
    puts "-------------"
    puts "| 1 | 2 | 3 |"
    puts "-------------"
    puts "| 4 | 5 | 6 |"
    puts "-------------"
    puts "| 7 | 8 | 9 |"
    puts "-------------"

    loop do
        puts "\n\n\nEstado actual:"
        tablero.print_tablero

        print "Jugador #{turno}, elige donde marcar (1-9): "
        casilla = gets.chomp

        unless marcar_tablero(casilla, tablero, valores_disponibles)
            puts "No se puede marcar la casilla: #{casilla}. Vuelve a intentarlo..."
            next
        end

        x = valores_disponibles[casilla]["x"]
        y = valores_disponibles[casilla]["y"]
        tablero.mark_casilla(x, y, turno)

        # Verificar empate
        if tablero.tablero_lleno?
            puts "¡Empate! El tablero está lleno."
            tablero.print_tablero
            break
        end

        turno = turno == "X" ? "O" : "X"
    end
end

# Ejecutar el juego
main
