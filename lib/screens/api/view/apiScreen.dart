import 'package:flutter/material.dart';
import 'package:practical_exam/screens/api/model/apiModel.dart';
import 'package:practical_exam/screens/api/provider/apiProvider.dart';
import 'package:practical_exam/utils/apiHelper.dart';
import 'package:provider/provider.dart';

class apiScreen extends StatefulWidget {
  const apiScreen({Key? key}) : super(key: key);

  @override
  State<apiScreen> createState() => _apiScreenState();
}

class _apiScreenState extends State<apiScreen> {
  apiProvider? at,af;

  @override
  void initState() {
   super.initState();

   Provider.of<apiProvider>(context,listen: false).apiCalling();
  }
  @override
  Widget build(BuildContext context) {

    at = Provider.of<apiProvider>(context,listen: true);
    af = Provider.of<apiProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Api calling"),
          backgroundColor: Colors.teal,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: FutureBuilder(builder: (context, snapshot) {
                  if(snapshot.hasError)
                    {
                      return Text("${snapshot.error}");
                    }
                  else if(snapshot.hasData)
                    {
                      Weather? w1 = snapshot.data;
                      // List l1 = snapshot.data as List;
                      return ListView.builder(itemBuilder: (context, index) {
                        return ListTile(
                          title: Text("Country name:- ${w1.countriesStat[index].countryName}"),
                          subtitle: Text("Active cases:- ${w1.countriesStat[index].activeCases}"),
                          trailing: Text("${w1.countriesStat[index].totalCasesPer1MPopulation}"),
                        );
                      },
                        itemCount: w1!.countriesStat.length,
                      );
                    }
                  return CircularProgressIndicator();
                },
                  future: af!.apiCalling(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
