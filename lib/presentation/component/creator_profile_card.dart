import 'package:flutter/material.dart';
import 'package:food_recipe/data/data_source/creator_profile_data_source.dart';
import 'package:food_recipe/data/model/creatorProfile.dart';



class CreatorProfileScreen extends StatelessWidget {
  final CreatorProfileDataSource dataSource = CreatorProfileDataSource();

  @override
  Widget build(BuildContext context) {
    List<CreatorProfile> profiles = dataSource.getCreatorProfiles();
    return Scaffold(
      body: ListView.builder(
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          return CreatorProfileCard(creatorProfile: profiles[index]);
        },
      ),
    );
  }
}

class CreatorProfileCard extends StatefulWidget {
  final CreatorProfile creatorProfile;

  const CreatorProfileCard({Key? key, required this.creatorProfile})
      : super(key: key);

  @override
  _CreatorProfileCardState createState() => _CreatorProfileCardState();
}

class _CreatorProfileCardState extends State<CreatorProfileCard> {
  bool isFollowing = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(widget.creatorProfile.imageUrl),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.creatorProfile.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.green, size: 16),
                      SizedBox(width: 4),
                      Text(
                        widget.creatorProfile.place,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isFollowing = !isFollowing;
                });
              },
              child: Text(isFollowing ? 'Unfollow' : 'Follow'),
              style: ElevatedButton.styleFrom(
                backgroundColor: isFollowing ? Colors.green : Colors.white,
                foregroundColor: isFollowing
                    ? Colors.white
                    : Colors.green, // 상태에 따라 텍스트 색상 변경
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
