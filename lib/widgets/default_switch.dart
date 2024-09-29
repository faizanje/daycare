import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'flutter_advanced_switch.dart';

class DefaultSwitch extends StatelessWidget {
  const DefaultSwitch({super.key, this.value, this.onChanged});
  final ValueNotifier<bool>? value;
  final ValueChanged<bool?>? onChanged;
  @override
  Widget build(BuildContext context) {
    return AdvancedSwitch(
      controller: value,
      activeColor: Colors.black,
      inactiveColor: Colors.grey.shade300,
      height: 24,
      onChanged: (value) {
        this.value?.value = value;
        onChanged?.call(this.value?.value);
      },
    );
  }
}
