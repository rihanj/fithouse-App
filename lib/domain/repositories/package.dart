

abstract class IPackageRepo {
  Future<dynamic> getMeals(Map<String, dynamic> data);
  Future<dynamic> getBranch();
  Future<dynamic> stripIntegration(Map<String, dynamic> data);
  Future<dynamic> createSubscription(Map<String, dynamic> data);
}