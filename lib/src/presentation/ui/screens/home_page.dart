//  //   ///
//  Import LIBRARIES
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//  Import FILES
import '../../../data/players.dart';
import '../../providers/player_provider.dart';
//  //   ///

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final players = ref.watch(playerNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Filter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20.0),
            TextField(
              onChanged: (value) =>
                  ref.read(playerNotifierProvider.notifier).filterPlayer(value),
              decoration: const InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                // itemCount: allPlayers.length,
                itemCount: players.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                    // 'Name $index',
                    // '${allPlayers[index]['name']}',
                    '${players[index]['name']}',

                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  trailing: Text(
                    // 'Name $index',
                    // '${allPlayers[index]['country']}',
                    '${players[index]['country']}',
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    // 'Country $index',
                    // '${allPlayers[index]['job']}',
                    '${players[index]['job']}',
                    style: const TextStyle(fontSize: 14.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
