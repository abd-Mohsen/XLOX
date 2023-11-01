import 'dart:collection';

import 'package:algo_lab/board.dart';
import 'package:algo_lab/levels.dart';
import 'package:get/get.dart';
import 'package:stack/stack.dart';

import 'cell.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    board = Board(cells: initialCells);
    super.onInit();
  }

  List<List<Cell>> initialCells = nine;

  late Board board;

  void click(int x, int y) {
    board.clickCellManually(x, y);
    update();
    board.printBoard();
    if (board.isGoalState()) Get.defaultDialog(title: "success", middleText: "you won");
  }

  void bfs() async {
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
      update();
      i++;
    }
    //visited.toList().forEach((element) => element.printBoard());
    print("it gave up");
  }

  void dfs() async {
    Stack<Board> stack = Stack();
    Set<Board> visited = {};
    int i = 0;

    stack.push(board);
    visited.add(board);

    while (stack.isNotEmpty) {
      Board currentState = stack.pop();
      board = currentState;

      print("curr state:");
      currentState.printBoard();

      if (currentState.isGoalState()) print("success, after $i iterations");
      if (currentState.isGoalState()) return;

      List<Board> possibleStates = currentState.generateStates();

      for (Board state in possibleStates) {
        //print("state ${state.hashCode} generated from ${currentState.hashCode}");

        if (!visited.contains(state)) {
          stack.push(state);
          visited.add(state);
        }
      }

      //await Future.delayed(Duration(seconds: 1));
      update();
      i++;
    }
    //visited.toList().forEach((element) => element.printBoard());
    print("it gave up");
  }
}
