import 'package:path/path.dart';
import 'package:primeiro_flutter/jsonModels/users.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{

    // CRIA O BANCO E A TABELA NO SQLITE

    final databaseName = "Monitoramento.db";
    String userTable = "CREATE TABLE IF NOT EXISTS users (userId INTEGER PRIMARY KEY AUTOINCREMENT, userName TEXT NOT NULL, userPassword TEXT NOT NULL)";
    Future<Database> initDB()async{
        final databasePath = await getDatabasesPath(); 
        final path = join(databasePath, databaseName);
        
        return openDatabase(path, version: 1, onCreate: (db, version) async {
            await db.execute(userTable);
           // Verifica se o usuário "admin" já existe antes de tentar inserir
            var result = await db.rawQuery(
              "SELECT * FROM users WHERE userName = 'admin' AND userPassword = 'admin'"
            );

            if (result.isEmpty) {
              // Inserir usuário "admin" apenas se não existir
              await db.rawInsert(
                "INSERT INTO users (userName, userPassword) VALUES (?, ?)",
                ['admin', 'admin']
              );
            }
          });
        }

    // METODOS CRUD

    //metodo login

    Future <bool> login(Users user) async {
        final Database db = await initDB();

        var result = await db.rawQuery("SELECT * FROM USERS WHERE userName = '${user.userName}' AND userPassword = '${user.userPassword}'");
        if (result.isNotEmpty){
            return true;
        }else {
          return false;
        }
    }
}