/// product Name : "2 Meals 24 Days"
/// Arabic Name : "وجبتين 24 يوم"
/// Price : 1312.17
/// Delivery Charge : 288
/// Snack Amount : 176.52
/// Carb Amount : 102.61
/// Breakfast Amount : 252.52
/// SKU : "sk-7104"
/// id : "5046223000000717052"
/// Package Days : "24"
/// In Week : "6 Days in a Week"

class PackageModel {
  PackageModel({
      String? productName, 
      String? arabicName, 
      num? price, 
      num? deliveryCharge, 
      num? snackAmount, 
      num? carbAmount, 
      num? breakfastAmount, 
      String? sku, 
      String? id, 
      String? packageDays, 
      String? inWeek,}){
    _productName = productName;
    _arabicName = arabicName;
    _price = price;
    _deliveryCharge = deliveryCharge;
    _snackAmount = snackAmount;
    _carbAmount = carbAmount;
    _breakfastAmount = breakfastAmount;
    _sku = sku;
    _id = id;
    _packageDays = packageDays;
    _inWeek = inWeek;
}

  PackageModel.fromJson(dynamic json) {
    _productName = json['product Name'];
    _arabicName = json['Arabic Name'];
    _price = json['Price'];
    _deliveryCharge = json['Delivery Charge'];
    _snackAmount = json['Snack Amount'];
    _carbAmount = json['Carb Amount'];
    _breakfastAmount = json['Breakfast Amount'];
    _sku = json['SKU'];
    _id = json['id'];
    _packageDays = json['Package Days'];
    _inWeek = json['In Week'];
  }
  String? _productName;
  String? _arabicName;
  num? _price;
  num? _deliveryCharge;
  num? _snackAmount;
  num? _carbAmount;
  num? _breakfastAmount;
  String? _sku;
  String? _id;
  String? _packageDays;
  String? _inWeek;
PackageModel copyWith({  String? productName,
  String? arabicName,
  num? price,
  num? deliveryCharge,
  num? snackAmount,
  num? carbAmount,
  num? breakfastAmount,
  String? sku,
  String? id,
  String? packageDays,
  String? inWeek,
}) => PackageModel(  productName: productName ?? _productName,
  arabicName: arabicName ?? _arabicName,
  price: price ?? _price,
  deliveryCharge: deliveryCharge ?? _deliveryCharge,
  snackAmount: snackAmount ?? _snackAmount,
  carbAmount: carbAmount ?? _carbAmount,
  breakfastAmount: breakfastAmount ?? _breakfastAmount,
  sku: sku ?? _sku,
  id: id ?? _id,
  packageDays: packageDays ?? _packageDays,
  inWeek: inWeek ?? _inWeek,
);
  String? get productName => _productName;
  String? get arabicName => _arabicName;
  num? get price => _price;
  num? get deliveryCharge => _deliveryCharge;
  num? get snackAmount => _snackAmount;
  num? get carbAmount => _carbAmount;
  num? get breakfastAmount => _breakfastAmount;
  String? get sku => _sku;
  String? get id => _id;
  String? get packageDays => _packageDays;
  String? get inWeek => _inWeek;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product Name'] = _productName;
    map['Arabic Name'] = _arabicName;
    map['Price'] = _price;
    map['Delivery Charge'] = _deliveryCharge;
    map['Snack Amount'] = _snackAmount;
    map['Carb Amount'] = _carbAmount;
    map['Breakfast Amount'] = _breakfastAmount;
    map['SKU'] = _sku;
    map['id'] = _id;
    map['Package Days'] = _packageDays;
    map['In Week'] = _inWeek;
    return map;
  }

}