/// Package_name : "2 Meals Chicken 24 Days"
/// snacks : "no"
/// Breakfast : "No"
/// Branch_Name : "Fitness Time -Alnaeim"
/// Protein : "150 gm"
/// Carb : "150 gm"
/// Delivery_Type : "Pickup"
/// Payment_Method : "Credit Card"
/// Multiple_Customized : false
/// meals : [{"meal_1":{"carb":"MASH POTATO","protein":"GRILL CHICKEN WITH CILANTRO SAUCE"},"meal_2":{"carb":"SPANICH RICE","protein":"CHICKEN WITH PEANUTS"},"breakfast":"","snack":"","carb":"150 gm","protein":"150 gm","snack_qty":0,"date":"12-Oct-23"},{"meal_1":{"carb":"WHITE RICE WITH VEG.","protein":"GRILL CHICKEN"},"meal_2":{"carb":"ALFRIDO PASTA","protein":"Chicken With Coriander Pesto"},"breakfast":"","snack":"","carb":"150 gm","protein":"150 gm","snack_qty":0,"date":"14-Oct-23"},{"meal_1":{"carb":"GRILL POTATO","protein":"CHICKEN WITH PROVENCAL SAUCE"},"meal_2":{"carb":"KABSA RICE","protein":"CHICKEN BIRYANI"},"breakfast":"","snack":"","carb":"150 gm","protein":"150 gm","snack_qty":0,"date":"15-Oct-23"},{"meal_1":{"carb":"WHITE RICE","protein":"APOLLO CHICKEN"},"meal_2":{"carb":"SPANICH PASTA","protein":"TANDOORI CHICKEN"},"breakfast":"","snack":"","carb":"150 gm","protein":"150 gm","snack_qty":0,"date":"16-Oct-23"},{"meal_1":{"carb":"RED PASTA WITH COLORED PAPPER","protein":"GRILL CHICKEN"},"meal_2":{"carb":"BIRYANI RICE","protein":"GRILL CHICKEN WITH CILANTRO SAUCE"},"breakfast":"","snack":"","carb":"150 gm","protein":"150 gm","snack_qty":0,"date":"17-Oct-23"},{"meal_1":{"carb":"SWEET POTATO","protein":"GRILL CHICKEN WITH TOMATO SALSA"},"meal_2":{"carb":"PAELLA RICE","protein":"TANDOORI CHICKEN"},"breakfast":"","snack":"","carb":"150 gm","protein":"150 gm","snack_qty":0,"date":"18-Oct-23"},{"meal_1":{"carb":"Mexican Rice","protein":"CHICKEN BIRYANI"},"meal_2":{"carb":"CUBES POTATO'S","protein":"CHICKEN WITH PEANUTS"},"breakfast":"","snack":"","carb":"150 gm","protein":"150 gm","snack_qty":0,"date":"19-Oct-23"}]

class HomeModel {
  HomeModel({
    String? packageName,
    String? snacks,
    String? breakfast,
    String? branchName,
    String? protein,
    String? carb,
    String? deliveryType,
    String? paymentMethod,
    bool? multipleCustomized,
    List<Meals>? meals,
  }) {
    _packageName = packageName;
    _snacks = snacks;
    _breakfast = breakfast;
    _branchName = branchName;
    _protein = protein;
    _carb = carb;
    _deliveryType = deliveryType;
    _paymentMethod = paymentMethod;
    _multipleCustomized = multipleCustomized;
    _meals = meals;
  }

  HomeModel.fromJson(dynamic json) {
    _packageName = json['Package_name'];
    _snacks = json['snacks'];
    _breakfast = json['Breakfast'];
    _branchName = json['Branch_Name'];
    _protein = json['Protein'];
    _carb = json['Carb'];
    _deliveryType = json['Delivery_Type'];
    _paymentMethod = json['Payment_Method'];
    _multipleCustomized = json['Multiple_Customized'];
    if (json['meals'] != null) {
      _meals = [];
      json['meals'].forEach((v) {
        _meals?.add(Meals.fromJson(v));
      });
    }
  }
  String? _packageName;
  String? _snacks;
  String? _breakfast;
  String? _branchName;
  String? _protein;
  String? _carb;
  String? _deliveryType;
  String? _paymentMethod;
  bool? _multipleCustomized;
  List<Meals>? _meals;
  HomeModel copyWith({
    String? packageName,
    String? snacks,
    String? breakfast,
    String? branchName,
    String? protein,
    String? carb,
    String? deliveryType,
    String? paymentMethod,
    bool? multipleCustomized,
    List<Meals>? meals,
  }) =>
      HomeModel(
        packageName: packageName ?? _packageName,
        snacks: snacks ?? _snacks,
        breakfast: breakfast ?? _breakfast,
        branchName: branchName ?? _branchName,
        protein: protein ?? _protein,
        carb: carb ?? _carb,
        deliveryType: deliveryType ?? _deliveryType,
        paymentMethod: paymentMethod ?? _paymentMethod,
        multipleCustomized: multipleCustomized ?? _multipleCustomized,
        meals: meals ?? _meals,
      );
  String? get packageName => _packageName;
  String? get snacks => _snacks;
  String? get breakfast => _breakfast;
  String? get branchName => _branchName;
  String? get protein => _protein;
  String? get carb => _carb;
  String? get deliveryType => _deliveryType;
  String? get paymentMethod => _paymentMethod;
  bool? get multipleCustomized => _multipleCustomized;
  List<Meals>? get meals => _meals;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Package_name'] = _packageName;
    map['snacks'] = _snacks;
    map['Breakfast'] = _breakfast;
    map['Branch_Name'] = _branchName;
    map['Protein'] = _protein;
    map['Carb'] = _carb;
    map['Delivery_Type'] = _deliveryType;
    map['Payment_Method'] = _paymentMethod;
    map['Multiple_Customized'] = _multipleCustomized;
    if (_meals != null) {
      map['meals'] = _meals?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// meal_1 : {"carb":"MASH POTATO","protein":"GRILL CHICKEN WITH CILANTRO SAUCE"}
/// meal_2 : {"carb":"SPANICH RICE","protein":"CHICKEN WITH PEANUTS"}
/// breakfast : ""
/// snack : ""
/// carb : "150 gm"
/// protein : "150 gm"
/// snack_qty : 0
/// date : "12-Oct-23"

class Meals {
  Meals({
    Meal1? meal1,
    Meal2? meal2,
    String? breakfast,
    String? snack,
    String? carb,
    String? protein,
    num? snackQty,
    String? date,
  }) {
    _meal1 = meal1;
    _meal2 = meal2;
    _breakfast = breakfast;
    _snack = snack;
    _carb = carb;
    _protein = protein;
    _snackQty = snackQty;
    _date = date;
  }

  Meals.fromJson(dynamic json) {
    _meal1 = json['meal_1'] != null ? Meal1.fromJson(json['meal_1']) : null;
    _meal2 = json['meal_2'] != null ? Meal2.fromJson(json['meal_2']) : null;
    _breakfast = json['breakfast'];
    _snack = json['snack'];
    _carb = json['carb'];
    _protein = json['protein'];
    _snackQty = json['snack_qty'];
    _date = json['date'];
  }
  Meal1? _meal1;
  Meal2? _meal2;
  String? _breakfast;
  String? _snack;
  String? _carb;
  String? _protein;
  num? _snackQty;
  String? _date;
  Meals copyWith({
    Meal1? meal1,
    Meal2? meal2,
    String? breakfast,
    String? snack,
    String? carb,
    String? protein,
    num? snackQty,
    String? date,
  }) =>
      Meals(
        meal1: meal1 ?? _meal1,
        meal2: meal2 ?? _meal2,
        breakfast: breakfast ?? _breakfast,
        snack: snack ?? _snack,
        carb: carb ?? _carb,
        protein: protein ?? _protein,
        snackQty: snackQty ?? _snackQty,
        date: date ?? _date,
      );
  Meal1? get meal1 => _meal1;
  Meal2? get meal2 => _meal2;
  String? get breakfast => _breakfast;
  String? get snack => _snack;
  String? get carb => _carb;
  String? get protein => _protein;
  num? get snackQty => _snackQty;
  String? get date => _date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_meal1 != null) {
      map['meal_1'] = _meal1?.toJson();
    }
    if (_meal2 != null) {
      map['meal_2'] = _meal2?.toJson();
    }
    map['breakfast'] = _breakfast;
    map['snack'] = _snack;
    map['carb'] = _carb;
    map['protein'] = _protein;
    map['snack_qty'] = _snackQty;
    map['date'] = _date;
    return map;
  }
}

/// carb : "SPANICH RICE"
/// protein : "CHICKEN WITH PEANUTS"

class Meal2 {
  Meal2({
    String? carb,
    String? protein,
  }) {
    _carb = carb;
    _protein = protein;
  }

  Meal2.fromJson(dynamic json) {
    _carb = json['carb'];
    _protein = json['protein'];
  }
  String? _carb;
  String? _protein;
  Meal2 copyWith({
    String? carb,
    String? protein,
  }) =>
      Meal2(
        carb: carb ?? _carb,
        protein: protein ?? _protein,
      );
  String? get carb => _carb;
  String? get protein => _protein;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['carb'] = _carb;
    map['protein'] = _protein;
    return map;
  }
}

/// carb : "MASH POTATO"
/// protein : "GRILL CHICKEN WITH CILANTRO SAUCE"

class Meal1 {
  Meal1({
    String? carb,
    String? protein,
  }) {
    _carb = carb;
    _protein = protein;
  }

  Meal1.fromJson(dynamic json) {
    _carb = json['carb'];
    _protein = json['protein'];
  }
  String? _carb;
  String? _protein;
  Meal1 copyWith({
    String? carb,
    String? protein,
  }) =>
      Meal1(
        carb: carb ?? _carb,
        protein: protein ?? _protein,
      );
  String? get carb => _carb;
  String? get protein => _protein;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['carb'] = _carb;
    map['protein'] = _protein;
    return map;
  }
}
