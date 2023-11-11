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
