import 'dart:collection';
import 'dart:io';

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

  late Board board;

  void click(int x, int y) {
    board.clickCellManually(x, y);
    update();
    board.printBoard();
    if (board.isGoalState()) Get.defaultDialog(title: "success", middleText: "you won");
  }

  void bfs() async {
    //todo: how tf ui is updating if i am not modifying 'board'!?
    Queue<Board> queue = Queue();
    Set<Board> visited = {};
    int i = 0;

    queue.add(board);
    visited.add(board);

    while (queue.isNotEmpty) {
      Board currentState = queue.removeFirst();
      board = currentState;

      print("curr state:");
      currentState.printBoard();

      if (currentState.isGoalState()) print("success, after $i iterations");
      if (currentState.isGoalState()) return;

      List<Board> possibleStates = currentState.generateStates();

      for (Board state in possibleStates) {
        //print("state ${state.hashCode} generated from ${currentState.hashCode}");

        if (!visited.contains(state)) {
          queue.add(state);
          visited.add(state);
        }
      }

      //await Future.delayed(Duration(seconds: 1));
      print("inside while");
      update();
      i++;
    }
    //visited.toList().forEach((element) => element.printBoard());
    print("it gave up");
  }
}
