// db/database_helper.dart
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseUser {
  final int? id;
  final String username;
  final String password;

  DatabaseUser({
    this.id,
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'password': password,
    };
  }

  @override
  String toString() {
    return 'User{id: $id, username: $username, password: $password}';
  }

  factory DatabaseUser.fromMap(Map<String, dynamic> map) {
    return DatabaseUser(
      id: map['id'],
      username: map['username'],
      password: map['password'],
    );
  }
}

class DatabasePergunta {
  final int? id;
  final String perguntaText;
  final int userId;

  DatabasePergunta({
    this.id,
    required this.perguntaText,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'perguntaText': perguntaText,
      'userId': userId,
    };
  }

  @override
  String toString() {
    return 'Pergunta{id: $id, perguntaText: $perguntaText, userId: $userId}';
  }

  factory DatabasePergunta.fromMap(Map<String, dynamic> map) {
    return DatabasePergunta(
      id: map['id'],
      perguntaText: map['perguntaText'],
      userId: map['userId'],
    );
  }
}

class DatabaseHelper {
  static final _databaseName = 'myDatabase.db';
  static final _databaseVersion = 1;

  static final tableUser = 'user';
  static final tablePergunta = 'pergunta';

  static final columnId = 'id';

  static final columnUsername = 'username';
  static final columnPassword = 'password';

  static final columnPerguntaText = 'perguntaText';
  static final columnUserId = 'userId';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableUser (
        $columnId INTEGER PRIMARY KEY,
        $columnUsername TEXT,
        $columnPassword TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE $tablePergunta (
        $columnId INTEGER PRIMARY KEY,
        $columnPerguntaText TEXT,
        $columnUserId INTEGER,
        FOREIGN KEY ($columnUserId) REFERENCES $tableUser($columnId)
      )
    ''');
  }

  Future<int> insertUser(DatabaseUser user) async {
    Database db = await instance.database;
    return await db.insert(tableUser, user.toMap());
  }

  Future<DatabaseUser?> getUserByUsername(String username) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> result = await db.query(
      tableUser,
      where: '$columnUsername = ?',
      whereArgs: [username],
    );

    if (result.isNotEmpty) {
      return DatabaseUser.fromMap(result.first);
    } else {
      return null;
    }
  }

  Future<int> insertPergunta(DatabasePergunta pergunta) async {
    Database db = await instance.database;
    return await db.insert(tablePergunta, pergunta.toMap());
  }

  Future<List<DatabasePergunta>> getPerguntasByUserId(int userId) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> result = await db.query(
      tablePergunta,
      where: '$columnUserId = ?',
      whereArgs: [userId],
    );

    return result.map((map) => DatabasePergunta.fromMap(map)).toList();
  }
}
