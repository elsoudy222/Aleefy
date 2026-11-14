import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// class CustomSvgWidget extends StatelessWidget {
//   final String path;
//   final double? width;
//   final double? height;
//   final Color? color;
//   final BoxFit? fit;

//   const CustomSvgWidget({
//     super.key,
//     required this.path,
//     this.width,
//     this.height,
//     this.color,
//     this.fit,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SvgPicture.asset(
//       '$kImagesPath$path',
//       width: width,
//       height: height,
//       fit: fit ?? BoxFit.contain,
//       colorFilter: color != null
//           ? ColorFilter.mode(color!, BlendMode.srcIn)
//           : null,
//     );
//   }
// }

class CustomSvgIconWidget extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit? fit;

  const CustomSvgIconWidget({
    super.key,
    required this.path,
    this.width,
    this.height,
    this.color,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: SvgPicture.asset(
        path,
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
        colorFilter: color != null
            ? ColorFilter.mode(color!, BlendMode.srcIn)
            : null,
      ),
    );
  }
}

class CustomSvgIconFileWidget extends StatelessWidget {
  final File file;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit? fit;

  const CustomSvgIconFileWidget({
    super.key,
    required this.file,
    this.width,
    this.height,
    this.color,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: SvgPicture.file(
        file,
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
        colorFilter: color != null
            ? ColorFilter.mode(color!, BlendMode.srcIn)
            : null,
      ),
    );
  }
}

class FittedImage extends StatelessWidget {
  final double? height;
  final double? width;
  final String path;
  final BoxFit fit;

  const FittedImage({
    super.key,
    this.height,
    this.width,
    required this.path,
    this.fit = BoxFit.fill,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: FittedBox(fit: fit, child: Image.asset(path)),
    );
  }
}

class GifImage extends StatefulWidget {
  final double? height;
  final double? width;
  final String path;
  final BoxFit fit;

  const GifImage({
    super.key,
    this.height,
    this.width,
    required this.path,
    this.fit = BoxFit.fill,
  });

  @override
  State<GifImage> createState() => _GifImageState();
}

class _GifImageState extends State<GifImage> {
  AssetImage? image;
  @override
  void initState() {
    super.initState();

    image = AssetImage(widget.path);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: FittedBox(
        fit: widget.fit,
        child: image != null
            ? Image(image: image!)
            : const CircularProgressIndicator(),
      ),
    );
  }

  @override
  void dispose() {
    if (image != null) {
      image!.evict();
    }
    super.dispose();
  }
}

class FittedFileImage extends StatelessWidget {
  final double? height;
  final double? width;
  final String path;
  final BoxFit fit;

  const FittedFileImage({
    super.key,
    this.height,
    this.width,
    required this.path,
    this.fit = BoxFit.fill,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        height: height,
        width: width,
        child: FittedBox(fit: fit, child: Image.file(File(path))),
      ),
    );
  }
}

class AnimatedFittedImage extends StatefulWidget {
  final double? height;
  final double? width;
  final String path;
  final String sound;
  final void Function()? callback;
  final BoxFit fit;
  const AnimatedFittedImage({
    super.key,
    this.height,
    this.width,
    this.sound = '',
    required this.path,
    this.callback,
    this.fit = BoxFit.fill,
  });

  @override
  State<AnimatedFittedImage> createState() => _AnimatedFittedImageState();
}

class _AnimatedFittedImageState extends State<AnimatedFittedImage>
    with SingleTickerProviderStateMixin {
  late AnimationController buttonController;
  late Animation<double> buttonAnimation;
  @override
  void initState() {
    super.initState();
    initButtonAnimation();
  }

  void initButtonAnimation() {
    buttonController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    buttonAnimation = Tween<double>(begin: 1.0, end: 0.7).animate(
      CurvedAnimation(parent: buttonController, curve: Curves.easeInOut),
    );
    buttonAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        buttonController.reverse();
      }
    });
  }

  @override
  void dispose() {
    buttonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        buttonController.forward();
        Timer(const Duration(milliseconds: 400), widget.callback ?? () {});
      },
      child: AnimatedBuilder(
        animation: buttonAnimation,
        builder: (context, child) {
          return Transform.scale(scale: buttonAnimation.value, child: child);
        },
        child: SizedBox(
          height: widget.height,
          width: widget.width,
          child: FittedBox(fit: widget.fit, child: Image.asset(widget.path)),
        ),
      ),
    );
  }
}

// class CustomCachedNetworkImage extends StatelessWidget {
//   final String url;
//   final double? width;
//   final double? height;
//   final BoxFit fit;
//   final Widget? placeholder;
//   final Widget? errorWidget;

//   const CustomCachedNetworkImage({
//     super.key,
//     required this.url,
//     this.width,
//     this.height,
//     this.fit = BoxFit.cover,
//     this.placeholder,
//     this.errorWidget,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return CachedNetworkImage(
//       imageUrl: url,
//       width: width,
//       height: height,
//       fit: fit,
//       placeholder: (context, url) =>
//           placeholder ?? const Icon(Icons.photo, color: AppColor.textBody),
//       errorWidget: (context, url, error) =>
//           errorWidget ?? const Icon(Icons.error),
//     );
//   }
// }
