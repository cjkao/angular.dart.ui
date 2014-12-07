// Copyright (C) 2013 - 2014 Angular Dart UI authors. Please see AUTHORS.md.
// https://github.com/akserg/angular.dart.ui
// All rights reserved.  Please see the LICENSE.md file.
library angular.ui.demo;

import 'dart:html' as dom;
//import 'dart:math' as math;
import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
import 'package:angular_ui/angular_ui.dart';
//import 'package:angular_ui/utils/utils.dart';
import 'package:logging/logging.dart';
import 'package:angular_ui/dragdrop/dragdrop.dart';
//part 'popover/popover_demo.dart';
//part 'accordion/accordion_demo.dart';
part 'alert/alert_demo.dart';
part 'buttons/buttons_demo.dart';
//part 'carousel/carousel_demo.dart';
part 'collapse/collapse_demo.dart';
part 'dragdrop/dragdrop_demo.dart';
part 'dragdrop/recipe_module_sortable.dart';
//part 'datepicker/datepicker_demo.dart';
//part 'typeahead/typeahead_demo.dart';
part 'dropdown_toggle/dropdown_toggle_demo.dart';
part 'timepicker/timepicker_demo.dart';
part 'rating/rating_demo.dart';

/**
 * Entry point into app.
 */
main() {

  hierarchicalLoggingEnabled = true;
  Logger.root.level = Level.OFF;
  Logger.root.onRecord.listen((LogRecord r) {
    DateTime now = new DateTime.now();
    dom.window.console.log('${now} [${r.level}] ${r.loggerName}: ${r.message}');
  });
  new Logger("angular.ui")..level = Level.FINER;

  applicationFactory()
    .addModule(new DemoModule())
    .run();
}

/**
 * Demo Module
 */
class DemoModule extends Module {
  DemoModule() {
    install(new AngularUIModule());
    bind(DragDropShoppingBasketDemoController);
    bind(DragDropListDemoController);
    bind(DragDropCustomImageDemoController);
    bind(DragDropMultiDropZonesDemoController);
    bind(SortableModule);
//    bind(TypeaheadDemoController);
//    bind(SortableMultiController);
//    bind(Wine);
//    bind(PopoverDemoCtrl);
//    bind(WineData);
//    bind(TypeaheadDemoController);
  }
}