import 'package:algo_lab/cell.dart';

class Board {
  List<List<Cell>> cells;

  Board({required this.cells});

  // print current state
  void printBoard() {
    for (List<Cell> row in cells) {
      String s = "";
      for (Cell cell in row) {
        if (cell.cellType == CellType.white) {
          s = '$s @ ';
        } else if (cell.cellType == CellType.stone) {
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
    List<List<Cell>> copied = [];

    for (List<Cell> row in cells) {
      List<Cell> temp = [];
      for (Cell cell in row) {
        temp.add(Cell(cellType: cell.cellType));
      }
      copied.add(temp);
    }

    if (copied[x][y].cellType != CellType.white || !_inRange(x, y)) return null;
    copied[x][y].cellType = CellType.black;
    _flipAdjacentCell(x - 1, y, copied);
    _flipAdjacentCell(x + 1, y, copied);
    _flipAdjacentCell(x, y - 1, copied);
    _flipAdjacentCell(x, y + 1, copied);
    return Board(cells: copied);
  }

  // helper method to flip all 4 adjacent cells (of the new state)
  void _flipAdjacentCell(int x, int y, List<List<Cell>> copied) {
    if (copied[x][y].cellType == CellType.stone || !_inRange(x, y)) return;
    copied[x][y].cellType == CellType.white
        ? copied[x][y].cellType = CellType.black
        : copied[x][y].cellType = CellType.white;
  }

  // edit the current state by letting user click on a white cell
  void clickCellManually(int x, int y) {
    if (cells[x][y].cellType != CellType.white || !_inRange(x, y)) return;
    cells[x][y].cellType = CellType.black;
    _flipAdjacentCellManually(x - 1, y);
    _flipAdjacentCellManually(x + 1, y);
    _flipAdjacentCellManually(x, y - 1);
    _flipAdjacentCellManually(x, y + 1);
  }

  // helper method to flip all 4 adjacent cells (of the current state)
  void _flipAdjacentCellManually(int x, int y) {
    if (cells[x][y].cellType == CellType.stone || !_inRange(x, y)) return;
    cells[x][y].cellType == CellType.white
        ? cells[x][y].cellType = CellType.black
        : cells[x][y].cellType = CellType.white;
  }

  bool _inRange(int x, int y) => 0 <= y && y < cells[0].length && 0 <= x && x < cells.length;

  // if we reached our goal (no white cells)
  bool isGoalState() {
    for (List<Cell> row in cells) {
      for (Cell cell in row) {
        if (cell.cellType == CellType.white) return false;
      }
    }
    return true;
  }

  // generate all possible states from current states (by calling _clickCell method on each white cell)
  List<Board> generateStates() {
    List<Board> possibleBoards = [];

    for (int i = 0; i < cells.length; i++) {
      for (int j = 0; j < cells[i].length; j++) {
        if (cells[i][j].cellType == CellType.white) {
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

  bool _deepEquals(List<List<Cell>> a, List<List<Cell>> b) {
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
