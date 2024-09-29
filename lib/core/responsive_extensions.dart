import 'package:flutter/cupertino.dart';

extension ContextX on BuildContext {
  bool get isWeb => MediaQuery.sizeOf(this).width > 800;
  bool get isTablet => MediaQuery.sizeOf(this).width > 600;
  bool get isMobile => MediaQuery.sizeOf(this).width > 400 && MediaQuery.sizeOf(this).width < 600;
}
