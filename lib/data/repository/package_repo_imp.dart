import 'package:fithouse_app/domain/repositories/package.dart';

import '../../config/js_log.dart';
import '../../config/logger.dart';
import '../../domain/services/package_service.dart';
import '../model/branch_model.dart';
import '../model/package_model.dart';
import '../services/package_services_imp.dart';

class PackageRepoImp extends IPackageRepo {
  IPackageService service = PackageServicesImp();

  @override
  Future<dynamic> getMeals(Map<String, dynamic> data) async {
    List<PackageModel> list = [];

    try {
      final response = await service.getMeals(data);

      for (var i in response) {
        list.add(PackageModel.fromJson(i));
      }
      return list;
    } catch (err) {
      Logger.errorLog("$err");
      JSLog.error(msg: err.toString());
      return list;
    }
  }

  @override
  Future getBranch() async {
    List<BranchModel> list = [];

    try {
      final response = await service.getBranch();

      for (var i in response) {
        list.add(BranchModel.fromJson(i));
      }
      return list;
    } catch (err) {
      Logger.errorLog("$err");
      JSLog.error(msg: err.toString());
      return list;
    }
  }

  @override
  Future stripIntegration(Map<String, dynamic> data) async {
    try {
      final response = await service.stripeIntegration(data);

      return response;
    } catch (err) {
      Logger.errorLog("$err");
      JSLog.error(msg: err.toString());
      // return list;
    }
  }

  @override
  Future<dynamic> createSubscription(Map<String, dynamic> data) async {
    try {
      final response = await service.createSubscription(data);

        return response;


    } catch (err) {
      Logger.errorLog("$err");
      JSLog.error(msg: err.toString());
      return false;
    }
  }
}
