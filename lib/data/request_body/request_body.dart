class Requests{
  static Future<Map<String, dynamic>> subscriptionForm() async{

    return {
      "id": "5046223000044018001",
      "select_plan_days":"5 days",
      "package_name": "5 meals chicken + meat",
      "package_day_plan ": "5 days",
      "delivery_method": "Delivery",
      "branch": "5046223000027249003",
      "add_breakfast": "yes",
      "add_snacks": "1",
      "add_drink": "1",
      "number_of_subscription": "1",
      "carbs_quantity": "50g",
      "protein_quantity": "50g",
      "snack_quantity" : "2",
      "package_start_from": "2023-12-03",
      "notes":"notes data"
    };
  }
}