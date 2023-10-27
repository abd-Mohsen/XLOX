import 'dart:collection';

import 'package:algo_lab/board.dart';
import 'package:get/get.dart';

import 'cell.dart';
import 'game_state.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    List<List<Cell>> cells = [
      [
        Cell(cellType: CellType.stone),
        Cell(cellType: CellType.stone),
        Cell(cellType: CellType.stone),
        Cell(cellType: CellType.stone),
        Cell(cellType: CellType.stone),
        Cell(cellType: CellType.stone),
        Cell(cellType: CellType.stone)
      ],
      [
        Cell(cellType: CellType.stone),
        Cell(cellType: CellType.black),
        Cell(cellType: CellType.black),
        Cell(cellType: CellType.black),
        Cell(cellType: CellType.black),
        Cell(cellType: CellType.black),
        Cell(cellType: CellType.stone)
      ],
      [
        Cell(cellType: CellType.stone),
        Cell(cellType: CellType.white),
        Cell(cellType: CellType.stone),
        Cell(cellType: CellType.white),
        Cell(cellType: CellType.stone),
        Cell(cellType: CellType.white),
        Cell(cellType: CellType.stone)
      ],
      [
        Cell(cellType: CellType.stone),
        Cell(cellType: CellType.black),
        Cell(cellType: CellType.black),
        Cell(cellType: CellType.black),
        Cell(cellType: CellType.black),
        Cell(cellType: CellType.black),
        Cell(cellType: CellType.stone)
      ],
      [
        Cell(cellType: CellType.stone),
        Cell(cellType: CellType.stone),
        Cell(cellType: CellType.stone),
        Cell(cellType: CellType.stone),
        Cell(cellType: CellType.stone),
        Cell(cellType: CellType.stone),
        Cell(cellType: CellType.stone)
      ],
    ];
    board = Board(cells: cells);
    currentGameState = GameState(board: board.getCellTypeMatrix());
    super.onInit();
  }

  late final Board board;

  void click(int x, int y) {
    board.clickCell(x, y);
    update();
  }

  late GameState currentGameState;

  void makeAIMove() {
    GameState? optimalState = bfs(currentGameState);

    if (optimalState != null) {
      // Apply the optimal move to update the game state
      currentGameState = optimalState;
      update();
    }
  }

  GameState? bfs(GameState initialState) {
    Queue<GameState> queue = Queue();
    Set<GameState> visited = {};

    queue.add(initialState);
    visited.add(initialState);

    while (queue.isNotEmpty) {
      GameState currentState = queue.removeFirst();

      if (currentState.isGoalState()) return currentState; // Found the optimal move

      List<Move> possibleMoves = currentState.generateMoves();

      for (Move move in possibleMoves) {
        GameState newState = currentState.applyMove(move);

        if (!visited.contains(newState)) {
          queue.add(newState);
          visited.add(newState);
        }
      }
    }

    return null; // No solution found
  }
}
