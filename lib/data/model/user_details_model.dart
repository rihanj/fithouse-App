/// id : "5046223000042349031"
/// full_name : "EBRAHIM ELHARBY"
/// email : ""
/// phone : "966547330960"
/// message : "Login\nSuccessfull"
/// status : true
/// subscripton : [{"id":"5046223000042363005","Status":"On\nHold"}]
/// Subscription_status : "Available"

class UserDetailsModel {
  UserDetailsModel({
      String? id, 
      String? fullName, 
      String? email, 
      String? phone, 
      String? message, 
      bool? status, 
      List<Subscripton>? subscripton, 
      String? subscriptionStatus,}){
    _id = id;
    _fullName = fullName;
    _email = email;
    _phone = phone;
    _message = message;
    _status = status;
    _subscripton = subscripton;
    _subscriptionStatus = subscriptionStatus;
}

  UserDetailsModel.fromJson(dynamic json) {
    _id = json['id'];
    _fullName = json['full_name'];
    _email = json['email'];
    _phone = json['phone'];
    _message = json['message'];
    _status = json['status'];
    if (json['subscripton'] != null) {
      _subscripton = [];
      json['subscripton'].forEach((v) {
        _subscripton?.add(Subscripton.fromJson(v));
      });
    }
    _subscriptionStatus = json['Subscription_status'];
  }
  String? _id;
  String? _fullName;
  String? _email;
  String? _phone;
  String? _message;
  bool? _status;
  List<Subscripton>? _subscripton;
  String? _subscriptionStatus;
UserDetailsModel copyWith({  String? id,
  String? fullName,
  String? email,
  String? phone,
  String? message,
  bool? status,
  List<Subscripton>? subscripton,
  String? subscriptionStatus,
}) => UserDetailsModel(  id: id ?? _id,
  fullName: fullName ?? _fullName,
  email: email ?? _email,
  phone: phone ?? _phone,
  message: message ?? _message,
  status: status ?? _status,
  subscripton: subscripton ?? _subscripton,
  subscriptionStatus: subscriptionStatus ?? _subscriptionStatus,
);
  String? get id => _id;
  String? get fullName => _fullName;
  String? get email => _email;
  String? get phone => _phone;
  String? get message => _message;
  bool? get status => _status;
  List<Subscripton>? get subscripton => _subscripton;
  String? get subscriptionStatus => _subscriptionStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['full_name'] = _fullName;
    map['email'] = _email;
    map['phone'] = _phone;
    map['message'] = _message;
    map['status'] = _status;
    if (_subscripton != null) {
      map['subscripton'] = _subscripton?.map((v) => v.toJson()).toList();
    }
    map['Subscription_status'] = _subscriptionStatus;
    return map;
  }

}

/// id : "5046223000042363005"
/// Status : "On\nHold"

class Subscripton {
  Subscripton({
      String? id, 
      String? status,}){
    _id = id;
    _status = status;
}

  Subscripton.fromJson(dynamic json) {
    _id = json['id'];
    _status = json['Status'];
  }
  String? _id;
  String? _status;
Subscripton copyWith({  String? id,
  String? status,
}) => Subscripton(  id: id ?? _id,
  status: status ?? _status,
);
  String? get id => _id;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['Status'] = _status;
    return map;
  }

}