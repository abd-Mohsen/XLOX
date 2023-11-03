import 'package:algo_lab/cell.dart';
import 'package:algo_lab/home_controller.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            title: "BFS",
            iconColor: Colors.white,
            bubbleColor: Colors.blue,
            icon: Icons.search_rounded,
            titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
            onPress: () {
              hC.bfs();
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
          IconButton(
            onPressed: () {
              hC.refreshLevel();
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 300,
                    width: 350,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: hC.board.cells.length,
                      itemBuilder: (context, i) => SizedBox(
                        height: 40,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: hC.board.cells[i].length,
                          itemBuilder: (context, j) => MouseRegion(
                            cursor: hC.board.cells[i][j] == '@' ? SystemMouseCursors.click : SystemMouseCursors.basic,
                            child: GestureDetector(
                              onTap: () {
                                hC.click(i, j);
                                //print('Clicked: (${i + 1}, ${j + 1}),');
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                alignment: Alignment.center,
                                margin: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: cellColor(hC.board.cells[i][j]),
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
            ],
          );
        },
      ),
    );
  }
}
