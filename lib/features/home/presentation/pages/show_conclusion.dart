// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:quizz_app/core/constant/color_value.dart';
// import 'package:quizz_app/features/home/mock/mock_data.dart';
// import 'package:quizz_app/features/home/presentation/bloc/choose_answer_bloc/choose_answer_bloc.dart';

// class ShowConclusion extends StatelessWidget {
//   const ShowConclusion({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             children: [
//               Text(
//                 "Chúc mừng bạn đã hoàn thành kiểm tra",
//                 style: TextStyle(
//                   color: mainColor,
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(
//                 "Bạn đã trả lời đúng ${context.read<ChooseAnswerBloc>().countTrueAnswer}/${sample_data.length}",
//                 style: TextStyle(
//                   color: mainColor,
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               InkWell(
//                 onTap: () {
//                   context.pop();
//                   context.pop();
//                 },
//                 child: Container(
//                   child: Text(
//                     "Back",
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                   decoration: BoxDecoration(color: mainColor),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
