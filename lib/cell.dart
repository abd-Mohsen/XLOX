enum CellType {
  black,
  white,
  stone,
}

class Cell {
  CellType cellType;
  // int x;
  // int y;
  Cell({required this.cellType});
}
