List<List<String>> one = [
  ["#", "#", "#", "#", "#"],
  ["#", " ", " ", " ", "#"],
  ["#", " ", "@", " ", "#"],
  ["#", " ", " ", " ", "#"],
  ["#", "#", "#", "#", "#"],
];

List<List<String>> two = [
  ["#", "#", "#", "#", "#"],
  ["#", " ", "#", " ", "#"],
  ["#", " ", "@", " ", "#"],
  ["#", " ", "#", " ", "#"],
  ["#", "#", "#", "#", "#"],
];

List<List<String>> three = [
  ["#", "#", "#"],
  ["#", "@", "#"],
  ["#", " ", "#"],
  ["#", "@", "#"],
  ["#", " ", "#"],
  ["#", "@", "#"],
  ["#", "#", "#"],
];

List<List<String>> four = [
  ["#", "#", "#", "#", "#"],
  ["#", " ", " ", " ", "#"],
  ["#", " ", "#", " ", "#"],
  ["#", "@", "#", "@", "#"],
  ["#", "#", "#", "#", "#"],
];

List<List<String>> six = [
  ['#', '#', '#', '#', '#', '#', '#'],
  ['#', ' ', ' ', ' ', ' ', ' ', '#'],
  ['#', '@', '#', '@', '#', '@', '#'],
  ['#', ' ', ' ', ' ', ' ', ' ', '#'],
  ['#', '#', '#', '#', '#', '#', '#'],
];

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

List<List<String>> ten = [
  ['#', '#', '#', '#', '#', '#', '#'],
  ['#', ' ', ' ', '@', ' ', ' ', '#'],
  ['#', ' ', ' ', '@', ' ', ' ', '#'],
  ['#', '#', '#', '#', '#', '#', '#'],
];

List<List<String>> twelve = [
  [' ', '#', '#', '#', '#', '#', ' '],
  ['#', '#', ' ', '#', ' ', '#', '#'],
  ['#', '@', ' ', '#', ' ', '@', '#'],
  ['#', '#', ' ', '#', ' ', '#', '#'],
  ['#', ' ', ' ', '#', ' ', ' ', '#'],
  ['#', '@', ' ', '#', ' ', '@', '#'],
  ['#', '#', '#', '#', '#', '#', '#'],
];

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

int countWhites(List<List<String>> cells) {
  int count = 0;

  for (List<String> row in cells) {
    for (String cell in row) {
      if (cell == '@') count++;
    }
  }

  return count;
}

// int distanceToClosestBlackCell(List<List<String>> cells) {
//   int minDistance = cells.length * cells[0].length;
//   for (int i = 0; i < cells.length; i++) {
//     for (int j = 0; j < cells[i].length; j++) {
//       if (cells[i][j] == 'W') {
//         int distance = _calculateDistanceToClosestBlackCell(cells, i, j);
//         if (distance < minDistance) {
//           minDistance = distance;
//         }
//       }
//     }
//   }
//   return minDistance;
// }
//
// int _calculateDistanceToClosestBlackCell(List<List<String>> cells, int row, int col) {
//   int minDistance = cells.length * cells[0].length;
//   for (int i = 0; i < cells.length; i++) {
//     for (int j = 0; j < cells[i].length; j++) {
//       if (cells[i][j] == 'B') {
//         int distance = (row - i).abs() + (col - j).abs(); // Manhattan distance
//         if (distance < minDistance) {
//           minDistance = distance;
//         }
//       }
//     }
//   }
//   return minDistance;
// }
//
// int numberOfConnectedWhiteCells(List<List<String>> cells) {
//   int count = 0;
//   Set<List<int>> visited = Set<List<int>>();
//   for (int i = 0; i < cells.length; i++) {
//     for (int j = 0; j < cells[i].length; j++) {
//       if (cells[i][j] == 'W' && !visited.contains([i, j])) {
//         Set<List<int>> connected = Set<List<int>>();
//         _helperDfs(cells, i, j, visited, connected);
//         count += connected.length;
//       }
//     }
//   }
//   return count;
// }
//
// void _helperDfs(List<List<String>> cells, int row, int col, Set<List<int>> visited, Set<List<int>> connected) {
//   if (row < 0 ||
//       row >= cells.length ||
//       col < 0 ||
//       col >= cells[0].length ||
//       cells[row][col] == 'B' ||
//       visited.contains([row, col])) {
//     return;
//   }
//   visited.add([row, col]);
//   connected.add([row, col]);
//   _helperDfs(cells, row + 1, col, visited, connected);
//   _helperDfs(cells, row - 1, col, visited, connected);
//   _helperDfs(cells, row, col + 1, visited, connected);
//   _helperDfs(cells, row, col - 1, visited, connected);
// }
//
// int countIsolatedWhiteCells(List<List<String>> cells) {
//   int count = 0;
//   for (int i = 0; i < cells.length; i++) {
//     for (int j = 0; j < cells[i].length; j++) {
//       if (cells[i][j] == 'W' && !_isAdjacentToBlackCell(cells, i, j)) {
//         count++;
//       }
//     }
//   }
//   return count;
// }
//
// bool _isAdjacentToBlackCell(List<List<String>> cells, int row, int col) {
//   int numRows = cells.length;
//   int numCols = cells[0].length;
//
//   // Check adjacent cells
//   if (row - 1 >= 0 && cells[row - 1][col] == 'B') {
//     return true;
//   }
//   if (row + 1 < numRows && cells[row + 1][col] == 'B') {
//     return true;
//   }
//   if (col - 1 >= 0 && cells[row][col - 1] == 'B') {
//     return true;
//   }
//   if (col + 1 < numCols && cells[row][col + 1] == 'B') {
//     return true;
//   }
//
//   return false;
// }
