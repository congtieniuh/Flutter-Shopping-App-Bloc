import 'package:shopping_app/feature/discover/model/product.dart';

abstract class DiscoverRepository {

  Stream<List<Product>> getListProduct();
}
