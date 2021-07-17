import 'package:flutter/cupertino.dart';
import 'package:products_app/models/models.dart';

class ProductsService extends ChangeNotifier{
  final String _baseUrl = 'product-app-d9d9b-default-rtdb.firebaseio.com';
  final List<ProductModel> products = [];
}