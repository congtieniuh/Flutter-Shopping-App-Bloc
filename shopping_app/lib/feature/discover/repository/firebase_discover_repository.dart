import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_app/feature/discover/model/product.dart';
import 'package:shopping_app/feature/discover/repository/discover_repository.dart';

class FirebaseDiscoverRepository extends DiscoverRepository {
  final discoverCollection = FirebaseFirestore.instance.collection('products');

  @override
  Stream<List<Product>> getListProduct() {
    return discoverCollection.snapshots().map(_productListFromSnapshot);
  }

  List<Product> _productListFromSnapshot(QuerySnapshot snapshot) {
    var result = snapshot.docs.map((doc) {
      return Product(
          images: List<String>.from(doc.data()['images']),
          colors: doc.data()['colors'],
          title: doc.data()['title'],
          price: doc.data()['price'] ,
          description: doc.data()['description'],
          briefDescription: doc.data()['briefDescription'],
          remainingSizeUK: List<double>.from(doc.data()['remainingSizeUK']),
          remainingSizeUS: List<double>.from(doc.data()['remainingSizeUS']),
          productType: ProductType.UPCOMMING);

    }).toList();

    return result;
  }
}
