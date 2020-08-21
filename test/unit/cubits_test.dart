import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:some_animation_ex12/cubit/animation_button/animation_button_cubit.dart';
import 'package:some_animation_ex12/cubit/horizontal/horizontal_cubit.dart';
import 'package:some_animation_ex12/cubit/map_animation/map_animation_cubit.dart';
import 'package:some_animation_ex12/cubit/on_map_transition/on_map_transition_cubit.dart';
import 'package:some_animation_ex12/cubit/users/users_cubit.dart';
import 'package:some_animation_ex12/cubit/vertical/vertical_cubit.dart';
import 'package:some_animation_ex12/models.dart';

void main() {
  group('vertical cubit', () {
    blocTest<VerticalCubit, double>(
      'get init value',
      build: () => VerticalCubit(),
      expect: [],
    );

    blocTest<VerticalCubit, double>(
      'set vertical position',
      build: () => VerticalCubit(),
      act: (cubit) => cubit.setVerticalPosition(currentVerticalPosition: 1.0),
      expect: const <double>[1.0],
    );

    blocTest<VerticalCubit, double>(
      'set negative vertical position',
      build: () => VerticalCubit(),
      act: (cubit) => cubit.setVerticalPosition(currentVerticalPosition: -1.0),
      expect: const <double>[0.0],
    );
  });

  group('horizontal cubit', () {
    blocTest<HorizontalCubit, Parameter>(
      'get init value',
      build: () => HorizontalCubit(),
      expect: [],
    );

    blocTest<HorizontalCubit, Parameter>(
      'set horizontal position & page',
      build: () => HorizontalCubit(),
      act: (cubit) => cubit.setParameter(
          parameter: Parameter(horizontalPosition: 1.0, page: 1.0)),
      expect: [Parameter(horizontalPosition: 1.0, page: 1.0)],
    );
  });

  group('animation_button cubit', () {
    blocTest<AnimationButtonCubit, int>(
      'init state',
      build: () => AnimationButtonCubit(),
      expect: [],
    );
    group('onTapDown', () {
      blocTest<AnimationButtonCubit, int>(
        'emit[1] if state == 0',
        build: () => AnimationButtonCubit(),
        act: (cubit) => cubit.onTapDown(),
        expect: [1],
      );
      blocTest<AnimationButtonCubit, int>(
        'emit[2] if state != 0',
        build: () => AnimationButtonCubit(),
        act: (cubit) => cubit..onTapDown()..onTapDown(),
        expect: [1, 2],
      );
    });
    group('onTapUp', () {
      blocTest<AnimationButtonCubit, int>(
        'emit[2] if state == 1',
        build: () => AnimationButtonCubit(),
        act: (cubit) => cubit
          ..onTapDown()
          ..onTapUp(),
        expect: [1, 2],
      );
      blocTest<AnimationButtonCubit, int>(
        'emit[0] if state != 1',
        build: () => AnimationButtonCubit(),
        act: (cubit) => cubit.onTapUp(),
        expect: [0],
      );
    });
    group('onCancel', () {
      blocTest<AnimationButtonCubit, int>(
        'emit[0] if state == 1',
        build: () => AnimationButtonCubit(),
        act: (cubit) => cubit
          ..onTapDown()
          ..onCancel(),
        expect: [1, 0],
      );
      blocTest<AnimationButtonCubit, int>(
        'emit[2] if state != 1',
        build: () => AnimationButtonCubit(),
        act: (cubit) => cubit.onCancel(),
        expect: [2],
      );
    });
  });

  group('map_animation cubit', () {
    blocTest(
      'init state',
      build: () => MapAnimationCubit(),
      expect: [],
    );
    blocTest<MapAnimationCubit, double>(
      'set tweenAnimationValue',
      build: () => MapAnimationCubit(),
      act: (cubit) => cubit.setTweenAnimation(val: 1.0),
      expect: [1.0],
    );
  });

  group('on_map transition cubit', () {
    blocTest(
      'init state',
      build: () => OnMapTransitionCubit(),
      expect: [],
    );

    blocTest<OnMapTransitionCubit, bool>(
      'change a value',
      build: () => OnMapTransitionCubit(),
      act: (cubit) => cubit.onMapTransition(showMap: true),
      expect: [true],
    );
  });

  group('users cubit', () {
    blocTest(
      'init state',
      build: () => GetUsersCubit(),
      expect: [],
    );
    blocTest<GetUsersCubit, List<User>>(
      'get users',
      build: () => GetUsersCubit(),
      act: (cubit) => cubit.getUsers(),
      expect: [isA<List<User>>()],
    );
  });
}
