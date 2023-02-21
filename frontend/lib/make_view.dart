// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:lab_intrusion/input_key.dart';
// import 'package:lab_intrusion/input_password_during_make_provider.dart';

// class MakeView extends ConsumerWidget {
//   const MakeView({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Column(
//       children: [
//         ConstrainedBox(
//           constraints: BoxConstraints(
//             maxHeight: MediaQuery.of(context).size.height * 0.6,
//           ),
//           child: GridView.count(
//             crossAxisCount: 3,
//             children: ref
//                 .watch(inputKeysProvider)
//                 .map(
//                   (key) => InkWell(
//                     child: Container(
//                       color: Colors.grey.withAlpha(key.alpha),
//                       alignment: Alignment.center,
//                       child: Text('${key.value}'),
//                     ),
//                     onTap: () {
//                       ref
//                           .read(inputPasswordDuringMakeProvider.notifier)
//                           .addInput(key.value);
//                     },
//                   ),
//                 )
//                 .toList(),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(bottom: 32),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text('${ref.watch(inputPasswordDuringMakeProvider)}'),
//               IconButton(
//                 onPressed:
//                     ref.read(inputPasswordDuringMakeProvider.notifier).reset,
//                 icon: const Icon(Icons.close),
//               )
//             ],
//           ),
//         ),
//         OutlinedButton(
//           onPressed: () {},
//           child: const Text('塗りパターンを作る'),
//         )
//       ],
//     );
//   }
// }
