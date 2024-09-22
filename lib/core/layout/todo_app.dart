import 'package:flutter/material.dart';
import 'package:group_sun_s1/core/share/widgets/my_text_form_field.dart';
import 'package:group_sun_s1/features/modules/todo/archive/archive_screen.dart';
import 'package:group_sun_s1/features/modules/todo/done/done_screen.dart';
import 'package:group_sun_s1/features/modules/todo/new/new_screen.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';


class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

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
List<Map> tasks = [];
int currentIndex = 0;
var scaffoldKey = GlobalKey<ScaffoldState>();
bool isShowBottom = false;
IconData fabIcon = Icons.edit;
Database? database;
var titleController = TextEditingController();
var timeController = TextEditingController();
var dateController = TextEditingController();

class _TodoAppState extends State<TodoApp> {
  @override
  void initState() {
    createDataFromDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        title: Text(
          titles[currentIndex],
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // try{
          //   var name = await getName();
          //   print(name);
          //   throw('Error is !!!!!!');
          // }catch(error){
          //   print(error.toString());
          // }
          // getName()
          //     .then(
          //       (value) {
          //         print(value);
          //         throw('error is!!!!!!');
          //       },
          //     )
          //     .catchError(
          //       (error) {
          //         print(error.toString());
          //       },
          //     );
          if (isShowBottom) {
            insertDataFromDatabase(
              title: titleController.text,
              time: timeController.text,
              date: dateController.text
            ).then(
              (value) {
                getDataFromDatabase(database).then(
                  (value) {
                    if(context.mounted){
                      Navigator.pop(context);
                    }
                    setState(() {
                      isShowBottom = false;
                      fabIcon = Icons.edit;
                      tasks = value;
                    });
                  },
                );
              },
            );
          } else {
            scaffoldKey.currentState!
                .showBottomSheet(
                  (context) => Container(
                    color: Colors.grey[300],
                    child: Padding(
                      padding: const EdgeInsets.all(
                        20.0,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MyTextFormField(
                            controller: titleController,
                            type: TextInputType.text,
                            text: 'title',
                            prefix: Icons.title,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Title must be not empty';
                              }
                              return null;
                            },
                            radius: 15.0,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          MyTextFormField(
                            controller: timeController,
                            type: TextInputType.datetime,
                            text: 'time',
                            prefix: Icons.watch_later_outlined,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Time must be not empty';
                              }
                              return null;
                            },
                            radius: 15.0,
                            onTap: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              ).then(
                                (value) {
                                  if (value != null) {
                                    if (context.mounted) {
                                      timeController.text =
                                          value.format(context);
                                      print(value.format(context));
                                    }
                                  }
                                },
                              );
                            },
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          MyTextFormField(
                            controller: dateController,
                            type: TextInputType.datetime,
                            text: 'date',
                            prefix: Icons.calendar_month,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Date must be not empty';
                              }
                              return null;
                            },
                            radius: 15.0,
                            onTap: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                              showDatePicker(
                                context: context,
                                firstDate: DateTime.now(),
                                lastDate: DateTime.parse('2024-12-31'),
                              ).then(
                                (value) {
                                  if (value != null) {
                                    dateController.text =
                                        DateFormat.yMMMd().format(value);
                                    print(DateFormat.yMMMd()
                                        .format(value)
                                        .toString());
                                  }
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .closed
                .then(
              (value) {
                setState(() {
                  isShowBottom = false;
                  fabIcon = Icons.edit;
                });
              },
            );
            setState(() {
              isShowBottom = true;
              fabIcon = Icons.add;
            });
          }
        },
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            30.0,
          ),
        ),
        child: Icon(
          fabIcon,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        currentIndex: currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
      body: screens[currentIndex],
    );
  }
}

void createDataFromDatabase() async {
  var databasesPath = await getDatabasesPath();
  String path = p.join(databasesPath, 'tasks.db');
  openDataFromDatabase(path: path);
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
      getDataFromDatabase(database).then(
        (value) {
          tasks = value;
          print(tasks.toString());
        },
      );
      print('Database opened');
    },
  ).then(
    (value) {
      database = value;
    },
  );
}

Future insertDataFromDatabase({
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
        getDataFromDatabase(database).then(
          (value) {
            tasks = value;
            print(tasks.toString());
          },
        );
        print('$value Inserted Successfully');
      },
    ).catchError(
      (error) {
        print('Error whe data inserted table ${error.toString()}');
      },
    );
  });
}

Future<List<Map>> getDataFromDatabase(database) async {
  return await database.rawQuery('SELECT * FROM tasks');
}
