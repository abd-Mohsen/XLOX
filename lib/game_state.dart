// import 'cell.dart';
//
// class GameState {
//   List<List<CellType>> board;
//
//   GameState({required this.board});
//
//   List<Move> generateMoves() {
//     List<Move> moves = [];
//
//     for (int i = 0; i < board.length; i++) {
//       for (int j = 0; j < board[i].length; j++) {
//         if (board[i][j] == CellType.white) {
//           moves.add(Move(i, j));
//         }
//       }
//     }
//
//     return moves;
//   }
//
//   bool isGoalState() {
//     for (int i = 0; i < board.length; i++) {
//       for (int j = 0; j < board[i].length; j++) {
//         if (board[i][j] == CellType.white) {
//           return false; // There is still a white cell remaining
//         }
//       }
//     }
//
//     return true; // All white cells have been eliminated
//   }
//
//   GameState applyMove(Move move) {
//     List<List<CellType>> newBoard = List.from(board.map((row) => List.from(row)));
//
//     // Flip the selected cell
//     newBoard[move.row][move.col] = CellType.stone;
//
//     // Check and flip adjacent cells
//     if (move.row > 0 && board[move.row - 1][move.col] == CellType.white) {
//       newBoard[move.row - 1][move.col] = CellType.stone;
//     }
//     if (move.row < board.length - 1 && board[move.row + 1][move.col] == CellType.white) {
//       newBoard[move.row + 1][move.col] = CellType.stone;
//     }
//     if (move.col > 0 && board[move.row][move.col - 1] == CellType.white) {
//       newBoard[move.row][move.col - 1] = CellType.stone;
//     }
//     if (move.col < board[move.row].length - 1 && board[move.row][move.col + 1] == CellType.white) {
//       newBoard[move.row][move.col + 1] = CellType.stone;
//     }
//
//     return GameState(board: newBoard);
//   }
// }
