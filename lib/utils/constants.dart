import 'dart:ui';

import 'package:get/get.dart';

FlutterView view = PlatformDispatcher.instance.views.first;

double physicalWidth = view.physicalSize.width;
double physicalHeight = view.physicalSize.height;

double devicePixelRatio = view.devicePixelRatio;

double h = Get.height;
double w = Get.width;

Color primColor = const Color(0xff6C63FF);
Color secondaryColor = const Color(0xff6C63FF);
