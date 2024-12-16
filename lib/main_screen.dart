import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_tracker/face_bloc/face_bloc.dart';
import 'package:mood_tracker/widgets/add_button.dart';
import 'package:mood_tracker/widgets/background_widget.dart';
import 'package:mood_tracker/widgets/custom_blob.dart';
import 'package:mood_tracker/widgets/face.dart';
import 'package:mood_tracker/widgets/percentage.dart';
import 'package:mood_tracker/widgets/smile_slider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Stack(
          children: [
            BlocBuilder<FaceCubit, double>(
              builder: (context, state) {
                return Background(percent: state.toInt());
              },
            ),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const CustomBlob(),
                  BlocBuilder<FaceCubit, double>(
                    builder: (context, state) {
                      return FaceWidget(value: state);
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: BlocBuilder<FaceCubit, double>(
                builder: (context, state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleButton(
                            value: state.toInt(),
                            icon: Icons.person_outline_rounded,
                            onTap: () {},
                          ),
                          CircleButton(
                            value: state.toInt(),
                            icon: Icons.add,
                            onTap: () {},
                          ),
                        ],
                      ),
                      Percentage(value: state.toInt()),
                      const SizedBox(height: 400),
                      SmileSlider(
                        value: state,
                        onChanged: (value) {
                          context.read<FaceCubit>().updateSmileCurvature(value);
                        },
                      ),
                      AnimatedButton(
                        onPress: () {},
                        height: 50,
                        width: 150,
                        text: 'SUBMIT',
                        isReverse: true,
                        selectedTextColor: Colors.black,
                        transitionType: TransitionType.CENTER_ROUNDER,
                        backgroundColor: Colors.transparent,
                        borderColor: Colors.white,
                        borderRadius: 50,
                        borderWidth: 2,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
