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

  void clickCell(int x, int y) {
    if (cells[x][y].cellType != CellType.white || !_inRange(x, y)) return;
    cells[x][y].cellType = CellType.black;
    _flipAdjacentCell(x - 1, y);
    _flipAdjacentCell(x + 1, y);
    _flipAdjacentCell(x, y - 1);
    _flipAdjacentCell(x, y + 1);
  }

  void _flipAdjacentCell(int x, int y) {
    if (cells[x][y].cellType == CellType.stone || !_inRange(x, y)) return;
    cells[x][y].cellType == CellType.white
        ? cells[x][y].cellType = CellType.black
        : cells[x][y].cellType = CellType.white;
  }

  bool _inRange(int x, int y) => 0 <= y && y < cells[0].length && 0 <= x && x < cells.length;

  bool check() {
    for (List<Cell> row in cells) {
      for (Cell cell in row) {
        if (cell.cellType == CellType.white) return false;
      }
    }
    return true;
  }

  List<List<CellType>> getCellTypeMatrix() {
    return cells.map((row) {
      return row.map((cell) => cell.cellType).toList();
    }).toList();
  }
}
