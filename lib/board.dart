import 'package:algo_lab/levels.dart';

class Board {
  List<List<String>> cells;
  Board? parent;
  int cost;
  int depth;
  int heuristic;

  Board({required this.cells, this.parent, required this.depth, required this.cost, required this.heuristic});

  // print current state
  void printBoard() {
    for (List<String> row in cells) {
      String s = "";
      for (String cell in row) {
        if (cell == '@') {
          s = '$s @ ';
        } else if (cell == '#') {
          s = '$s # ';
        } else {
          s = '$s   ';
        }
      }
      print(s);
    }
    print("");
  }

  // returns a new state from the current state after clicking a white cell
  Board? _clickCell(int x, int y) {
    List<List<String>> copied = [];

    for (List<String> row in cells) {
      List<String> temp = [];
      for (String cell in row) {
        temp.add(cell);
      }
      copied.add(temp);
    }

    if (copied[x][y] != '@' || !_inRange(x, y)) return null;
    copied[x][y] = ' ';
    _flipAdjacentCell(x - 1, y, copied);
    _flipAdjacentCell(x + 1, y, copied);
    _flipAdjacentCell(x, y - 1, copied);
    _flipAdjacentCell(x, y + 1, copied);
    return Board(
      cells: copied,
      parent: this,
      depth: depth + 1,
      cost: 1,
      heuristic: countWhites(copied),
    );
  }

  // helper method to flip all 4 adjacent cells (of the new state)
  void _flipAdjacentCell(int x, int y, List<List<String>> copied) {
    if (copied[x][y] == '#' || !_inRange(x, y)) return;
    copied[x][y] == '@' ? copied[x][y] = ' ' : copied[x][y] = '@';
  }

  // edit the current state by letting user click on a white cell
  void clickCellManually(int x, int y) {
    if (cells[x][y] != '@' || !_inRange(x, y)) return;
    cells[x][y] = ' ';
    _flipAdjacentCellManually(x - 1, y);
    _flipAdjacentCellManually(x + 1, y);
    _flipAdjacentCellManually(x, y - 1);
    _flipAdjacentCellManually(x, y + 1);
  }

  // helper method to flip all 4 adjacent cells (of the current state)
  void _flipAdjacentCellManually(int x, int y) {
    if (cells[x][y] == '#' || !_inRange(x, y)) return;
    cells[x][y] == '@' ? cells[x][y] = ' ' : cells[x][y] = '@';
  }

  bool _inRange(int x, int y) => 0 <= y && y < cells[0].length && 0 <= x && x < cells.length;

  // if we reached our goal (no white cells)
  bool isGoalState() {
    for (List<String> row in cells) {
      for (String cell in row) {
        if (cell == '@') return false;
      }
    }
    return true;
  }

  // generate all possible states from current states (by calling _clickCell method on each white cell)
  List<Board> generateStates() {
    List<Board> possibleBoards = [];

    for (int i = 0; i < cells.length; i++) {
      for (int j = 0; j < cells[i].length; j++) {
        if (cells[i][j] == '@') {
          Board? newBoard = _clickCell(i, j);
          if (newBoard != null) possibleBoards.add(newBoard);
        }
      }
    }

    return possibleBoards;
  }

  // edited hashcode of board instance to insure that every board with similar cells have the same hash
  @override
  int get hashCode {
    int hash = cells.length * cells[0].length;

    for (int i = 0; i < cells.length; i++) {
      for (int j = 0; j < cells[i].length; j++) {
        hash = hash * 17 + cells[i][j].hashCode * 31 + i * 13 + j;
      }
    }
    return hash;
  }

  // added a condition for 2 boards to be the same, to have the same reference, or to have the same cells matrix
  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Board && runtimeType == other.runtimeType && _deepEquals(cells, other.cells);

  bool _deepEquals(List<List<String>> a, List<List<String>> b) {
    if (a.length != b.length) return false;

    for (int i = 0; i < a.length; i++) {
      if (a[i].length != b[i].length) return false;

      for (int j = 0; j < a[i].length; j++) {
        if (a[i][j] != b[i][j]) return false;
      }
    }

    return true;
  }
}
