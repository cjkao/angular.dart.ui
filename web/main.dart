// Copyright (C) 2013 - 2014 Angular Dart UI authors. Please see AUTHORS.md.
// https://github.com/akserg/angular.dart.ui
// All rights reserved.  Please see the LICENSE.md file.
library angular.ui.demo;

//import 'dart:html' as dom;
//import 'dart:math' as math;
import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
import 'package:angular_ui/angular_ui.dart';
//import 'package:angular_ui/utils/utils.dart';

@MirrorsUsed(targets: const[
  'angular.ui',
  'angular.ui.demo'
], override: '*')
import 'dart:mirrors';
//import 'package:angular_ui/dragdrop/dragdrop.dart';

part 'accordion/accordion_demo.dart';
part 'alert/alert_demo.dart';
part 'buttons/buttons_demo.dart';
//part 'carousel/carousel_demo.dart';
part 'collapse/collapse_demo.dart';
//part 'dragdrop/dragdrop_demo.dart';
//part 'datepicker/datepicker_demo.dart';
part 'dropdown_toggle/dropdown_toggle_demo.dart';
part 'modal/modal_demo_embedded_template.dart';
part 'modal/modal_demo_embedded_template_static_backdrop.dart';
part 'modal/modal_demo_template_element.dart';
part 'modal/modal_demo_template_element_from_other_file.dart';
//part 'modal/modal_demo_template_from_file.dart';
part 'pagination/pagination_demo.dart';
//part 'progressbar/progressbar_demo.dart';
//part 'tabs/tabs_demo.dart';
part 'timepicker/timepicker_demo.dart';
part 'rating/rating_demo.dart';
part 'tooltip/tooltip_demo.dart';
part 'popover/popover_demo.dart';
//part 'typeahead/typeahead_demo.dart';

/**
 * Entry point into app.
 */
main() {
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
    //
    bind(PopoverDemo);
    bind(TooltipDemo);
    bind(TimepickerDemo);
//    bind(DatepickerCtrl);
    bind(ModalDemoEmbeddedTemplate);
    bind(ModalDemoEmbeddedTemplateWithStaticBackdrop);
    bind(ModalDemoTagTemplate);
    bind(ModalDemoOtherTemplate);
//    bind(ModalDemoFileTemplate);
    bind(AlertDemo);
    bind(CollapseDemo);
    bind(DropdownDemo);
    bind(PaginationDemo);
//    bind(ProgressCtrl);
    bind(ButtonsDemo);
//    bind(CarouselDemoController);
//    bind(TabsCtrl);
    bind(AccordionDemo);
    bind(RatingDemo);
    bind(Book);
    bind(Chapter);
//    bind(DragDropShoppingBasketDemoController);
//    bind(DragDropListDemoController);
//    bind(DragDropCustomImageDemoController);
//    bind(DragDropHandlerDemoController);
//    bind(TypeaheadDemoController);
  }
}

@Injectable()
class Book{
  String name='WA.........HA';
  List names = ['a', 'b','e','c','d'];
}
@Component(
  selector: 'first-chapter',
  template:'''<span>in sub:{{book.name}} <input type='text' ng-model='book.name'> <content></content></span>
'''
  )
class Chapter{
  Book book;
  Chapter(this.book);
}