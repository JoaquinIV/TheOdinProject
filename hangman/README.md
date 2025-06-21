# Juego del Ahorcado (Hangman)

Un juego clásico del ahorcado implementado en Ruby con funcionalidad de guardar y cargar partidas.

## Características

- **Juego clásico del ahorcado**: Adivina la palabra letra por letra
- **Palabras aleatorias**: Obtiene palabras de una lista online o usa palabras por defecto
- **Guardar/Cargar partidas**: Puedes guardar tu progreso y continuar más tarde
- **Interfaz en español**: Completamente en español para mejor experiencia
- **5 vidas**: Tienes 5 intentos para adivinar la palabra

## Cómo jugar

1. **Ejecutar el juego**:
   ```bash
   ruby main.rb
   ```

2. **Al iniciar**:
   - Si hay una partida guardada, te preguntará si quieres cargarla
   - Si no hay partida guardada, comenzará una nueva partida

3. **Durante el juego**:
   - Verás la palabra oculta con guiones bajos (`_`)
   - Tienes 5 vidas para adivinar
   - Puedes ver las letras que ya has usado
   - Opciones disponibles:
     - **Opción 1**: Adivinar una letra
     - **Opción 2**: Guardar la partida actual
     - **Opción 3**: Salir del juego

4. **Ganar/Perder**:
   - **Ganar**: Adivinas todas las letras de la palabra
   - **Perder**: Te quedas sin vidas
   - Al final te preguntará si quieres jugar otra partida

## Estructura del proyecto

```
hangman/
├── main.rb              # Archivo principal del juego
├── lib/
│   ├── session.rb       # Clase para manejar la sesión del juego
│   └── word_aleatory.rb # Función para obtener palabras aleatorias
└── README.md           # Este archivo
```

## Archivos de guardado

- El juego guarda las partidas en `hangman_save.json`
- Este archivo se crea automáticamente cuando guardas una partida
- Se elimina automáticamente cuando terminas una partida (ganar o perder)

## Requisitos

- Ruby (versión 2.0 o superior)
- Conexión a internet (opcional, para obtener palabras aleatorias)

## Ejemplo de juego

```
=== JUEGO DEL AHORCADO ===
Bienvenido al juego del ahorcado!

Iniciando nueva partida...
¡Nueva partida iniciada!

==================================================
Palabra: _ _ _ _ _ _ _ _ _
Vidas restantes: 5
Letras usadas: 
==================================================

Opciones:
1. Adivinar letra
2. Guardar partida
3. Salir
Selecciona una opción (1-3): 1
Ingresa una letra: a
```

¡Disfruta jugando al ahorcado! 