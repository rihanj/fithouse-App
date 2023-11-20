/// Account_id : "5046223000013090089"
/// account_name : "Financial Center"
/// Arabic_Name : "المركز المالي"

class BranchModel {
  BranchModel({
      String? accountId, 
      String? accountName, 
      String? arabicName,}){
    _accountId = accountId;
    _accountName = accountName;
    _arabicName = arabicName;
}

  BranchModel.fromJson(dynamic json) {
    _accountId = json['Account_id'];
    _accountName = json['account_name'];
    _arabicName = json['Arabic_Name'];
  }
  String? _accountId;
  String? _accountName;
  String? _arabicName;
BranchModel copyWith({  String? accountId,
  String? accountName,
  String? arabicName,
}) => BranchModel(  accountId: accountId ?? _accountId,
  accountName: accountName ?? _accountName,
  arabicName: arabicName ?? _arabicName,
);
  String? get accountId => _accountId;
  String? get accountName => _accountName;
  String? get arabicName => _arabicName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Account_id'] = _accountId;
    map['account_name'] = _accountName;
    map['Arabic_Name'] = _arabicName;
    return map;
  }

}