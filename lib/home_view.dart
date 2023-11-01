import 'package:algo_lab/cell.dart';
import 'package:algo_lab/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController hC = Get.put(HomeController());

    Color cellColor(CellType cellType) {
      if (cellType == CellType.white) {
        return Colors.white;
      } else if (cellType == CellType.black) {
        return Colors.transparent;
      } else {
        return Colors.brown;
      }
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: "let CPU do it",
        onPressed: () => hC.dfs(),
        child: Icon(Icons.computer),
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
                    width: 420,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: hC.board.cells.length,
                      itemBuilder: (context, i) => SizedBox(
                        height: 40,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: hC.board.cells[i].length,
                          itemBuilder: (context, j) => MouseRegion(
                            //cursor: hC.board.cells[i][j].cellType == CellType.white ? MouseCursor.,
                            child: GestureDetector(
                              onTap: () {
                                hC.click(i, j);
                                //print('Clicked: (${i + 1}, ${j + 1}),');
                              },
                              child: Container(
                                width: 40,
                                height: 50,
                                alignment: Alignment.center,
                                margin: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: cellColor(hC.board.cells[i][j].cellType),
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
