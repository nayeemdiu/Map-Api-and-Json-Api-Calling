import 'dart:convert';
import 'dart:io';
import 'package:api/dashboard_model.dart';
import 'package:api/user_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {

  // List<Usermodel> userList = [];
  // Future getApi() async {
  //   final resposnse = await http.post(
  //       Uri.parse('https://crm.ihelpbd.com/crm/api/crm/dashboard.php'),
  //       headers: {
  //          'content-type': 'application/json',
  //          'token': '0qYfwx054pHf6vpijDKj4QY5znSizCaP'
  //       },
  //       body: {
  //         "userId": "10"
  //       });
  //   var data = jsonDecode(resposnse.body.toString());
  //   var data1 = jsonEncode(data);
  //   print("datta in ");
  //   print(data);
  //   print(data1);
  //   //print(data);
  //
  //   // if(resposnse.statusCode == 200){
  //   //
  //   //   for(Map i in data){
  //   //
  //   //     userList.add(Usermodel.fromJson(i));
  //   //  //   userList.add(Address.fromJson(i) as Usermodel);
  //   //
  //   //   }
  // }
  //
  // //  return userList;

  List<Data>  dashboardList = [];
  Future<List<Data>> fetchLeadList() async {
    print("Secured Api ");
    //Get user dat from local device
    String token = "JhLqsTVvzrKANhG1Gbx8wsy9XNQqouvn";
    String userId = "8";

    final body = {"userId": userId};

    // Api url
    String url = "https://crm.ihelpbd.com/crm/api/crm/dashboard.php";
    HttpClient httpClient = HttpClient();

    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));

    // content type
    request.headers.set('content-type', 'application/json');
    request.headers.set('token', token);

    request.add(utf8.encode(json.encode(body)));

    //Get response
    HttpClientResponse response = await request.close();
    String reply = await response.transform(utf8.decoder).join();
    final data = jsonDecode(reply);
    print(" Data .....:${data}");


    DashboardModel midel=DashboardModel.fromJson(data);
    for(Map i in data['data']){
      dashboardList.add(Data.fromJson(i));
    }

    // Closed request
    httpClient.close();

    if (data["status"].toString().contains("200")) {
     final item = json.decode(reply)["data"];
     print("item item item DashBoard : ${item}");
    }
    return dashboardList;
  }



}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}