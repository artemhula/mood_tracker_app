import 'package:blobs/blobs.dart';
import 'package:flutter/material.dart';

class CustomBlob extends StatelessWidget {
  const CustomBlob({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scaleY: 1.15,
      child: Blob.animatedRandom(
        size: 320,
        loop: true,
        styles: BlobStyles(
          strokeWidth: 8,
          fillType: BlobFillType.stroke,
          color: Colors.white,
        ),
        minGrowth: 8,
        edgesCount: 5,
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
