import 'dart:io';

import 'package:algo_lab/cell.dart';

class Board {
  List<List<Cell>> cells;

  Board({required this.cells});

  void printBoard() {
    for (List<Cell> row in cells) {
      for (Cell cell in row) {
        stdout.write("${cell.cellType.toString()} ");
      }
      print("");
    }
  }

  void clickCellManually(int x, int y) {
    if (cells[x][y].cellType != CellType.white || !_inRange(x, y)) return;
    cells[x][y].cellType = CellType.black;
    _flipAdjacentCellManually(x - 1, y);
    _flipAdjacentCellManually(x + 1, y);
    _flipAdjacentCellManually(x, y - 1);
    _flipAdjacentCellManually(x, y + 1);
  }

  Board? clickCell(int x, int y) {
    List<List<Cell>> copied = [
      for (var row in cells) [...row]
    ];
    if (cells[x][y].cellType != CellType.white || !_inRange(x, y)) return null;
    cells[x][y].cellType = CellType.black;
    _flipAdjacentCell(x - 1, y, copied);
    _flipAdjacentCell(x + 1, y, copied);
    _flipAdjacentCell(x, y - 1, copied);
    _flipAdjacentCell(x, y + 1, copied);
    return Board(cells: copied);
  }

  void _flipAdjacentCell(int x, int y, List<List<Cell>> copied) {
    if (copied[x][y].cellType == CellType.stone || !_inRange(x, y)) return;
    copied[x][y].cellType == CellType.white
        ? copied[x][y].cellType = CellType.black
        : copied[x][y].cellType = CellType.white;
  }

  void _flipAdjacentCellManually(int x, int y) {
    if (cells[x][y].cellType == CellType.stone || !_inRange(x, y)) return;
    cells[x][y].cellType == CellType.white
        ? cells[x][y].cellType = CellType.black
        : cells[x][y].cellType = CellType.white;
  }

  bool _inRange(int x, int y) => 0 <= y && y < cells[0].length && 0 <= x && x < cells.length;

  bool isGoalState() {
    for (List<Cell> row in cells) {
      for (Cell cell in row) {
        if (cell.cellType == CellType.white) return false;
      }
    }
    return true;
  }

  List<Board> generateStates() {
    List<Board> possibleBoards = [];

    for (int i = 0; i < cells.length; i++) {
      for (int j = 0; j < cells[i].length; j++) {
        if (cells[i][j].cellType == CellType.white) {
          Board? newBoard = clickCell(i, j);
          if (newBoard != null) possibleBoards.add(newBoard);
        }
      }
    }

    return possibleBoards;
  }

  List<List<CellType>> getCellTypeMatrix() {
    return cells.map((row) {
      return row.map((cell) => cell.cellType).toList();
    }).toList();
  }

  @override
  int get hashCode {
    int hash = cells.length;

    for (var row in cells) {
      for (var cell in row) {
        hash = hash * 31 + cell.hashCode;
      }
    }
    return hash;
  }

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
