import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:practical_exam/screens/TaskMe/controller/taskmeProvider.dart';
import 'package:practical_exam/screens/TaskMe/model/taskmeModel.dart';
import 'package:practical_exam/screens/TaskMe/provider/taskmeProvider.dart';
import 'package:provider/provider.dart';

class taskmeScreen extends StatefulWidget {
  const taskmeScreen({Key? key}) : super(key: key);

  @override
  State<taskmeScreen> createState() => _taskmeScreenState();
}

class _taskmeScreenState extends State<taskmeScreen> {
  TextEditingController txttask = TextEditingController();
  TextEditingController txtcate = TextEditingController();

  taskmeProvider? tt,tf;

  @override
  Widget build(BuildContext context) {

    tt = Provider.of<taskmeProvider>(context,listen: true);
    tf = Provider.of<taskmeProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Task Me"),
          centerTitle: true,
          backgroundColor: Colors.teal.shade700,
          actions: [
            IconButton(
                onPressed: () {
                  Get.defaultDialog(
                      title: "NEW TASK",
                      content: Column(
                        children: [
                          TextField(
                            controller: txttask,
                          ),
                          TextField(
                            controller: txtcate,
                          ),
                          SizedBox(height: 10,),
                          ElevatedButton(onPressed: () {

                            Navigator.pushNamed(context, 'taskme').then((_) {
                              setState(() {});
                            });
                            taskmeModel t1 = taskmeModel(cate: txtcate.text,task: txttask.text);
                            tt!.l1.add(t1);
                          }, child: Text("Save"))
                        ],
                      )
                  );
                },
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ))
          ],
        ),
        body: Column(
          children: [
            Container(
              height: 70,
              width: double.infinity,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              color: Colors.grey,
              child: Text("TODO", style: TextStyle(fontSize: 20)),
            ),
            Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
                return viewTile(tt!.l1[index],index);
              },
                itemCount: tf!.l1.length,
              ),
            ),
            Container(
              height: 70,
              width: double.infinity,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              color: Colors.grey,
              child: Text("DONE", style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }

  Widget viewTile(taskmeModel l2,int index)
  {
    return Container(
      height: 80,width: double.infinity,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(color: Colors.grey.shade200),
      alignment: Alignment.topLeft,
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("${l2.task}"),
              SizedBox(height: 10,),
              Text("${l2.cate}"),
            ],
          ),
          Spacer(),
          IconButton(onPressed: () {
            setState(() {
              tt!.l1.removeAt(index);
            });
          }, icon: Icon(Icons.delete,color: Colors.red,)),

        ],
      ),
    );
  }

}
