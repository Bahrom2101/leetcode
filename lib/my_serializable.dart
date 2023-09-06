void main() {
  String s =
      "{orders: [{cashbox_id: 465ee6ab-194a-42c6-92a0-1e263332b6f0, customer_id: , order_items: "
      "[{barcode: 2000000000091, discount_unit: , discount_value: 0, measurement_value: 1, name: "
      "Гуллар, price: 25785, product_id: 396e89e2-ce2a-48d0-ab19-4399697653aa, id: 54ffe377-0a69-4655-94a5-89795b5d1cbd, "
      "retail_price: 25785, sellers: [], sku: ZFG-60423, total_price: 25785, used_wholesale_price: false, "
      "returned_measurement_value: 0, created_at: null, updated_at: null, product_type_id: null, has_manual_discount: null, "
      "sale_price: 25785}], order_payments: [{id: 4d7aacdc-e33b-44c6-a09f-8a86d8be282c, "
      "company_payment_type_id: 3e1ad844-ca4c-4398-a6cb-e82ade6ef603, paid_amount: 25785, returned_amount: 0}], "
      "total_price: 25785, order_type: SALE, shop_id: fb566807-4823-434e-bd6f-d55b44c97a9d, user_id: "
      "e1f71000-de32-4187-ae8b-4f41c3e4a8cf, order_id: d47bce5c-7559-45c8-914d-b5289ee54dd2, created_at: 2023-05-18 05:19:00, "
      "return_order_id: null, deleted: null, with_cashback: 0}, {cashbox_id: 465ee6ab-194a-42c6-92a0-1e263332b6f0, customer_id: , "
      "order_items: [{barcode: 2000000000091, discount_unit: PERCENTAGE, discount_value: 15, measurement_value: 3, name: Гуллар, "
      "price: 25785, product_id: 396e89e2-ce2a-48d0-ab19-4399697653aa, id: a3de43ec-ab81-4c8b-8d54-3432a51c69ed, retail_price: "
      "25785, sellers: [], sku: ZFG-60423, total_price: 65752, used_wholesale_price: false, returned_measurement_value: 0, "
      "created_at: null, updated_at: null, product_type_id: null, has_manual_discount: null, sale_price: 77355}, "
      "{barcode: 2000000000022, discount_unit: , discount_value: 0, measurement_value: 1, name: bread, price: 1100, product_id: "
      "a32063f1-9fe5-4ea9-86a9-dda8b57dd82d, id: 0bbd7030-bf08-4f0b-95b3-ade3760da80d, retail_price: 1100, sellers: [], "
      "sku: MAX-42080, total_price: 1100, used_wholesale_price: false, returned_measurement_value: 0, created_at: null, "
      "updated_at: null, product_type_id: null, has_manual_discount: null, sale_price: 1100}], order_payments: "
      "[{id: 05115634-f0ec-479b-a38e-cc92bd031c0f, company_payment_type_id: 3e1ad844-ca4c-4398-a6cb-e82ade6ef603, paid_amount: "
      "66852, returned_amount: 0}], total_price: 66852, order_type: SALE, shop_id: fb566807-4823-434e-bd6f-d55b44c97a9d, "
      "user_id: e1f71000-de32-4187-ae8b-4f41c3e4a8cf, order_id: b29e5d3b-db34-4dfc-a7ad-a022345aed47, created_at: "
      "2023-05-18 05:19:46, return_order_id: null, deleted: null, with_cashback: 0}], session_id: null}";

  print(addQuotesToJSON(s));
}

String addQuotesToJSON(String jsonString) {
  // Remove any existing whitespace characters
  jsonString = jsonString.replaceAll(RegExp(r'\s'), '');

  // Add double quotes around keys and values
  jsonString = jsonString.replaceAllMapped(RegExp(r'(\w+):'), (match) {
    return '"${match.group(1)}":';
  });

  jsonString =
      jsonString.replaceAllMapped(RegExp(r':([^{},\[\]]+)([,}\]])'), (match) {
        final value = match.group(1);
        final punctuation = match.group(2);
        if (value == 'null' || value == 'true' || value == 'false') {
          return ': $value$punctuation';
        } else if (double.tryParse(value ?? '') != null) {
          return ': $value$punctuation';
        } else {
          return ': "$value"$punctuation';
        }
      });

  return jsonString;
}
