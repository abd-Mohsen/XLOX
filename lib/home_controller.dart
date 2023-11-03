import 'dart:collection';

import 'package:algo_lab/board.dart';
import 'package:algo_lab/levels.dart';
import 'package:get/get.dart';
import 'package:stack/stack.dart';

import 'cell.dart';

class HomeController extends GetxController {
  List<List<String>> selectedLevel = nine; // choose the level (from levels.dart)

  late Board board; // current board rendered on the page

  // its like the constructor of this class, being called after the page "home view" opens
  @override
  void onInit() {
    board = Board(cells: getLevel(selectedLevel));
    super.onInit();
  }

  void refreshLevel() {
    board = Board(cells: getLevel(selectedLevel));
    update();
  }

  // to update ui after user click
  void click(int x, int y) {
    board.clickCellManually(x, y);
    update();
    board.printBoard();
    if (board.isGoalState()) Get.defaultDialog(title: "success", middleText: "you won");
  }

  void bfs() {
    Queue<Board> queue = Queue();
    Set<Board> visited = {};
    int i = 0; // counter

    queue.add(board); //board is initial state
    visited.add(board);

    while (queue.isNotEmpty) {
      Board currentState = queue.removeFirst();
      board = currentState; // to update ui at every iteration

      print("curr state:");
      currentState.printBoard();

      //if all white cells are eliminated, return
      if (currentState.isGoalState()) {
        print("success, after $i iterations");
        return;
      }

      // generate all possible boards (states) from current state
      List<Board> possibleStates = currentState.generateStates();

      for (Board state in possibleStates) {
        if (!visited.contains(state)) {
          queue.add(state);
          visited.add(state);
        }
      }
      update();
      i++;
    }
    print("it gave up");
  }

  void dfs() {
    Stack<Board> stack = Stack();
    Set<Board> visited = {};
    int i = 0;
    int j = 0;

    stack.push(board);
    visited.add(board);

    while (stack.isNotEmpty) {
      Board currentState = stack.pop();
      board = currentState;

      print("curr state:");
      currentState.printBoard();

      if (currentState.isGoalState()) {
        print("success, after $i iterations, j = $j");
        return;
      }

      List<Board> possibleStates = currentState.generateStates();

      for (Board state in possibleStates) {
        //print("state ${state.hashCode} generated from ${currentState.hashCode}");

        if (!visited.contains(state)) {
          stack.push(state);
          visited.add(state);
          j++;
        }
      }
      update();
      i++;
    }
    print("it gave up");
  }
}
