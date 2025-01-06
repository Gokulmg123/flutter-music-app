//import 'package:flutter/foundation.dart';
import 'package:lyrica/models/category.dart';

class CategoryOperations{
CategoryOperations._(){}
  static List<Catagory> getCatagories(){
    return <Catagory>[
      Catagory('Top songs','https://is1-ssl.mzstatic.com/image/thumb/Purple126/v4/44/17/3c/44173c67-fc77-2bc3-a54e-c275c89f71bd/AppIcon-0-1x_U007emarketing-0-7-0-85-220.png/256x256bb.jpg'),
      Catagory('MJ hits','https://is1-ssl.mzstatic.com/image/thumb/Purple71/v4/d1/ba/85/d1ba8582-972e-7e02-6f3b-cc47adfc055f/source/256x256bb.jpg'),
      Catagory('Cool music','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1TleMEyJH_f3SDd12PKHgkMYv4CdFvz1WkcTAIWrHs8E2nMaqxnY7pR4xmbZqzJ6-2cc&usqp=CAU'),

 Catagory('Romantic', 'https://is1-ssl.mzstatic.com/image/thumb/Purple20/v4/0b/89/79/0b8979c3-4fab-dfaa-87c8-57c73cdbfc8b/source/256x256bb.jpg'),
  Catagory('Sleep', 'https://images.stockcake.com/public/6/3/5/6352be0a-f3ba-46bf-a9e0-588a8242af43_medium/vibrant-audio-escape-stockcake.jpg'),
   Catagory('Party', 'https://images.stockcake.com/public/8/e/4/8e4c6219-c05a-4422-ac6d-af0b5a8b8fe9_medium/vibrant-music-event-stockcake.jpg'),
    ];

  }

}