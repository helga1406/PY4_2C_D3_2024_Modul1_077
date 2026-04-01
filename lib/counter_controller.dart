import 'package:shared_preferences/shared_preferences.dart';

class CounterController {
  int _counter = 0;
  int _step = 1;
  final List<String> _history = [];

  int get value => _counter;
  int get step => _step;
  List<String> get history => _history;

  void setStep(int s) => _step = s;

  Future<void> loadCounter(String username) async {
    final prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt('${username}_counter') ?? 0;
  }

  Future<void> saveCounter(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('${username}_counter', _counter);
  }

  void _addHistory(String aksi) {
    DateTime now = DateTime.now();
    String jam =
        "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";

    _history.insert(0, "$aksi (Jam $jam)");

    if (_history.length > 5) {
      _history.removeLast();
    }
  }

  Future<void> increment(String username) async {
    _counter += _step;
    _addHistory("menambah");
    await saveCounter(username);
  }

  Future<void> decrement(String username) async {
    if (_counter - _step >= 0) {
      _counter -= _step;
      _addHistory("mengurangi");
      await saveCounter(username);
    }
  }

  Future<void> reset(String username) async {
    _counter = 0;
    _addHistory("Data di-reset");
    await saveCounter(username);
  }
}