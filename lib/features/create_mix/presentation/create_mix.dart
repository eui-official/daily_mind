import 'package:flutter/material.dart';

class CreateMix extends StatelessWidget {
  const CreateMix({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Column(
        children: [
          Text(
            'Tạo danh sách kết hợp từ các âm thanh tự nhiên như: mưa, rừng, gió, lửa, sông và vụ trụ. Sau đó thưởng thức chúng',
          )
        ],
      ),
    );
  }
}
