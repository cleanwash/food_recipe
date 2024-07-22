import 'package:flutter/material.dart';
import 'package:food_recipe/data/model/creatorProfile.dart';

class CreatorprofileCard extends StatelessWidget {
  final CreatorProfile creatorprofile;

  const CreatorprofileCard({Key? key, required this.creatorprofile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // 프로필 이미지 부분
            ClipOval(
              child: Image.network(
                creatorprofile.imageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            // 이름과 장소 부분
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 이름
                      Text(
                        creatorprofile.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // 장소
                      Row(
                        children: [
                          const Icon(Icons.place,
                              color: Colors.green), // 초록색 아이콘으로 변경
                          Text(
                            creatorprofile.place,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Follow 버튼
            ElevatedButton(
              onPressed: () {
                print("Follow button pressed");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text("Follow"),
            ),
          ],
        ),
      ),
    );
  }
}

