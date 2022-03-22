import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

MotionToast? errorToast(BuildContext context, String description) {
  MotionToast.error(title: const Text("Erreur"), description: Text(description))
      .show(context);
  FocusScope.of(context).unfocus();
  return null;
}

MotionToast? warningToast(BuildContext context, String description) {
  MotionToast.warning(
          title: const Text("Attention"), description: Text(description))
      .show(context);
  FocusScope.of(context).unfocus();
  return null;
}

MotionToast? successToast(
    BuildContext context, String title, String description) {
  MotionToast.success(
    title: Text(title),
    description: Text(description),
    width: 300,
    toastDuration: const Duration(seconds: 2),
  ).show(context);
  return null;
}
