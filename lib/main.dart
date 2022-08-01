import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pakistanProvider = Provider<String>((ref) => 'Pakistan');
final punjabProvider = Provider<String>((ref) => 'Punjab');
void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final pak = ref.read(pakistanProvider);
    final punjab = ref.read(punjabProvider);
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('''Pakistan=$pak
Punjab=$punjab'''),
        ),
      ),
    );
  }
}
//So here you can see that this provider search on the base of object
//We have to wrap our runApp in ProviderScope
//Then we declare our providers globally so we can get access anywhere
//Then StateFul Widget and State is replaced by ConsumerStateful Widget and ConsumerState respectively
//Now it have access to global providers because of ref parameter
//So it will search on object base
//And riverpod is based on isolation...it is independent of flutter framework
