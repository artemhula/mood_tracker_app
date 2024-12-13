import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mood_tracker/face_bloc/face_bloc.dart';
import 'package:mood_tracker/widgets/background_widget.dart';
import 'package:mood_tracker/widgets/custom_blob.dart';
import 'package:mood_tracker/widgets/face.dart';
import 'package:mood_tracker/widgets/smile_slider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<FaceCubit, double>(
            builder: (context, state) {
              return Background(percent: state.toInt());
            },
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '76%',
                  style: GoogleFonts.gabarito(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Stack(
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
                const SizedBox(height: 20),
                BlocBuilder<FaceCubit, double>(
                  builder: (context, state) {
                    return SmileSlider(
                      value: state,
                      onChanged: (value) {
                        context.read<FaceCubit>().updateSmileCurvature(value);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
