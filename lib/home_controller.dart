import 'dart:collection';

import 'package:algo_lab/board.dart';
import 'package:algo_lab/levels.dart';
import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:stack/stack.dart';

class HomeController extends GetxController {
  List<List<String>> selectedLevel = one;

  late Board currentBoard; // current board rendered on the page

  // its like the constructor of this class, being called after the page "home view" opens
  @override
  void onInit() {
    currentBoard = Board(
      cells: getLevel(selectedLevel),
      depth: 0,
      cost: countWhites(selectedLevel),
    );
    super.onInit();
  }

  void restartLevel() {
    currentBoard = Board(
      cells: getLevel(selectedLevel),
      depth: 0,
      cost: countWhites(selectedLevel),
    );
    update();
  }

  void selectLevel(List<List<String>> level) {
    selectedLevel = level;
    restartLevel();
  }

  // to update ui when user clicks
  void click(int x, int y) {
    currentBoard.clickCellManually(x, y);
    update();
    currentBoard.printBoard();
    if (currentBoard.isGoalState()) Get.defaultDialog(title: "success", middleText: "you won");
  }

  void ucs() async {
    PriorityQueue<Board> queue = PriorityQueue((a, b) => a.cost.compareTo(b.cost)); // min heap
    Set<Board> visited = {};
    int i = 0; // counter

    queue.add(currentBoard);
    visited.add(currentBoard);

    while (queue.isNotEmpty) {
      Board currentState = queue.removeFirst();

      print("ucs running, current state:");
      currentState.printBoard();

      if (currentState.isGoalState()) {
        print("success, after $i states (num of visits), depth = ${currentState.depth}");
        int pathCost = await createPath(currentState);
        Get.defaultDialog(
          title: "UCS success",
          middleText: "after $i attempts\n\n ${visited.length} visited nodes\n depth = ${currentState.depth}\n"
              "path cost = $pathCost",
        );
        return;
      }

      List<Board> possibleStates = currentState.generateStates();

      for (Board state in possibleStates) {
        if (!visited.contains(state)) {
          queue.add(state);
          visited.add(state);
        }
      }
      i++;
    }
    print("this shouldn't print");
  }

  void bfs() async {
    Queue<Board> queue = Queue();
    Set<Board> visited = {};
    int i = 0; // counter

    queue.add(currentBoard); //board is initial state
    visited.add(currentBoard);

    while (queue.isNotEmpty) {
      Board currentState = queue.removeFirst();

      print("bfs running, current state:");
      currentState.printBoard();

      //if all white cells are eliminated, show the result and return
      if (currentState.isGoalState()) {
        print("success, after $i states (num of visits), depth = ${currentState.depth}");
        int pathCost = await createPath(currentState);
        Get.defaultDialog(
          title: "BFS success",
          middleText: "after $i attempts\n\n ${visited.length} visited nodes\n depth = ${currentState.depth}\n"
              "path cost = $pathCost",
        );
        return;
      }

      List<Board> possibleStates = currentState.generateStates();

      for (Board state in possibleStates) {
        if (!visited.contains(state)) {
          queue.add(state);
          visited.add(state);
        }
      }
      i++;
    }
    print("this shouldn't print");
  }

  void dfs() async {
    Stack<Board> stack = Stack();
    Set<Board> visited = {};
    int i = 0;

    stack.push(currentBoard);
    visited.add(currentBoard);

    while (stack.isNotEmpty) {
      Board currentState = stack.pop();

      print("running dfs, current state:");
      currentState.printBoard();

      if (currentState.isGoalState()) {
        print("success, after $i states (num of visits), depth = ${currentState.depth}");
        int pathCost = await createPath(currentState);
        Get.defaultDialog(
          title: "DFS success",
          middleText: "after $i attempts\n\n ${visited.length} visited nodes\n depth = ${currentState.depth}\n"
              "path cost = $pathCost",
        );
        return;
      }

      List<Board> possibleStates = currentState.generateStates();

      for (Board state in possibleStates) {
        if (!visited.contains(state)) {
          stack.push(state);
          visited.add(state);
        }
      }
      i++;
    }
    print("this shouldn't print");
  }

  Future<int> createPath(Board board) async {
    List<Board> path = [];
    Board? curr = board;

    while (curr != null) {
      path.add(curr);
      curr = curr.parent;
    }
    List<Board> res = path.reversed.toList();

    int pathCost = 0;
    for (int i = 0; i < res.length; i++) {
      print(i);
      res[i].printBoard();
      await Future.delayed(Duration(milliseconds: 400));
      pathCost += res[i].cost;
      currentBoard = res[i];
      update();
    }
    return pathCost;
  }
}
