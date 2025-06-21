class Tablero
    def initialize
        #Inicializamos las variables
        @filas = []
        @columnas = []
        @diagonales = []
        @casillas = []

        #Creamos las casillas
        3.times do |fila|
            3.times do |columna|
                @casillas << Casilla.new(fila, columna)
            end
        end

        #Inicializamos las casillas
        3.times do |fila|
            @filas << CheckGroup.new(@casillas.select { |casilla| casilla.x == fila }, self)
        end

        #Inicializamos las columnas
        3.times do |columna|
            @columnas << CheckGroup.new(@casillas.select { |casilla| casilla.y == columna }, self)
        end

        #Inicializamos las diagonales
        @diagonales << CheckGroup.new([@casillas[0], @casillas[4], @casillas[8]], self)
        @diagonales << CheckGroup.new([@casillas[2], @casillas[4], @casillas[6]], self)

        #Agregamos los listeners de las filas a las casillas
        @filas.each do |fila|
            fila.casillas.each do |casilla|
                casilla.add_listener(fila)
            end
        end

        #Agregamos los listeners de las columnas a las casillas
        @columnas.each do |columna|
            columna.casillas.each do |casilla|
                casilla.add_listener(columna)
            end
        end

        #Agregamos los listeners de las diagonales a las casillas
        @diagonales.each do |diagonal|
            diagonal.casillas.each do |casilla| 
                casilla.add_listener(diagonal)
            end
        end
    end   

    def clear
        @casillas.each do |casilla|
            casilla.clear
        end
    end

    def update(check_group)
        if check_group.all_equal
            puts "Ganador: #{check_group.casillas[0].state}\n"
            print_tablero
            exit
        end
    end

    def print_tablero
        puts "-------------"
        @filas.each do |fila|
            print "|"
            fila.casillas.each do |casilla|
                estado = casilla.state.empty? ? " " : casilla.state
                print " #{estado} |"
            end
            puts "\n-------------"
        end
    end

    def puede_mark_casilla(x, y)
        casilla_index = x * 3 + y
        @casillas[casilla_index].has_state?('')
    end

    def mark_casilla(x, y, value)
        casilla_index = x * 3 + y
        @casillas[casilla_index].state = value
    end

    def tablero_lleno?
        @casillas.all? { |casilla| !casilla.state.empty? }
    end

end