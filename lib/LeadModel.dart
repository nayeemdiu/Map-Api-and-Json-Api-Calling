class LeadModel{
  String? id;
  String? customerName;
  String? owner;
  String? phoneNumber;
  String? company;
  String? leadStatus;
  String? area;


  LeadModel(
      this.id,
      this.customerName,
      this.owner,
      this.phoneNumber,
      this.company,
      this.leadStatus,
      this.area);

  LeadModel.fromMap(Map<String,dynamic> map){

    id = map['id'];
    customerName = map['customer_name'];
    owner = map['owner'];
    phoneNumber = map['phone_number'];
    company = map['company'];
    leadStatus = map['leadstatus'];
    area = map['area'];

  }

  Map<String, dynamic> toMap(){

    return {
      "id": id,
      "customer_name": customerName,
      "owner": owner,
      "phone_number": phoneNumber,
      "company": company,
      "leadstatus": leadStatus,
      "area": area,
    };
  }

}