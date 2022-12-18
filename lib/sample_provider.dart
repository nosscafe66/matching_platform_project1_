import 'package:provider/provider.dart';

...
// このクラスが状態管理、変更を担う
class CounterNotifer extends ChangeNotifier {
  var counter = 0;

  void incrementCounter() {
    counter++;
    notifyListeners();
  }
}

// Stateless WidgetでOK
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CounterNotifer(),
      child: CounterPage(),
    );
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<CounterNotifer>(
          // 囲う範囲は最小限にする。
          // Consumerで囲まず、context.watch<CounterNotifier>().counter でも取得可
          builder: (context, countNotifier, child) => Text(
            countNotifier.counter.toString(),
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // 状態を変更するだけで、監視する必要がないので listen: false
        onPressed: Provider.of<CounterNotifer>(context, listen: false)
            .incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
