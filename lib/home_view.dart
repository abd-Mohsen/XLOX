import 'package:algo_lab/home_controller.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'levels.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 260));

    final curvedAnimation = CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HomeController hC = Get.put(HomeController());

    Color cellColor(String cell) {
      if (cell == '@') {
        return Colors.white;
      } else if (cell == ' ') {
        return Colors.transparent;
      } else {
        return Colors.brown;
      }
    }

    return Scaffold(
      floatingActionButton: FloatingActionBubble(
        items: <Bubble>[
          Bubble(
            title: "BFS",
            iconColor: Colors.white,
            bubbleColor: Colors.blue,
            icon: Icons.search_rounded,
            titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
            onPress: () {
              hC.bfs();
            },
          ),
          Bubble(
            title: "DFS",
            iconColor: Colors.white,
            bubbleColor: Colors.blue,
            icon: Icons.search,
            titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
            onPress: () {
              hC.dfs();
            },
          ),
          Bubble(
            title: "UCS",
            iconColor: Colors.white,
            bubbleColor: Colors.blue,
            icon: Icons.search,
            titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
            onPress: () {
              hC.ucsV2();
            },
          ),
          Bubble(
            title: "HILL CLIMBING",
            iconColor: Colors.white,
            bubbleColor: Colors.blue,
            icon: Icons.search,
            titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
            onPress: () {
              hC.hillClimbingV2();
            },
          ),
          Bubble(
            title: "A*",
            iconColor: Colors.white,
            bubbleColor: Colors.blue,
            icon: Icons.search,
            titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
            onPress: () {
              hC.aStar();
            },
          ),
        ],
        onPress: () =>
            _animationController.isCompleted ? _animationController.reverse() : _animationController.forward(),
        iconColor: Colors.white,
        iconData: Icons.computer,
        backGroundColor: Colors.greenAccent,
        animation: _animation,
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xff232323),
        centerTitle: true,
        title: const Text(
          "XLOX",
          style: TextStyle(
            letterSpacing: 5,
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: Colors.white,
          ),
        ),
        actions: [
          PopupMenuButton(
            shape: RoundedRectangleBorder(
              //side: const BorderSide(width: 0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            tooltip: "choose level",
            icon: Icon(Icons.leaderboard),
            position: PopupMenuPosition.under,
            onSelected: (smth) => Get.back(), //not working
            itemBuilder: (context) => [
              PopupMenuItem(
                child: ListTile(
                  title: Text("level 1"),
                  onTap: () {
                    hC.selectLevel(one);
                  },
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  title: Text("level 2"),
                  onTap: () {
                    hC.selectLevel(two);
                  },
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  title: Text("level 3"),
                  onTap: () {
                    hC.selectLevel(three);
                  },
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  title: Text("level 4"),
                  onTap: () {
                    hC.selectLevel(four);
                  },
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  title: Text("level 6"),
                  onTap: () {
                    hC.selectLevel(six);
                  },
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  title: Text("level 7"),
                  onTap: () {
                    hC.selectLevel(seven);
                  },
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  title: Text("level 9"),
                  onTap: () {
                    hC.selectLevel(nine);
                  },
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  title: Text("level 10"),
                  onTap: () {
                    hC.selectLevel(ten);
                  },
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  title: Text("level 12"),
                  onTap: () {
                    hC.selectLevel(twelve);
                  },
                ),
              ),
            ],
          ),
          IconButton(
            tooltip: "restart level",
            onPressed: () {
              hC.restartLevel();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      backgroundColor: const Color(0xff121212),
      body: GetBuilder<HomeController>(
        builder: (con) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 300,
                      width: 320,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: hC.currentBoard.cells.length,
                        itemBuilder: (context, i) => SizedBox(
                          height: 40,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: hC.currentBoard.cells[i].length,
                            itemBuilder: (context, j) => MouseRegion(
                              cursor: hC.currentBoard.cells[i][j] == '@'
                                  ? SystemMouseCursors.click
                                  : SystemMouseCursors.basic,
                              child: GestureDetector(
                                onTap: () {
                                  hC.click(i, j);
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: cellColor(hC.currentBoard.cells[i][j]),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
