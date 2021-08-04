import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:products_app/models/models.dart';
import 'package:http/http.dart' as http;

class ProductsService extends ChangeNotifier{
  final String _baseUrl = 'product-app-d9d9b-default-rtdb.firebaseio.com';
  final List<ProductModel> products = [];
  late ProductModel? selectedProduct;
  
  bool isLoading = true;
  bool isSaving = false;

  ProductsService(){
    this.loadProducts();
  }

  Future loadProducts() async{

    this.isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.get(url);

    final Map<String, dynamic> productsMap = json.decode(resp.body);

    productsMap.forEach((key, value) { 
      final tempProduct = ProductModel.fromMap(value);
      tempProduct.id = key;

      this.products.add(tempProduct);
    });

    this.isLoading = false;
    notifyListeners();

  }

  Future saveOrCreateProduct(ProductModel product) async{
    isSaving = true;
    notifyListeners();

    if(product.id == null){
      //crear
    }else{
      //actualizar
      await this.updateProduct(product);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateProduct(ProductModel product) async{
    final url = Uri.https(_baseUrl, 'products/${product.id}.json');
    final resp = await http.put(url, body: product.toJson());
    final decodedData = resp.body;

    print(decodedData);

    return product.id!;

  }

}