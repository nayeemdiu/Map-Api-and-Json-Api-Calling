import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'LeadModel.dart';

class LeadListFromMap extends StatefulWidget {
  const LeadListFromMap({Key? key}) : super(key: key);

  @override
  State<LeadListFromMap> createState() => _LeadListFromMapState();
}

class _LeadListFromMapState extends State<LeadListFromMap> {
  List leadList = [];
  bool isLoading = false;
  bool isSearching = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchLeadList();
  }

  void fetchLeadList() async {
    print("lead List");
    setState(() {
      isLoading = true;
    });

    //Show progress dialog
    //SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    //Get user data from local device
    //   String token = sharedPreferences.getString("token").toString();
    //  String role = sharedPreferences.getString("role").toString();
    //  print("role${role}");
    //  String userID = sharedPreferences.getString("userId").toString();

    // Api url
    String url = "https://crm.ihelpbd.com/crm/api/crm/lead_list.php";
    String token ="JhLqsTVvzrKANhG1Gbx8wsy9XNQqouvn";
    String role ="User";
    String userID = "8";

    HttpClient httpClient = HttpClient();

    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));

    // content type
    request.headers.set('content-type', 'application/json');
    request.headers.set('token', token);

    //API body
    Map<String, String> body = {"role": role, "userId": userID};

    request.add(utf8.encode(json.encode(body)));

    //Get response
    HttpClientResponse response = await request.close();
    String reply = await response.transform(utf8.decoder).join();
    final data = jsonDecode(reply);
    //  print("Lead List : ${data}");

    // Closed request
    httpClient.close();

    if (data["status"].toString().contains("200")) {
      final item = json.decode(reply)["data"];
      print("item........  : ${item}");

      setState(() {
        try {
          leadList = item;
          //pageCommentAndAttachment = allData;
          isLoading = false;
        } catch (e) {
          isLoading = true;
        }
      });
    } else {
      leadList = [];
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard  Api From Map"),
        centerTitle: true,
      ),
      body: getLeadListBody(),
    );
  }

  Widget getLeadListBody() {
    if (leadList.contains(null) || isLoading) {
      return const Center(
          child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.cyan),
      ));
    }
    return ListView.builder(
      reverse: false,
      itemCount: leadList.length,
      itemBuilder: (BuildContext context, int index) {
        LeadModel leadModel = LeadModel.fromMap(leadList[index]);

        /// New Changed Lead
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: InkWell(
            // onTap: () {
            //   StaticVariable.leadModel = leadModel;
            //   StaticVariable.currentPageIndex = 0;
            //   Navigator.push(context,
            //       MaterialPageRoute(builder: (context) => const LeadManage()));
            // },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.blueGrey, width: 0.3)),
              color: Colors.grey[100],
              elevation: 0,
              //color: Colors.blueGrey,
              child: Container(
                  color: Color.fromRGBO(164, 255, 238, 0.1),
                  // margin: const EdgeInsets.all(10),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 5, top: 10, bottom: 5),
                        child: Text(
                          "Name : ${leadModel.customerName.toString()}",
                          style: TextStyle(fontSize: 15, color: Colors.green),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, bottom: 5),
                        child: Text(
                            "Company Name : ${leadModel.company.toString()}",
                            style: TextStyle(fontSize: 15, color: Colors.blue)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, bottom: 5),
                        child: Text(
                            "Phone number : ${leadModel.phoneNumber.toString()}",
                            style: TextStyle(fontSize: 15)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, bottom: 5),
                        child: Text(
                            "Assigned to : ${leadModel.owner.toString()}",
                            style: TextStyle(fontSize: 15)),
                      ),
                      SizedBox(
                        height: 5,
                      ),

                      /// Animated Lead Details Button
                      // AnimatedButton(
                      //   width: 75,
                      //   height:25,
                      //   text: 'Details',
                      //   isReverse: true,
                      //   selectedTextColor: Colors.blue,
                      //   transitionType: TransitionType.LEFT_TO_RIGHT,
                      //   // textStyle: submitTextStyle,
                      //   //  backgroundColor: Colors.green,
                      //   //backgroundColor: Color.fromRGBO(55, 155, 155, 1.0),
                      //   backgroundColor: Colors.blue,
                      //   borderRadius: 15,
                      //   borderWidth: 2,
                      //      onPress: () {
                      //      StaticVariable.leadModel = leadModel;
                      //      StaticVariable.currentPageIndex = 0;
                      //      Navigator.push(
                      //          context,
                      //          MaterialPageRoute(
                      //              builder: (context) => const LeadManage()));
                      //    },
                      //  ),
                    ],
                  )),
            ),
          ),
        );
      },
    );
  }
}
