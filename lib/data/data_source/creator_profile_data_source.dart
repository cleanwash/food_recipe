import 'package:food_recipe/data/model/creatorProfile.dart';

class CreatorProfileDataSource {
   List<CreatorProfile> getCreatorProfiles() {
    return [
      CreatorProfile(
        imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/Spiderman.JPG/800px-Spiderman.JPG',
        name: 'James Brown',
        place: 'Brooklyn',
      )
    ];
  }
}