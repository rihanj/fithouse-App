/// Package_name : "3 Meals 20 Days"
/// snacks : "no"
/// Breakfast : "No"
/// Branch_Name : "Fitness Time Nahdah"
/// Protein : "150 gm"
/// Carb : "150 gm"
/// Delivery_Type : "Pickup"
/// Payment_Method : "Bank Transfer"
/// Multiple_Customized : false
/// meals : [{"Days_meal":[{"a":"meal 1","name":[{"carb":"WHITE RICE WITH VEG."},{"carb":"BEEF GOULASH"}]},{"a":"meal 2","name":[{"carb":"RED PASTA"},{"carb":"FAJITA CHICKEN"}]},{"a":"meal 3","name":[{"carb":"CUBES POTATO'S"},{"carb":"TANDOORI CHICKEN"}]}],"breakfast":"","snack":"","carb":"150 gm","protein":"150 gm","snack_qty":0,"date":"16-Oct-23"},{"Days_meal":[{"a":"meal 1","name":[{"carb":"GRILL POTATO"},{"carb":"GRILL CHICKEN WITH LEMON ALMOND SAUCE"}]},{"a":"meal 2","name":[{"carb":"PAELLA RICE"},{"carb":"GRILL SHRIMP"}]},{"a":"meal 3","name":[{"carb":"KABSA RICE"},{"carb":"APOLLO CHICKEN"}]}],"breakfast":"","snack":"","carb":"150 gm","protein":"150 gm","snack_qty":0,"date":"17-Oct-23"},{"Days_meal":[{"a":"meal 1","name":[{"carb":"ZAFRAN RICE"},{"carb":"Tandoori Chicken"}]},{"a":"meal 2","name":[{"carb":"RED PASTA WITH COLORED PAPPER"},{"carb":"DAWOOD BASHA"}]},{"a":"meal 3","name":[{"carb":"GRILL POTATO"},{"carb":"FISH WITH TOMATO SALSA"}]}],"breakfast":"","snack":"","carb":"150 gm","protein":"150 gm","snack_qty":0,"date":"18-Oct-23"},{"Days_meal":[{"a":"meal 1","name":[{"carb":"MASH POTATO"},{"carb":"BEEF STEAK WITH CHIMMICHURI SAUCE"}]},{"a":"meal 2","name":[{"carb":"SPANICH RICE"},{"carb":"GRILL SALMON"}]},{"a":"meal 3","name":[{"carb":"MEXICAN RICE"},{"carb":"GRILL CHICKEN"}]}],"breakfast":"","snack":"","carb":"150 gm","protein":"150 gm","snack_qty":0,"date":"19-Oct-23"},{"Days_meal":[{"a":"meal 1","name":[{"carb":"Spinach Pasta"},{"carb":"Fish With Chili Sauce"}]},{"a":"meal 2","name":[{"carb":"MEXICAN RICE"},{"carb":"GRILL CHICKEN WITH TOMATO SALSA"}]},{"a":"meal 3","name":[{"carb":"YELLOW RICE WITH VEG"},{"carb":"STEAK FAJITA"}]}],"breakfast":"","snack":"","carb":"150 gm","protein":"150 gm","snack_qty":0,"date":"22-Oct-23"},{"Days_meal":[{"a":"meal 1","name":[{"carb":"WHITE RICE WITH VEG."},{"carb":"BEEF GOULASH"}]},{"a":"meal 2","name":[{"carb":"RED PASTA"},{"carb":"FAJITA CHICKEN"}]},{"a":"meal 3","name":[{"carb":"CUBES POTATO'S"},{"carb":"TANDOORI CHICKEN"}]}],"breakfast":"","snack":"","carb":"150 gm","protein":"150 gm","snack_qty":0,"date":"23-Oct-23"},{"Days_meal":[{"a":"meal 1","name":[{"carb":"GRILL POTATO"},{"carb":"GRILL CHICKEN WITH LEMON ALMOND SAUCE"}]},{"a":"meal 2","name":[{"carb":"PAELLA RICE"},{"carb":"GRILL SHRIMP"}]},{"a":"meal 3","name":[{"carb":"KABSA RICE"},{"carb":"APOLLO CHICKEN"}]}],"breakfast":"","snack":"","carb":"150 gm","protein":"150 gm","snack_qty":0,"date":"24-Oct-23"}]

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
      List<Meals>? meals,}){
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
HomeModel copyWith({  String? packageName,
  String? snacks,
  String? breakfast,
  String? branchName,
  String? protein,
  String? carb,
  String? deliveryType,
  String? paymentMethod,
  bool? multipleCustomized,
  List<Meals>? meals,
}) => HomeModel(  packageName: packageName ?? _packageName,
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

/// Days_meal : [{"a":"meal 1","name":[{"carb":"WHITE RICE WITH VEG."},{"carb":"BEEF GOULASH"}]},{"a":"meal 2","name":[{"carb":"RED PASTA"},{"carb":"FAJITA CHICKEN"}]},{"a":"meal 3","name":[{"carb":"CUBES POTATO'S"},{"carb":"TANDOORI CHICKEN"}]}]
/// breakfast : ""
/// snack : ""
/// carb : "150 gm"
/// protein : "150 gm"
/// snack_qty : 0
/// date : "16-Oct-23"

class Meals {
  Meals({
      List<DaysMeal>? daysMeal, 
      String? breakfast, 
      String? snack, 
      String? carb, 
      String? protein, 
      num? snackQty, 
      String? date,}){
    _daysMeal = daysMeal;
    _breakfast = breakfast;
    _snack = snack;
    _carb = carb;
    _protein = protein;
    _snackQty = snackQty;
    _date = date;
}

  Meals.fromJson(dynamic json) {
    if (json['Days_meal'] != null) {
      _daysMeal = [];
      json['Days_meal'].forEach((v) {
        _daysMeal?.add(DaysMeal.fromJson(v));
      });
    }
    _breakfast = json['breakfast'];
    _snack = json['snack'];
    _carb = json['carb'];
    _protein = json['protein'];
    _snackQty = json['snack_qty'];
    _date = json['date'];
  }
  List<DaysMeal>? _daysMeal;
  String? _breakfast;
  String? _snack;
  String? _carb;
  String? _protein;
  num? _snackQty;
  String? _date;
Meals copyWith({  List<DaysMeal>? daysMeal,
  String? breakfast,
  String? snack,
  String? carb,
  String? protein,
  num? snackQty,
  String? date,
}) => Meals(  daysMeal: daysMeal ?? _daysMeal,
  breakfast: breakfast ?? _breakfast,
  snack: snack ?? _snack,
  carb: carb ?? _carb,
  protein: protein ?? _protein,
  snackQty: snackQty ?? _snackQty,
  date: date ?? _date,
);
  List<DaysMeal>? get daysMeal => _daysMeal;
  String? get breakfast => _breakfast;
  String? get snack => _snack;
  String? get carb => _carb;
  String? get protein => _protein;
  num? get snackQty => _snackQty;
  String? get date => _date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_daysMeal != null) {
      map['Days_meal'] = _daysMeal?.map((v) => v.toJson()).toList();
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

/// a : "meal 1"
/// name : [{"carb":"WHITE RICE WITH VEG."},{"carb":"BEEF GOULASH"}]

class DaysMeal {
  DaysMeal({
      String? a, 
      List<Name>? name,}){
    _a = a;
    _name = name;
}

  DaysMeal.fromJson(dynamic json) {
    _a = json['a'];
    if (json['name'] != null) {
      _name = [];
      json['name'].forEach((v) {
        _name?.add(Name.fromJson(v));
      });
    }
  }
  String? _a;
  List<Name>? _name;
DaysMeal copyWith({  String? a,
  List<Name>? name,
}) => DaysMeal(  a: a ?? _a,
  name: name ?? _name,
);
  String? get a => _a;
  List<Name>? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['a'] = _a;
    if (_name != null) {
      map['name'] = _name?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// carb : "WHITE RICE WITH VEG."

class Name {
  Name({
      String? carb,}){
    _carb = carb;
}

  Name.fromJson(dynamic json) {
    _carb = json['carb'];
  }
  String? _carb;
Name copyWith({  String? carb,
}) => Name(  carb: carb ?? _carb,
);
  String? get carb => _carb;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['carb'] = _carb;
    return map;
  }

}