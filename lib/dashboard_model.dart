class DashboardModel {
  String? status;
  List<Data>? data;

  DashboardModel({this.status, this.data});

  DashboardModel.fromJson(Map<dynamic, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? totalFollowup;
  int? solvedFollowup;
  int? pendingFollowup;
  int? todayFollowup;
  int? next3DaysFollowup;
  int? todayPendingFollowup;

  Data(
      {this.totalFollowup,
        this.solvedFollowup,
        this.pendingFollowup,
        this.todayFollowup,
        this.next3DaysFollowup,
        this.todayPendingFollowup});

  Data.fromJson(Map<dynamic, dynamic> json) {
    totalFollowup = json['totalFollowup'];
    solvedFollowup = json['solvedFollowup'];
    pendingFollowup = json['pendingFollowup'];
    todayFollowup = json['todayFollowup'];
    next3DaysFollowup = json['next3DaysFollowup'];
    todayPendingFollowup = json['todayPendingFollowup'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalFollowup'] = this.totalFollowup;
    data['solvedFollowup'] = this.solvedFollowup;
    data['pendingFollowup'] = this.pendingFollowup;
    data['todayFollowup'] = this.todayFollowup;
    data['next3DaysFollowup'] = this.next3DaysFollowup;
    data['todayPendingFollowup'] = this.todayPendingFollowup;
    return data;
  }
}
