# Tic Tac Toe en Ruby

Un juego de Tic Tac Toe (Tres en Raya) implementado en Ruby con una arquitectura orientada a objetos.

## Características

- Juego completo de Tic Tac Toe para dos jugadores
- Interfaz de consola intuitiva
- Detección automática de ganador
- Verificación de empate
- Arquitectura modular con clases separadas

## Estructura del Proyecto

```
tic_tac_toe/
├── lib/
│   ├── casilla.rb      # Clase para representar cada casilla del tablero
│   ├── check_group.rb  # Clase para verificar grupos de casillas (filas, columnas, diagonales)
│   └── tablero.rb      # Clase principal del tablero de juego
├── main.rb             # Archivo principal del juego
└── README.md           # Este archivo
```

## Cómo Jugar

1. Ejecuta el juego con: `ruby main.rb`
2. El tablero se muestra con números del 1 al 9
3. Los jugadores alternan entre X y O
4. Ingresa un número del 1 al 9 para marcar tu casilla
5. El juego detecta automáticamente el ganador o empate

## Ejemplo de Uso

```
¡Bienvenido al juego de Tic Tac Toe!
Para marcar una ubicación, elige un número del 1 al 9 según el tablero:
-------------
| 1 | 2 | 3 |
-------------
| 4 | 5 | 6 |
-------------
| 7 | 8 | 9 |
-------------
-------------
|   |   |   |
-------------
|   |   |   |
-------------
|   |   |   |
-------------
Jugador X, elige donde marcar (1-9): 5
```

## Tecnologías Utilizadas

- Ruby
- Programación Orientada a Objetos
- Patrón Observer para notificaciones de cambios

## Autor

JoaquinIV - Proyecto para The Odin Project 