import '../../data/model/user_details_model.dart';

abstract class ILoginRepo {
  Future<dynamic> getUser(Map<String, dynamic> data);
}
