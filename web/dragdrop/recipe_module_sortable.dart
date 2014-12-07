// Copyright (C) 2013 - 2014 Angular Dart UI authors. Please see AUTHORS.md.
// https://github.com/akserg/angular.dart.ui
// All rights reserved.  Please see the LICENSE.md file.
part of angular.ui.demo;


@Component(
    cssUrl: const ['dragdrop/recipe_module_sortable.css','dragdrop/bootstrap.css'],
    selector: '[recipe-module]',
    template:
'''
<div>
  <h4>Module</h4>
  <div class="row">
    <div class="col-sm-3">
      <div class="panel panel-success">
        <div class="panel-heading">
          <div class='row'>
              <div class="col-xs-10">
                <select ng-model='selectedModule' class="form-control">
                  <option ng-repeat='item in srcModuleList'>{{item}} </option>
                </select>
              </div>
              <div class='col-xs-2'>
                <button class='btn' ng-click='add()'>+</button>
              </div>
          </div>
        </div>
        <div class="panel-body">
          <ul class="list-group" ui-sortable ui-sortable-data="moduleList">
            <li ng-repeat="item in moduleList" class="list-group-item" ui-sortable-item="\$index"
               ng-drop='changeEnterStyle(\$event)' ng-dragleave='changeEnterStyle(\$event)'
               ng-dragenter='changeEnterStyle(\$event)'
               ng-mouseover='showButton(\$event)'
               ng-mouseleave='hideButton(\$event)'  
               ng-dragstart='setSrcIdx(\$event,\$index)'> {{ item}}
                
                 <button class='btn btn-xs action hide' ng-click='duplicate(item)'>copy</button>
                 <button class='btn btn-xs action hide' ng-click='remove(item)'>del</button>
            </li>
          </ul>
        </div>
        <div class="panel-footer">
          <button class='btn btn-default' ng-click='cancel()'>cancel</button>
          <button class='btn btn-primary' ng-click='save()'>savel</button>
        </div>
      </div>
    </div>

  </div>
</div>
'''
      //,
    //useShadowDom: false
    )
class SortableModule {
  List<String> moduleList = ['Coffee','AAA Juice',
                             'Red Wine',
                             'Unhealty drink!',
                             'Water',
                             'Red Wiskey',
                             'White PPPPP','zcxxRed AAAA','Albertina  Cellars','Parducci  Cellars'
                         ];
  String selectedModule;
  List<String> srcModuleList = ['Water','Oil'];
  dom.Element elem;
  SortableModule(this.elem ) {

  }
  /**
   * remove all child item, if no dash, it back to srcList
   */
  remove(String item){
    moduleList.remove(item);
    //move to candidate list when all empty
    if(!item.contains('-')) this.srcModuleList..add(item)..sort();
  }
  final String dash='-';


  duplicate(String item){
    //1.find match item with -
    //2. append max number
    if(!moduleList.contains(item)){
      moduleList.add(item);
    }else{
      String pattern=item.contains(dash) ? item.split(dash).first : item;
      int version=moduleList.where((_)=> _.startsWith(pattern))
                            .map((_)=> _.contains(dash) ? int.parse(_.split(dash).last): 0 )
                            .reduce((prev,now) => prev>now ? prev: now)
                            +1;
      moduleList.insert(moduleList.indexOf(item)+1,'${pattern}$dash$version');
    }
  }

  changeEnterStyle(dom.MouseEvent event){
    print('enter:'+event.currentTarget.toString());
    if(event.type=='dragenter'){
      (event.currentTarget as dom.Element).classes.add('red');
    }else{
      (event.currentTarget as dom.Element).classes.remove('red');
    }
  }
  cancel(){
    this.elem.classes.add('hide');
  }
  save(){
    //dispatch reorder module event to grid
  }
  add(){
    if(selectedModule!=null){
      duplicate(selectedModule);
      this.srcModuleList.remove(selectedModule);
      if(!srcModuleList.isEmpty) {
        selectedModule=srcModuleList.first;
      }else{
        selectedModule=null;
      }
    }
  }
  setSrcIdx(dom.MouseEvent event, int startIndex){
    event.dataTransfer.setData('idx', '$startIndex');
  }
  showButton(dom.MouseEvent event){
    event.target.querySelectorAll('button').forEach((dom.Element _)=>_.classes.remove('hide'));
  }
  hideButton(dom.MouseEvent event){
    event.target.querySelectorAll('button').forEach((dom.Element _)=> _.classes.add('hide'));
  }
}




