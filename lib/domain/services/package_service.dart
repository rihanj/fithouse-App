import '../../data/model/package_model.dart';

abstract class IPackageService{
  Future<dynamic>getMeals(Map<String,dynamic> data);
  Future<dynamic>getBranch();
  Future<dynamic>stripeIntegration(Map<String,dynamic> data);
  Future<dynamic>createSubscription(Map<String,dynamic> data);
}