import 'package:dev_flutter/components/task.dart';
import 'package:dev_flutter/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String _tableName = 'taskTable';
  static const String _name = 'name';
  static const String _urlImage = 'urlImage';
  static const String _difficulty = 'difficulty';

  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_urlImage TEXT)';

  save(Task task) async {
    final db = await initDatabase();
    var itemExist = await find(task.nome);
    Map<String, dynamic> taskMap = toMap(task);

    if (itemExist.isEmpty) {
      return await db.insert(_tableName, taskMap);
    } else {
      return await db.update(
        _tableName,
        taskMap,
        where: '$_name = ?',
        whereArgs: [task.nome],
      );
    }
  }

  Future<List<Task>> findAll() async {
    print('Acessando o findAll: ');

    final db = await initDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);

    print('Encontrado: $result');

    return toList(result);
  }

  Future<List<Task>> find(String name) async {
    final db = await initDatabase();
    final List<Map<String, dynamic>> result = await db.query(
      _tableName,
      where: '$_name = ?',
      whereArgs: [name],
    );

    return toList(result);
  }

  delete(String name) async {
    final db = await initDatabase();
    return db.delete(
      _tableName,
      where: '$_name = ?',
      whereArgs: [name],
    );
  }

  List<Task> toList(List<Map<String, dynamic>> taskList) {
    final List<Task> tasks = [];

    for (Map<String, dynamic> task in taskList) {
      tasks.add(Task(task[_name], task[_urlImage], task[_difficulty]));
    }
    print('Tarefas: $tasks');
    return tasks;
  }

  Map<String, dynamic> toMap(Task task) {
    final Map<String, dynamic> mapTasks = Map();
    mapTasks[_name] = task.nome;
    mapTasks[_difficulty] = task.dificuldade;
    mapTasks[_urlImage] = task.foto;

    return mapTasks;
  }

  Future<Database> initDatabase() async {
    return await getDataBase();
  }
}
