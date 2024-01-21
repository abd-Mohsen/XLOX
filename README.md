# XLOX

a board game called XLOX, developed using Flutter framework and Dart language.
inspired from [here](https://www.puzzleplayground.com/xlox).

## Game Description

XLOX is a one-player board game where the objective is to get rid of all white cells in a given grid. can be played manually or by letting the 
computer solve it for us.

### Game Rules

- There is three types of cells, empty, white and a wall
- you can click only on white cells.
- when you click on a white cell, all cells adjacent to it (top, bottom, left and right cells) will flip (empty to white and white to empty).
- wall cells remain intact.

## Computer AI

implemented several state space search algorithms (informed and uninformed) in order to reach final state for a given grid.

- **Depth First search (DFS) :** we use a stack or a recursive method to generate all possible next state for the current state and traverse them.
- **Breadth First search (BFS) :** we use a queue or to generate all possible next state for the current state and traverse them.
- **Uniform Cost Search (UCS) :** similar to bfs , but we use a min heap (priority queue) to sort the states efficiently based on their cost.
- **Hill climbing :** similar to bfs , but we use a min heap (priority queue) to sort the states efficiently based on their heuristic value.
- **A\* (A star) :** similar to bfs , but we use a min heap (priority queue) to sort the states efficiently based on their heuristic value + cost.

## Results

- some levels are impossible to solve using uninformed search algorithms.
- using a good heuristic value can make a huge difference.

##
This game was developed as an assignment for a course at Damascus university. The assignment is aimed to demonstrate proficiency in implementing 
search algorithms on a real world problem.

Feel free to explore the source code and contribute to the project if you'd like!

