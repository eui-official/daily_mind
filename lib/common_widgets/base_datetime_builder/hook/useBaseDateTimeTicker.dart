import 'dart:async';

import 'package:daily_mind/constants/constants.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

DateTime useBaseDateTimeTicker() {
  final dateTime = useState(DateTime.now().toLocal());

  useEffect(() {
    final timer = Timer.periodic(kLongDuration, (timer) {
      dateTime.value = DateTime.now().toLocal();
    });

    return timer.cancel;
  }, []);

  return dateTime.value;
}
