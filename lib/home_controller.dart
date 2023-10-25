import 'package:algo_lab/board.dart';
import 'package:get/get.dart';

import 'cell.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    List<List<Cell>> cells = [
      [
        Cell(cellType: CellType.stone),
        Cell(cellType: CellType.stone),
        Cell(cellType: CellType.stone),
        Cell(cellType: CellType.stone),
        Cell(cellType: CellType.stone),
        Cell(cellType: CellType.stone),
        Cell(cellType: CellType.stone)
      ],
      [
        Cell(cellType: CellType.stone),
        Cell(cellType: CellType.black),
        Cell(cellType: CellType.black),
        Cell(cellType: CellType.black),
        Cell(cellType: CellType.black),
        Cell(cellType: CellType.black),
        Cell(cellType: CellType.stone)
      ],
      [
        Cell(cellType: CellType.stone),
        Cell(cellType: CellType.white),
        Cell(cellType: CellType.stone),
        Cell(cellType: CellType.white),
        Cell(cellType: CellType.stone),
        Cell(cellType: CellType.white),
        Cell(cellType: CellType.stone)
      ],
      [
        Cell(cellType: CellType.stone),
        Cell(cellType: CellType.black),
        Cell(cellType: CellType.black),
        Cell(cellType: CellType.black),
        Cell(cellType: CellType.black),
        Cell(cellType: CellType.black),
        Cell(cellType: CellType.stone)
      ],
      [
        Cell(cellType: CellType.stone),
        Cell(cellType: CellType.stone),
        Cell(cellType: CellType.stone),
        Cell(cellType: CellType.stone),
        Cell(cellType: CellType.stone),
        Cell(cellType: CellType.stone),
        Cell(cellType: CellType.stone)
      ],
    ];
    board = Board(cells: cells);
    super.onInit();
  }

  late final Board board;

  void click(int x, int y) {
    board.clickCell(x, y);
    update();
  }
}
