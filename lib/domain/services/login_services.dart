import '../../data/model/user_details_model.dart';

abstract class ILoginServices{
  Future<dynamic>userDetails(Map<String ,dynamic> data);
}