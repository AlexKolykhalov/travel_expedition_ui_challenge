import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:some_animation_ex12/cubit/horizontal/horizontal_cubit.dart';
import 'package:some_animation_ex12/widgets/image72/image72_widget.dart';

main() {
  Widget image72Test = Builder(builder: (BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Image72(size: size);
  });
  var app = MaterialApp(
    home: BlocProvider(
      create: (context) => HorizontalCubit(),
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [image72Test],
          ),
        ),
      ),
    ),
  );
  testWidgets('Image72 widget has text "72"', (WidgetTester tester) async {
    await tester.pumpWidget(app);
    final text72 = find.text('72');
    expect(text72, findsOneWidget);
  });
}
