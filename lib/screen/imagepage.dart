import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({ Key? key }) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
 final urlImage = 'https://i0.wp.com/picjumbo.com/wp-content/uploads/beautiful-nature-scenery-smartphone-wallpaper-free-photo.jpg?w=2210&quality=70';

  @override
  Widget build(BuildContext context) {
    return ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        children:const <Widget> [
            // Center(
            //   child: Image.network(urlImage,
            //   height: 300,
            //   width: 400,
            //   fit: BoxFit.cover,
            //   ),
            // ),
            // const SizedBox(
            //   height: 16,
            // )
            // ,
             CircleAvatar(
              radius: 120,
              child: ClipOval(
                child: Image(                  
                  image: AssetImage('assets/image/cat.jpg') ,
                  height: 240,
                  width: 240,
                  fit: BoxFit.cover,
                  )
              ),
                // backgroundImage: AssetImage('assets/image/cat.jpg'),
            )

        ],


    );
  }
}