import 'package:expandable/expandable.dart';
import 'package:findme/app/routes/app_pages.dart';
import 'package:findme/app/utils/string_util.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tasklist_controller.dart';

class TasklistView extends GetView<TasklistController> {
  @override
  Widget build(BuildContext context) {
    final makeBody = ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return ExpandableNotifier(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: <Widget>[
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                            image: AssetImage('assets/childrens.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      FloatingActionButton(
                        heroTag: "godone$index",
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        onPressed: () {
                          Get.toNamed(Routes.GODONE);
                        },
                        child: Icon(Icons.keyboard_double_arrow_right_sharp),
                      ),
                    ],
                  ),
                  ScrollOnExpand(
                    scrollOnExpand: true,
                    scrollOnCollapse: true,
                    child: ExpandablePanel(
                      theme: const ExpandableThemeData(
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                        tapBodyToCollapse: true,
                      ),
                      header: Padding(
                        padding: EdgeInsets.all(10),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: index % 2 == 0
                                    ? Icon(Icons.check_circle,
                                        color: Colors.green)
                                    : Icon(Icons.close, color: Colors.red),
                              ),
                              TextSpan(
                                text: " Pencarian ${index + 1}",
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ],
                          ),
                        ),
                      ),
                      collapsed: Container(),
                      expanded: Text(
                        StringUtil.lorem(),
                        textAlign: TextAlign.justify,
                      ),
                      builder: (_, collapsed, expanded) {
                        return Padding(
                          padding:
                              EdgeInsets.only(left: 10, right: 10, bottom: 10),
                          child: Expandable(
                            collapsed: collapsed,
                            expanded: expanded,
                            theme: const ExpandableThemeData(crossFadePoint: 0),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    return Scaffold(
        appBar: AppBar(
          title: Text('Daftar Pencarian'),
          centerTitle: true,
        ),
        body: makeBody);
  }
}
