import 'dart:collection';

import 'package:algo_lab/board.dart';
import 'package:get/get.dart';

import 'cell.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    board = Board(cells: initialCells);
    super.onInit();
  }

  List<List<Cell>> initialCells = [
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

  late final Board board;

  void click(int x, int y) {
    board.clickCellManually(x, y);
    update();
    if (board.isGoalState()) Get.defaultDialog(title: "success", middleText: "you won");
  }

  Board? bfs(Board initialState) {
    Queue<Board> queue = Queue();
    HashSet<Board> visited = HashSet();

    queue.add(initialState);
    visited.add(initialState);

    while (queue.isNotEmpty) {
      Board currentState = queue.removeFirst();

      if (currentState.isGoalState()) return currentState;

      List<Board> possibleStates = currentState.generateStates();

      for (Board state in possibleStates) {
        if (!visited.contains(state)) {
          queue.add(state);
          visited.add(state);
        }
      }
    }

    return null;
  }
}
