import 'package:pinto_customer_flutter/model/product_preview.dart';

class Product extends ProductPreview{
  List<SourceFarmer> sourceFarmer = [];
  Product(Map<String,dynamic> jsonProduct) : super(jsonProduct){
    sourceFarmer = (jsonProduct['sourceFarm'] as List).map((e) => SourceFarmer(e)).toList();
  }
}

class SourceFarmer {
  String farmName = '';
  DateTime plantDate = DateTime.now();
  DateTime harvestDate = DateTime.now();

  SourceFarmer(Map<String,dynamic> jsonFarm){
    farmName = jsonFarm['farm_name'];
    plantDate = DateTime.parse(jsonFarm['plant_date']).toLocal();
    harvestDate = DateTime.parse(jsonFarm['harvest_date']).toLocal();
  }
}