import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
  static const DB_NAME = 'shopping.db';
  static const DB_VERSION = 1;
  static Database _database;

  DBProvider._internal();

  static final DBProvider instance = DBProvider._internal();
  static const initScripts = [
    CREATE_TABLE_PRODUCT_Q,
    CREATE_TABLE_CART_ITEMS_Q
  ];

  init() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), DB_NAME),
      onCreate: (db, version) {
        initScripts.forEach((element) async => await db.execute(element));
      },
      onUpgrade: (db, oldVersion, newVersion) {},
      version: DB_VERSION,
    );
  }

  Database get database => _database;

  static const TABLE_PRODUCT = 'Product';
  static const CREATE_TABLE_PRODUCT_Q = '''
      CREATE TABLE $TABLE_PRODUCT(
                    product_id TEXT PRIMARY KEY,
                    title TEXT,
                    description TEXT,
                    briefDescription TEXT,
                    images TEXT,
                    colors INTEGER,
                    price REAL,
                    category TEXT,
                    isFavourite INTEGER,
                    remainingSizeUK TEXT,
                    remainingSizeUS TEXT,
                    productType TEXT
          );
    ''';

  static const TABLE_CART_ITEMS = 'CartItems';
  static const CREATE_TABLE_CART_ITEMS_Q = '''
            CREATE TABLE $TABLE_CART_ITEMS (
              cart_items_id INTEGER PRIMARY KEY,
              product_id TEXT NOT NULL UNIQUE,
              quantity INTEGER NOT NULL,
              FOREIGN KEY (product_id) REFERENCES Product (product_id)
            );
         ''';
}
