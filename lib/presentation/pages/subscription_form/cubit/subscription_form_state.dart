
@override
part of'subscription_form_cubit.dart';
abstract class SubscriptionFormState{}
class SubscriptionFormInitialState extends SubscriptionFormState{}
class SubscriptionRefreshState extends SubscriptionFormState{}
class SubscriptionLoadingState extends SubscriptionFormState{}
class SubscriptionButtonLoadingState extends SubscriptionFormState{}
class SubscriptionSuccessState extends SubscriptionFormState{}

class SubscriptionSuccessFormState extends SubscriptionFormState{
  final String data;
  SubscriptionSuccessFormState(this.data);
}
class SubscriptionErrorState extends SubscriptionFormState{
  final String data;
  SubscriptionErrorState(this.data);
}

