import 'package:flutter/material.dart';
import 'package:practical_exam/screens/api/model/apiModel.dart';
import 'package:practical_exam/utils/apiHelper.dart';

class apiProvider extends ChangeNotifier
{
  Future<Weather> apiCalling()
  async {
    apiHelper a1 = apiHelper();

    Weather w1 = await a1.getApi();
    return w1;
  }
}