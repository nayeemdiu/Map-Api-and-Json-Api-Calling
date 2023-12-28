import 'package:api/api_services.dart';
import 'package:api/lead_list_from_map.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    ApiServices().fetchLeadList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

          appBar: AppBar(title: Text("Dashboard  Api From Json"), centerTitle: true,),


          /// Dashbboard Map api Grid view(Mazed vai)
          body: FutureBuilder(
            future: ApiServices().fetchLeadList(),
            builder: (context, snapshot) {

            if(snapshot.hasData){

              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {

                  return Column(
                    children: [
                      /// Today follow up & Solved follow up
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.lightBlue, //<-- SEE HERE
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              elevation: 15,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    // begin: Alignment.topCenter,
                                    // end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.lightBlueAccent,
                                      Colors.white,
                                      Colors.lightBlueAccent,
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                               // margin: EdgeInsets.only(top: 5),
                                width: 150,
                                height: 100,
                                child: Column(
                                  children: [
                                    /// Sized box
                                    SizedBox(height: 15,),
                                    Text('Total Follow up',   style: const TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.w700),),
                                    Text(snapshot.data![index].totalFollowup.toString(),
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),

                          /// solved follow up

                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Card(

                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.lightBlue, //<-- SEE HERE
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              elevation: 15,

                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    // begin: Alignment.topCenter,
                                    // end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.lightBlueAccent,
                                      Colors.white,
                                      Colors.lightBlueAccent,
                                      ],
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                // margin: EdgeInsets.only(top: 5),
                                width: 150,
                                height: 100,
                                child: Column(
                                  children: [
                                    /// Sized box
                                    SizedBox(height: 15,),
                                    Text(' Solved Followup',   style: const TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.w700),),
                                    Text(snapshot.data![index].solvedFollowup.toString(),
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15,),

                      /// pending follow up & Today follow up
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ///PendingFollowup
                          Card(

                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.lightBlue, //<-- SEE HERE
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 15,

                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  // begin: Alignment.topCenter,
                                  // end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.white,
                                    Colors.lightBlueAccent,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              // margin: EdgeInsets.only(top: 5),
                              width: 150,
                              height: 100,
                              child: Column(
                                children: [
                                  /// Sized box
                                  SizedBox(height: 15,),
                                  Text('PendingFollowup',   style: const TextStyle(
                                      color: Colors.black, fontWeight: FontWeight.w700),),
                                  Text(snapshot.data![index].pendingFollowup.toString(),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 15,),
                          Card(
                            ///Today follow up
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.lightBlue, //<-- SEE HERE
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 15,

                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  // begin: Alignment.topCenter,
                                  // end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.white,
                                    Colors.lightBlueAccent,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              // margin: EdgeInsets.only(top: 5),
                              width: 150,
                              height: 100,
                              child: Column(
                                children: [
                                  /// Sized box
                                  SizedBox(height: 15,),
                                  Text(' TodayFollowup',   style: const TextStyle(
                                      color: Colors.black, fontWeight: FontWeight.w700),),
                                  Text(snapshot.data![index].todayFollowup.toString(),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15,),

                      /// Next3 days follow up & today Pending follow up
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Card(
                            /// next3days follow up
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.lightBlue, //<-- SEE HERE
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 15,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  // begin: Alignment.topCenter,
                                  // end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.white,
                                    Colors.lightBlueAccent,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              // margin: EdgeInsets.only(top: 5),
                              width: 150,
                              height: 100,
                              child: Column(
                                children: [
                                  /// Sized box
                                  SizedBox(height: 15,),
                                  Text('next3DaysFollowup',   style: const TextStyle(
                                      color: Colors.black, fontWeight: FontWeight.w700),),
                                  Text(snapshot.data![index].next3DaysFollowup.toString(),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 15,),
                          Card(
                            /// today pending follow up
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.lightBlue, //<-- SEE HERE
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 15,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  // begin: Alignment.topCenter,
                                  // end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.white,
                                    Colors.lightBlueAccent,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              // margin: EdgeInsets.only(top: 5),
                              width: 150,
                              height: 100,
                              child: Column(
                                children: [
                                  /// Sized box
                                  SizedBox(height: 15,),
                                  Text(' todayPendingFollowup',   style: const TextStyle(
                                      color: Colors.black, fontWeight: FontWeight.w700),),
                                  Text(snapshot.data![index].todayPendingFollowup.toString(),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                       SizedBox(height: 50,),

                      ElevatedButton(onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => LeadListFromMap(),));
                      }, child: Text(
                        "Lead List From Map"
                      )),


                    ],
                  );


                  /// practice
                  // return Card(
                  //   elevation: 5,
                  //   child: ListTile(
                  //     title: Text("Total Follow up"),
                  //     leading:  Text(snapshot.data![index].totalFollowup.toString()),
                  //     subtitle: Text("Total Follow up"),
                  //     trailing: Text(snapshot.data![index].pendingFollowup.toString()),
                  //   ),
                  // );


              },);
            }
            return Center(child: CircularProgressIndicator());
          },),


  );

  }
}
