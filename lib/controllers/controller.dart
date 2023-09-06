import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tetris/models/grid_model.dart';

class Controller extends GetxController {
  Rx<GridModel> gridModel = GridModel().obs;

  start() {
    gridModel.value.initializeCurrentTetrino();
    changeGridColor();

    gridModel.update((val) {
      val!.timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
        print(timer.tick);

        unChangeGridColor();
        moveDown();
        changeGridColor();

        if (exitGrid()) {
          val.initializeCurrentTetrino();
        }
      });
    });
  }

  void moveDown() {
    gridModel.update((val) {
      for (var i = 0; i < val!.currentTetrino!.currentPosition.length; i++) {
        val.currentTetrino!.currentPosition[i] += val.columnsLength;
      }
    });

    print('moved down');
  }

  bool exitGrid() {
    bool b = false;
    gridModel.update((val) {
      int minIndex = val!.currentTetrino!.currentPosition.reduce(min);
      if (minIndex >= val.cells.length) {
        b = true;
      }
    });
    return b;
  }

  @override
  void onInit() {
    super.onInit();
    gridModel.value.initializeGrid();
    start();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    gridModel.update((val) {
      val!.timer!.cancel();
    });
  }

  void unChangeGridColor() {
    gridModel.update((val) {
      for (var i = 0; i < val!.currentTetrino!.currentPosition.length; i++) {
        int index = val.currentTetrino!.currentPosition[i];
        if (index >= 0 && index < val.cells.length) {
          val.cells[index].color = Colors.brown;
        }
      }
    });
    print('color changed');
  }

  void changeGridColor() {
    gridModel.update((val) {
      for (var i = 0; i < val!.currentTetrino!.currentPosition.length; i++) {
        int index = val.currentTetrino!.currentPosition[i];
        if (index >= 0 && index < val.cells.length) {
          val.cells[index].color = val.currentTetrino!.color;
        }
      }
    });
    print('color changed');
  }
}
