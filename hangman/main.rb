require_relative 'lib/session'
require_relative 'lib/word_aleatory'
require 'json'
require 'fileutils'

class HangmanGame
  SAVE_FILE = 'hangman_save.json'

  def initialize
    @session = nil
    @game_running = false
  end

  def start
    puts "=== JUEGO DEL AHORCADO ==="
    puts "Bienvenido al juego del ahorcado!"
    
    if File.exist?(SAVE_FILE)
      puts "\nSe encontró una partida guardada."
      print "¿Deseas cargar la partida guardada? (s/n): "
      choice = gets.chomp.downcase
      
      if choice == 's' || choice == 'si'
        load_game
      else
        new_game
      end
    else
      new_game
    end

    play_game
  end

  private

  def new_game
    puts "\nIniciando nueva partida..."
    word = get_word
    @session = Session.new(word)
    @game_running = true
    puts "¡Nueva partida iniciada!"
  end

  def load_game
    begin
      data = JSON.parse(File.read(SAVE_FILE))
      @session = Session.load(data)
      @game_running = true
      puts "¡Partida cargada exitosamente!"
      puts "Palabra: #{@session.print_status}"
      puts "Vidas restantes: #{@session.lives}"
      puts "Letras usadas: #{@session.letters_used.join(', ')}"
    rescue => e
      puts "Error al cargar la partida: #{e.message}"
      puts "Iniciando nueva partida..."
      new_game
    end
  end

  def save_game
    begin
      data = @session.serialize
      File.write(SAVE_FILE, JSON.pretty_generate(data))
      puts "¡Partida guardada exitosamente!"
    rescue => e
      puts "Error al guardar la partida: #{e.message}"
    end
  end

  def play_game
    while @game_running
      display_game_status
      handle_player_input
    end
  end

  def display_game_status
    puts "\n" + "="*50
    puts "Palabra: #{@session.print_status}"
    puts "Vidas restantes: #{@session.lives}"
    puts "Letras usadas: #{@session.letters_used.join(', ')}"
    puts "="*50
  end

  def handle_player_input
    puts "\nOpciones:"
    puts "1. Adivinar letra"
    puts "2. Guardar partida"
    puts "3. Salir"
    print "Selecciona una opción (1-3): "
    
    choice = gets.chomp.strip
    
    case choice
    when '1'
      guess_letter
    when '2'
      save_game
    when '3'
      exit_game
    else
      puts "Opción inválida. Por favor selecciona 1, 2 o 3."
    end
  end

  def guess_letter
    print "Ingresa una letra: "
    letter = gets.chomp.strip
    
    if letter.downcase == 'salir'
      exit_game
      return
    end
    
    result = @session.try_letter(letter)
    
    case result
    when :win
      puts "\n¡FELICIDADES! ¡Has ganado!"
      @game_running = false
      cleanup_save_file
      play_again?
    when :lose
      puts "\n¡GAME OVER! Has perdido."
      @game_running = false
      cleanup_save_file
      play_again?
    when :lose_live
      puts "Mala elección! Pierdes una vida"
    when :continue
      # El juego continúa, no hacer nada
    when false
      # Error en la entrada o letra ya probada
      if letter.length != 1 || !letter.match?(/[a-zA-Z]/)
        puts "Por favor, ingresa una sola letra válida"
      else
        puts "Esta letra ya ha sido probada"
      end
    else
      # Error en la entrada, el mensaje ya se mostró en try_letter
    end
  end

  def exit_game
    puts "\n¿Deseas guardar la partida antes de salir? (s/n): "
    choice = gets.chomp.downcase
    
    if choice == 's' || choice == 'si'
      save_game
    end
    
    puts "¡Gracias por jugar! ¡Hasta luego!"
    @game_running = false
  end

  def cleanup_save_file
    if File.exist?(SAVE_FILE)
      File.delete(SAVE_FILE)
    end
  end

  def play_again?
    puts "\n¿Deseas jugar otra partida? (s/n): "
    choice = gets.chomp.downcase
    
    if choice == 's' || choice == 'si'
      new_game
      play_game
    else
      puts "¡Gracias por jugar! ¡Hasta luego!"
    end
  end
end

# Iniciar el juego
if __FILE__ == $0
  game = HangmanGame.new
  game.start
end
