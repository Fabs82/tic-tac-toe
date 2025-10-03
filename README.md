# 🎲 Tic-Tac-Toe GUI Edition

A modern, two-player implementation of the classic Tic-Tac-Toe game featuring a graphical user interface built with the **Ruby2D** gem.

## Project Overview

This project was upgraded from a command-line interface to a full GUI to practice Object-Oriented Programming (OOP) principles, event-driven architecture, and managing external dependencies.

---

## Features ✨

* **Graphical Interface**: Plays on a clean, visually appealing board using **Ruby2D**.
* **Persistent Score Tracker**: Tracks and displays scores for P1 and P2 across multiple matches in the same run.
* **Full Game Logic**: Handles all possible outcomes, including victory by row, column, and diagonal, as well as a draw.
* **Replayability**: After a match ends, players are prompted to start a new game (`Y`) or quit the application (`N`).

---

## Requirements ⚙️

* **Ruby**: Compatible with Ruby 2.5 or higher.
* **Bundler**: Used to manage and install the project's dependencies (gems).

---

## Installation and Launch 🚀

Follow these steps to get a copy of the project running on your local machine.

1.  **Clone the repository**:
    ```sh
    git clone [https://github.com/your-username/your-repo-name.git]
    ```

2.  **Navigate to the project directory**:
    ```sh
    cd your-repo-name
    ```

3.  **Install dependencies**: Bundler will read the Gemfile and install the necessary gems, including Ruby2D.
    ```sh
    bundle install
    ```

4.  **Run the game**: Execute the main script using Bundler to ensure it uses the correct environment.
    ```sh
    bundle exec ruby main.rb
    ```

---

## How to Play 🕹️

1.  The game will open in a new window. Player 1 starts.
2.  **Make a move** by clicking directly on the desired cell of the 3x3 grid.
3.  The turn changes automatically after a valid move.
4.  When the match ends (win or draw), the window will display the final result and updated scores.
5.  **To continue or quit**:
    * Press the **Y** key to reset the board and start a new match.
    * Press the **N** key to close the game window.

---

## Code Structure 📂

| File/Directory | Description |
| :--- | :--- |
| `main.rb` | The entry point for the application. Initializes the GUI and game logic. |
| `lib/match.rb` | **Core Game Logic.** Manages turns, checks for victory/draw, and controls the game state across matches. |
| `lib/gui_gameboard.rb` | **GUI Logic.** Handles all visual components (drawing symbols, clearing the board, displaying messages) and registers mouse input. |
| `lib/gameboard.rb` | Defines the logical state of the 3x3 board (which cells are occupied). |
| `lib/player.rb` | Defines the Player class (name and symbol). |
| `Gemfile` | Lists the project's required Ruby gems. |

---

## Credits

Developed by `@fabs82` as a practice project in the Ruby path of The Odin Project.