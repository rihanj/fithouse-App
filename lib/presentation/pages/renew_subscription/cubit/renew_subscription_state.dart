part of 'renew_subscription_cubit.dart';

@immutable
abstract class RenewSubscriptionState {}

class RenewSubscriptionInitialState extends RenewSubscriptionState {}

class RenewSubscriptionLoadingState extends RenewSubscriptionState {}

class RenewSuccessState extends RenewSubscriptionState {}
class RenewErrorState extends RenewSubscriptionState {}

class RenewSubscriptionRefreshState extends RenewSubscriptionState {}
