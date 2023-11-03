import 'cell.dart';

// List<List<String>> one = [
//   [
//     "#",
//     "#",
//     "#",
//     "#",
//     "#",
//   ],
//   [
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.black),
//     Cell(cellType: CellType.black),
//     Cell(cellType: CellType.black),
//     Cell(cellType: CellType.stone),
//   ],
//   [
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.black),
//     Cell(cellType: CellType.white),
//     Cell(cellType: CellType.black),
//     Cell(cellType: CellType.stone),
//   ],
//   [
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.black),
//     Cell(cellType: CellType.black),
//     Cell(cellType: CellType.black),
//     Cell(cellType: CellType.stone),
//   ],
//   [
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.stone),
//   ],
// ];
//
// List<List<Cell>> six = [
//   [
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.stone)
//   ],
//   [
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.black),
//     Cell(cellType: CellType.black),
//     Cell(cellType: CellType.black),
//     Cell(cellType: CellType.black),
//     Cell(cellType: CellType.black),
//     Cell(cellType: CellType.stone)
//   ],
//   [
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.white),
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.white),
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.white),
//     Cell(cellType: CellType.stone)
//   ],
//   [
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.black),
//     Cell(cellType: CellType.black),
//     Cell(cellType: CellType.black),
//     Cell(cellType: CellType.black),
//     Cell(cellType: CellType.black),
//     Cell(cellType: CellType.stone)
//   ],
//   [
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.stone)
//   ],
// ];

List<List<String>> seven = [
  ['#', '#', '#', '#', '#'],
  ['#', ' ', ' ', ' ', '#'],
  ['#', '#', '#', '@', '#'],
  ['#', ' ', ' ', ' ', '#'],
  ['#', '@', '#', '#', '#'],
  ['#', ' ', ' ', ' ', '#'],
  ['#', '#', '#', '#', '#'],
];

List<List<String>> nine = [
  [' ', '#', '#', '#', '#', '#', ' '],
  ['#', '#', ' ', '#', ' ', '#', '#'],
  ['#', ' ', ' ', ' ', ' ', ' ', '#'],
  ['#', '#', '@', '#', '@', '#', '#'],
  ['#', ' ', ' ', '#', ' ', ' ', '#'],
  ['#', '#', ' ', '#', ' ', '#', '#'],
  [' ', '#', '#', '#', '#', '#', ' '],
];

// List<List<Cell>> ten = [
//   [
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.stone)
//   ],
//   [
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.black),
//     Cell(cellType: CellType.black),
//     Cell(cellType: CellType.white),
//     Cell(cellType: CellType.black),
//     Cell(cellType: CellType.black),
//     Cell(cellType: CellType.stone)
//   ],
//   [
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.black),
//     Cell(cellType: CellType.black),
//     Cell(cellType: CellType.white),
//     Cell(cellType: CellType.black),
//     Cell(cellType: CellType.black),
//     Cell(cellType: CellType.stone)
//   ],
//   [
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.stone)
//   ],
// ];
//
// List<List<Cell>> twelve = [
//   [
//     Cell(cellType: CellType.black),
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.black)
//   ],
//   [
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.black),
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.black),
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.stone)
//   ],
//   [
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.white),
//     Cell(cellType: CellType.black),
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.black),
//     Cell(cellType: CellType.white),
//     Cell(cellType: CellType.stone)
//   ],
//   [
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.black),
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.black),
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.stone)
//   ],
//   [
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.black),
//     Cell(cellType: CellType.black),
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.black),
//     Cell(cellType: CellType.black),
//     Cell(cellType: CellType.stone)
//   ],
//   [
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.white),
//     Cell(cellType: CellType.black),
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.black),
//     Cell(cellType: CellType.white),
//     Cell(cellType: CellType.stone)
//   ],
//   [
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.stone),
//     Cell(cellType: CellType.stone)
//   ],
// ];

List<List<String>> getLevel(List<List<String>> level) {
  List<List<String>> copied = [];

  for (List<String> row in level) {
    List<String> temp = [];
    for (String cell in row) {
      temp.add(cell);
    }
    copied.add(temp);
  }
  return copied;
}
