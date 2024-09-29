import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_sun_s1/core/layout/controller/cubit/state.dart';
import 'package:group_sun_s1/features/modules/todo/archive/archive_screen.dart';
import 'package:group_sun_s1/features/modules/todo/done/done_screen.dart';
import 'package:group_sun_s1/features/modules/todo/new/new_screen.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart' as p;

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.menu,
        ),
        label: 'New'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.check_box,
        ),
        label: 'Done'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.archive,
        ),
        label: 'Archive'),
  ];
  List<Widget> screens = [
    const NewScreen(),
    const DoneScreen(),
    const ArchiveScreen(),
  ];
  List<String> titles = [
    'New',
    'Done',
    'Archive',
  ];
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archiveTasks = [];
  int currentIndex = 0;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  bool isShowBottom = false;
  IconData fabIcon = Icons.edit;
  Database? database;
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  void changeFabIcon({
    required bool isShow,
    required IconData icon,
  }) {
    isShowBottom = isShow;
    fabIcon = icon;
    emit(AppChangeFabIconState());
  }

  void changeBottomNav(index) {
    currentIndex = index;
    emit(AppChangeBottomNavState());
  }

  void createDataFromDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = p.join(databasesPath, 'tasks.db');
    openDataFromDatabase(path: path);
    emit(AppCreateDataFromDatabaseState());
  }

  void openDataFromDatabase({
    required String path,
  }) async {
    await openDatabase(
      path,
      version: 1,
      onCreate: (Database database, int version) async {
        print('Database created');
        await database
            .execute(
          'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, time TEXT, date TEXT, status TEXT)',
        )
            .then(
          (value) {
            print('Table created');
          },
        ).catchError(
          (error) {
            print('Error when table create ${error.toString()}');
          },
        );
      },
      onOpen: (database) {
        getDataFromDatabase(database);
        emit(AppOpenDataFromDatabaseState());
        print('Database opened');
      },
    ).then(
      (value) {
        database = value;
      },
    );
  }

  void insertDataFromDatabase({
    required String title,
    required String time,
    required String date,
  }) async {
    await database!.transaction((txn) async {
      await txn
          .rawInsert(
        'INSERT INTO tasks(title, time, date, status) VALUES("$title", "$time", "$date", "new")',
      )
          .then(
        (value) {
          getDataFromDatabase(database);
          emit(AppInsertDataFromDatabaseState());
          print('$value Inserted Successfully');
        },
      ).catchError(
        (error) {
          print('Error whe data inserted table ${error.toString()}');
        },
      );
    });
  }

  void getDataFromDatabase(database) async {
    newTasks = [];
    doneTasks = [];
    archiveTasks = [];
    await database.rawQuery('SELECT * FROM tasks').then(
      (value) {
        value.forEach(
          (element) {
            if (element['status'] == 'new') {
              newTasks.add(element);
            } else if (element['status'] == 'done') {
              doneTasks.add(element);
            } else {
              archiveTasks.add(element);
            }
          },
        );
        print(newTasks.toString());
      },
    );
    emit(AppGetFromDatabaseState());
  }

  void updateDataFromDatabase({
    required String status,
    required int id,
  }) async {
    await database!.rawUpdate(
      'UPDATE tasks SET status = ? WHERE id = ?',
      [status, id],
    ).then(
      (value) {
        getDataFromDatabase(database);
        emit(AppUpdateFromDatabaseState());
      },
    );
  }

  void deleteDataFromDatabase({
    required int id,
  }) async {
    await database!.rawDelete(
      'DELETE FROM tasks WHERE id = ?',
      [
        id,
      ],
    ).then(
      (value)
      {
        getDataFromDatabase(database);
        emit(AppDeleteFromDatabaseState());
      },
    );
  }
}
