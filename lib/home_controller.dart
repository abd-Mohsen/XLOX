import 'dart:collection';
import 'dart:math';

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
      heuristic: countWhites(selectedLevel),
      cost: 0,
    );
    super.onInit();
  }

  void restartLevel() {
    currentBoard = Board(
      cells: getLevel(selectedLevel),
      depth: 0,
      heuristic: countWhites(selectedLevel),
      cost: 1,
    );
    update();
    Get.back();
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

  // classic bfs, here we add the node (board) to visited set when its pushed to queue
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
        int commonCount = visited.where((visitedState) => queue.contains(visitedState)).length;
        int treeDepth = maxDepth(visited);
        Get.defaultDialog(
          title: "BFS success",
          middleText: "after $i attempts\n\n ${visited.length} visited nodes\n depth = ${currentState.depth}\n"
              "path cost = $pathCost\n"
              "generated states = ${(visited.length - commonCount) + queue.length}\n"
              "max tree depth = $treeDepth",
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

  // classic dfs, here we add the node (board) to visited set when its pushed to stack
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
        int commonCount = visited.where((visitedState) => stack.contains(visitedState)).length;
        int treeDepth = maxDepth(visited);
        Get.defaultDialog(
          title: "DFS success",
          middleText: "after $i attempts\n\n ${visited.length} visited nodes\n depth = ${currentState.depth}\n"
              "path cost = $pathCost\n"
              "generated states = ${(visited.length - commonCount) + stack.length}\n"
              "max tree depth = $treeDepth",
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

  // here we add the node (board) to visited set when its pushed to priority queue
  void ucs() async {
    PriorityQueue<Board> queue = PriorityQueue((a, b) => a.cost.compareTo(b.cost)); // min heap
    Set<Board> visited = {};
    int i = 0; // counter

    queue.add(currentBoard);
    visited.add(currentBoard);

    while (queue.isNotEmpty) {
      Board currentState = queue.removeFirst();

      print("UCS running, current state:");
      currentState.printBoard();

      if (currentState.isGoalState()) {
        print("success, after $i states (num of visits), depth = ${currentState.depth}");
        int pathCost = await createPath(currentState);
        Get.defaultDialog(
          title: "UCS success",
          middleText: "after $i attempts\n\n ${visited.length} visited nodes\n depth = ${currentState.depth}\n"
              "path cost = $pathCost\n generated states = ${visited.length + queue.length}\n",
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

  // here we add the node (board) to visited set when its pushed to priority queue
  void hillClimbing() async {
    PriorityQueue<Board> queue = PriorityQueue((a, b) => a.heuristic.compareTo(b.heuristic)); // min heap
    Set<Board> visited = {};
    int i = 0; // counter

    queue.add(currentBoard);
    visited.add(currentBoard);

    while (queue.isNotEmpty) {
      Board currentState = queue.removeFirst();

      print("hill climbing running, current state:");
      currentState.printBoard();

      if (currentState.isGoalState()) {
        print("success, after $i states (num of visits), depth = ${currentState.depth}");
        int pathCost = await createPath(currentState);
        int commonCount = visited.where((visitedState) => queue.contains(visitedState)).length;
        int treeDepth = maxDepth(visited);
        Get.defaultDialog(
          title: "HILL CLIMBING success",
          middleText: "after $i attempts\n\n ${visited.length} visited nodes\n depth = ${currentState.depth}\n"
              "path cost = $pathCost\n generated states = ${(visited.length - commonCount) + queue.length}\n"
              "max tree depth = $treeDepth",
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

  // here we add the node (board) to visited set when its pushed to priority queue,
  // and we replace an already visited node and add it back to p.queue if it has less cost
  void hillClimbingReplace() async {
    PriorityQueue<Board> queue = PriorityQueue((a, b) => a.heuristic.compareTo(b.heuristic)); // min heap
    Set<Board> visited = {};
    int i = 0; // counter

    queue.add(currentBoard);

    while (queue.isNotEmpty) {
      Board currentState = queue.removeFirst();

      if (visited.contains(currentState)) continue;

      visited.add(currentState);

      print("hill climbing running, current state:");
      currentState.printBoard();

      if (currentState.isGoalState()) {
        print("success, after $i states (num of visits), depth = ${currentState.depth}");
        int pathCost = await createPath(currentState);
        int commonCount = visited.where((visitedState) => queue.contains(visitedState)).length;
        int treeDepth = maxDepth(visited);
        Get.defaultDialog(
          title: "HILL CLIMBING success",
          middleText: "after $i attempts\n\n ${visited.length} visited nodes\n depth = ${currentState.depth}\n"
              "path cost = $pathCost\n"
              "generated states = ${(visited.length - commonCount) + queue.length}\n"
              "max tree depth = $treeDepth",
        );
        return;
      }

      List<Board> possibleStates = currentState.generateStates();

      for (Board state in possibleStates) {
        if (!visited.contains(state)) {
          queue.add(state);
        } else {
          // replace with lower heuristic
          Board visitedState = visited.firstWhere((ogState) => ogState == state);
          if (state.heuristic < visitedState.heuristic) {
            visited.remove(visitedState);
            queue.add(state);
          }
        }
      }
      i++;
    }
    print("this shouldn't print");
  }

  // here we add the node (board) to visited set when its popped from priority queue
  void aStar() async {
    PriorityQueue<Board> queue = PriorityQueue((a, b) => (a.heuristic + a.cost).compareTo(b.heuristic + b.cost));
    Set<Board> visited = {};
    int i = 0; // counter

    queue.add(currentBoard);

    while (queue.isNotEmpty) {
      Board currentState = queue.removeFirst();

      if (visited.contains(currentState)) continue;

      visited.add(currentState);

      print("a* running, current state:");
      currentState.printBoard();

      if (currentState.isGoalState()) {
        print("success, after $i states (num of visits), depth = ${currentState.depth}");
        int pathCost = await createPath(currentState);
        int commonCount = visited.where((visitedState) => queue.contains(visitedState)).length;
        int treeDepth = maxDepth(visited);
        Get.defaultDialog(
          title: "a* success",
          middleText: "after $i attempts\n\n ${visited.length} visited nodes\n depth = ${currentState.depth}\n"
              "path cost = $pathCost\n"
              "generated states = ${(visited.length - commonCount) + queue.length}\n"
              "max tree depth = $treeDepth",
        );
        return;
      }

      List<Board> possibleStates = currentState.generateStates();

      for (Board state in possibleStates) {
        if (!visited.contains(state)) {
          queue.add(state);
        } else {
          // replace with lower heuristic
          Board visitedState = visited.firstWhere((ogState) => ogState == state);
          if ((state.heuristic + state.cost) < (visitedState.heuristic + visitedState.cost)) {
            visited.remove(visitedState);
            queue.add(state);
          }
        }
      }
      i++;
    }
    print("this shouldn't print");
  }

  // here we add the node (board) to visited set when its popped from priority queue
  void ucsV2() async {
    PriorityQueue<Board> queue = PriorityQueue((a, b) => a.cost.compareTo(b.cost)); // min heap
    Set<Board> visited = {};
    int i = 0; // counter

    queue.add(currentBoard);

    while (queue.isNotEmpty) {
      Board currentState = queue.removeFirst();

      if (visited.contains(currentState)) continue;

      visited.add(currentState);

      print("ucs climbing running, current state:");
      currentState.printBoard();

      if (currentState.isGoalState()) {
        print("success, after $i states (num of visits), depth = ${currentState.depth}");
        int pathCost = await createPath(currentState);
        int commonCount = visited.where((visitedState) => queue.contains(visitedState)).length;
        int treeDepth = maxDepth(visited);
        Get.defaultDialog(
          title: "UCS success",
          middleText: "after $i attempts\n\n"
              "${visited.length} visited nodes\n"
              "depth = ${currentState.depth}\n"
              "path cost = $pathCost\n"
              "generated states = ${(visited.length - commonCount) + queue.length}\n"
              "max tree depth = $treeDepth",
        );
        return;
      }

      List<Board> possibleStates = currentState.generateStates();

      for (Board state in possibleStates) {
        if (!visited.contains(state)) queue.add(state);
      }
      i++;
    }
    print("this shouldn't print");
  }

  // here we add the node (board) to visited set when its popped from priority queue
  void hillClimbingV2() async {
    PriorityQueue<Board> queue = PriorityQueue((a, b) => a.heuristic.compareTo(b.heuristic)); // min heap
    Set<Board> visited = {};
    int i = 0; // counter

    queue.add(currentBoard);

    while (queue.isNotEmpty) {
      Board currentState = queue.removeFirst();

      if (visited.contains(currentState)) continue;

      visited.add(currentState);

      print("hill climbing running, current state:");
      currentState.printBoard();

      if (currentState.isGoalState()) {
        print("success, after $i states (num of visits), depth = ${currentState.depth}");
        int pathCost = await createPath(currentState);
        int commonCount = visited.where((visitedState) => queue.contains(visitedState)).length;
        int treeDepth = maxDepth(visited);
        Get.defaultDialog(
          title: "HILL CLIMBING success",
          middleText: "after $i attempts\n\n ${visited.length} visited nodes\n depth = ${currentState.depth}\n"
              "path cost = $pathCost\n"
              "generated states = ${(visited.length - commonCount) + queue.length}\n"
              "max tree depth = $treeDepth",
        );
        return;
      }

      List<Board> possibleStates = currentState.generateStates();

      for (Board state in possibleStates) {
        if (!visited.contains(state)) queue.add(state);
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
      pathCost += res[i].cost; // todo: what is path cost ? is it related to heuristic ?
      currentBoard = res[i];
      update();
    }
    return pathCost;
  }

  int maxDepth(Set nodes) {
    int res = 0;
    for (Board node in nodes) {
      res = max(res, node.depth);
    }
    return res;
  }
}
