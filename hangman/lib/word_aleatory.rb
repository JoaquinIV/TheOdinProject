require 'net/http'
require 'uri'

def get_word

  # URL de la lista de palabras
  url = 'https://raw.githubusercontent.com/first20hours/google-10000-english/master/google-10000-english-no-swears.txt'
  
  begin
    
    # Crear URI y hacer la petición HTTP
    uri = URI(url)
    response = Net::HTTP.get_response(uri)
    
    if response.is_a?(Net::HTTPSuccess)
      # Obtener el contenido y dividir en líneas
      words = response.body.split("\n")
      
      # Filtrar palabras de 5-12 letras para el juego
      valid_words = words.select { |word| word.length >= 5 && word.length <= 12 }
      
      # Retornar una palabra aleatoria
      valid_words.sample
    else
      # Si hay error en la petición, usar palabras por defecto
      default_words = ['hangman', 'programming', 'computer', 'algorithm', 'database', 'network', 'software', 'developer']
      default_words.sample
    end
  rescue => e
    # En caso de error de conexión, usar palabras por defecto
    puts "Error al obtener palabras de internet: #{e.message}"
    default_words = ['hangman', 'programming', 'computer', 'algorithm', 'database', 'network', 'software', 'developer']
    default_words.sample
  end
end