import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/src/providers/device_provider.dart';
import 'package:widgetbook/src/utils/extensions.dart';

class DeviceItem extends StatelessWidget {
  const DeviceItem({
    Key? key,
    required this.device,
  }) : super(key: key);

  final DeviceInfo device;

  @override
  Widget build(BuildContext context) {
    final deviceProvider = DeviceProvider.of(context)!;
    final state = deviceProvider.state;
    final isCurrent = device == state.currentDevice;

    return GestureDetector(
      onTap: () {
        deviceProvider.selectDevice(
          device,
        );
      },
      child: buildTooltip(
        context: context,
        isCurrent: isCurrent,
      ),
    );
  }

  Widget buildTooltip(
      {required BuildContext context, required bool isCurrent}) {
    return Tooltip(
      message: device.name,
      child: buildIcon(
        device.identifier.type,
        isCurrent ? context.colorScheme.primary : context.theme.hintColor,
      ),
    );
  }

  Widget buildIcon(DeviceType type, Color color) {
    switch (type) {
      // case DeviceType.watch:
      //   return Icon(
      //     Icons.watch,
      //     color: color,
      //   );
      // case DeviceType.mobile:
      //   return Icon(
      //     Icons.smartphone,
      //     color: color,
      //   );
      case DeviceType.tablet:
        return Icon(
          Icons.tablet,
          color: color,
        );
      case DeviceType.desktop:
        return Icon(
          Icons.desktop_windows,
          color: color,
        );
      case DeviceType.unknown:
        return Icon(
          Icons.quiz,
          color: color,
        );
      case DeviceType.phone:
        return Icon(
          Icons.phone_android,
          color: color,
        );
      case DeviceType.tv:
        return Icon(
          Icons.tv,
          color: color,
        );
      case DeviceType.laptop:
        return Icon(
          Icons.laptop,
          color: color,
        );
    }
  }
}
