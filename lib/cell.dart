enum CellType {
  black,
  white,
  stone,
}

class Cell {
  CellType cellType;
  Cell({required this.cellType});
  @override
  int get hashCode => cellType.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Cell && runtimeType == other.runtimeType && cellType == other.cellType;
}
