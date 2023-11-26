import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tetris/models/my_animation_model.dart';

class MyAnimationController extends GetxController
    with GetTickerProviderStateMixin {
  //this controller is responsible of animation of moving control buttons.
  Rx<MyAnimationModel> model = MyAnimationModel().obs;
  late AnimationController _leftController;
  late AnimationController _rightController;
  late AnimationController _downController;
  late AnimationController _rotateController;
  late Animation<Color?> _leftColorAnimation;
  late Animation<Color?> _rightColorAnimation;
  late Animation<Color?> _downColorAnimation;
  late Animation<Color?> _rotateColorAnimation;
  late Animation<double> _leftSizeAnimation;
  late Animation<double> _rightSizeAnimation;
  late Animation<double> _downSizeAnimation;
  late Animation<double> _rotateSizeAnimation;

  void _initializeAnimation() {
    //controllers
    _leftController = AnimationController(
        duration: const Duration(milliseconds: 100), vsync: this);
    _rightController = AnimationController(
        duration: const Duration(milliseconds: 100), vsync: this);
    _downController = AnimationController(
        duration: const Duration(milliseconds: 100), vsync: this);
    _rotateController = AnimationController(
        duration: const Duration(milliseconds: 100), vsync: this);

    //tweens
    ColorTween leftColorTween =
        ColorTween(begin: Colors.red, end: Colors.orange);
    ColorTween rightColorTween =
        ColorTween(begin: Colors.red, end: Colors.orange);
    ColorTween downColorTween =
        ColorTween(begin: Colors.red, end: Colors.orange);
    ColorTween rotateColorTween =
        ColorTween(begin: Colors.red, end: Colors.orange);

    Tween<double> rightSizeTween = Tween<double>(begin: 60, end: 40);
    Tween<double> leftSizeTween = Tween<double>(begin: 60, end: 40);
    Tween<double> rotateSizeTween = Tween<double>(begin: 60, end: 40);
    Tween<double> downSizeTween = Tween<double>(begin: 60, end: 40);

    //animation
    _leftColorAnimation = leftColorTween.animate(_leftController);
    _rightColorAnimation = rightColorTween.animate(_rightController);
    _downColorAnimation = downColorTween.animate(_downController);
    _rotateColorAnimation = rotateColorTween.animate(_rotateController);
    _leftSizeAnimation = leftSizeTween.animate(_leftController);
    _rightSizeAnimation = rightSizeTween.animate(_leftController);
    _downSizeAnimation = downSizeTween.animate(_leftController);
    _rotateSizeAnimation = rotateSizeTween.animate(_leftController);
  }

  void animateLeft() {
//updating values
    _leftController.addListener(() {
      model.update((val) {
        val!.leftButtCol = _leftColorAnimation.value!;
        val.leftButtSize = _leftSizeAnimation.value;
      });
    });

//firing animation
    _leftController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _leftController.reverse();
      }
    });

    _leftController.forward();
  }

  void animateRight() {
//updating values
    _rightController.addListener(() {
      model.update((val) {
        val!.rightButtCol = _rightColorAnimation.value!;
        val.rightButtSize = _rightSizeAnimation.value;
      });
    });

//firing animation
    _rightController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _rightController.reverse();
      }
    });

    _rightController.forward();
  }

  void animateRotate() {
//updating values
    _rotateController.addListener(() {
      model.update((val) {
        val!.rotateButtCol = _rotateColorAnimation.value!;
        val.rotateButtSize = _rotateSizeAnimation.value;
      });
    });

//firing animation
    _rotateController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _rotateController.reverse();
      }
    });

    _rotateController.forward();
  }

  void animateDown() {
//updating values
    _downController.addListener(() {
      model.update((val) {
        val!.downButtCol = _downColorAnimation.value!;
        val.downButtSize = _downSizeAnimation.value;
      });
    });

//firing animation
    _downController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _downController.reverse();
      }
    });

    _downController.forward();
  }

  @override
  void onInit() {
    super.onInit();
    _initializeAnimation();
  }

  @override
  void onClose() {
    super.onClose();
    _leftController.dispose();
    _rightController.dispose();
    _downController.dispose();
    _rotateController.dispose();
  }
}
