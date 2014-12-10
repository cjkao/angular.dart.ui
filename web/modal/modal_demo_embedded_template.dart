// Copyright (C) 2013 - 2014 Angular Dart UI authors. Please see AUTHORS.md.
// https://github.com/akserg/angular.dart.ui
// All rights reserved.  Please see the LICENSE.md file.
part of angular.ui.demo;

/**
 * Modal controller with template.
 */
@Component(
  selector: 'modal-demo-embedded-tmpl',
 // useShadowDom: false,
  templateUrl: 'modal/modal_demo_embedded_template.html',
  exportExpressions: const ["tmp", "ok",'book', 'aitems','first-chapter']
//  exportExpressionAttrs: const ['name', 'names']
)
class ModalDemoEmbeddedTemplate implements ScopeAware {

  String selected;
  String tmp;

  Modal modal;
  ModalInstance modalInstance;
  Scope scope;

  String template = """
<div class="modal-header">
 {{book.name}}
  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
  <h4 class="modal-title">I'm a modal!</h4>
</div>
<div class="modal-body">
  <ul>
    <li ng-repeat="item in aitems">
      <a ng-click="tmp = item">{{ item }}</a>
    </li>
  </ul>
  
</div>
<div class="modal-footer">
  <first-chapter>zzz</first-chapter>
  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
  <button type="button" class="btn btn-primary" ng-click="ok(tmp)">OK</button>

  <select ng-model='book.name'>
    <option ng-repeat='item in book.names' >{{item}} </option>
  </select>
</div>
""";
//
// {{book.name}}
//  <select ng-model='book.name'>
//    <option ng-repeat='item in book.names' >{{item}} </option>
//  </select>



  Book book;
//  List newBook=['a','b'];
//  String newName='zzz';
  List<String> aitems = ["1a111", "2222", "3333", "4444"];
ModalDemoEmbeddedTemplate(this.modal, this.book){ //
//  newBook = book.names;
}
  ModalInstance getModalInstance() {
    return modal.open(new ModalOptions(template:template), scope);
  }

  void open() {
    modalInstance = getModalInstance();

    modalInstance.opened
      ..then((v) {
        print('Opened');
      }, onError: (e) {
        print('Open error is $e');
      });

    // Override close to add you own functionality
    modalInstance.close = (result) {
      selected = result;
      print('Closed with selection $selected');
      modal.hide();
    };
    // Override dismiss to add you own functionality
    modalInstance.dismiss = (String reason) {
      print('Dismissed with $reason');
      modal.hide();
   };
  }

  void ok(sel) {
    modalInstance.close(sel);
  }
}