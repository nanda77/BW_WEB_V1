import 'package:flutter/material.dart';

class Email {
  final String image, name, subject, body, person;
  final bool isAttachmentAvailable, isChecked;
  final Color tagColor;
  final double time;

  Email({
    this.time,
    this.isChecked,
    this.image,
    this.name,
    this.subject,
    this.body,
    this.isAttachmentAvailable,
    this.tagColor,
    this.person,
  });
}

List<Email> emails = List.generate(
  demo_data.length,
  (index) => Email(
    name: demo_data[index]['name'],
    image: demo_data[index]['image'],
    subject: demo_data[index]['subject'],
    isAttachmentAvailable: demo_data[index]['isAttachmentAvailable'],
    isChecked: demo_data[index]['isChecked'],
    tagColor: demo_data[index]['tagColor'],
    time: demo_data[index]['time'],
    person: demo_data[index]['person'],
    body: emailDemoText,
  ),
);

// ignore: non_constant_identifier_names
List demo_data = [
  {
    "name": "Block A/Slab/Floor 1/Unit A (4NE)",
    "person": "Nalanda Neeraj N",
    "image": "assets/images/user_1.png",
    "subject": "18 Nov 20 - 27 Nov 20",
    "isAttachmentAvailable": false,
    "isChecked": true,
    "tagColor": null,
    "time": 70,
  },
  {
    "name": "Block A/Slab/Floor 1/Unit B (6C)",
    "person": "Nalanda Neeraj N",
    "image": "assets/images/user_2.png",
    "subject": "No planned date",
    "isAttachmentAvailable": true,
    "isChecked": false,
    "tagColor": null,
    "time": 100
  },
  {
    "name": "Block A/Electrical/Floor 1/Unit C (4SW)",
    "person": "Nalanda Neeraj N",
    "image": "assets/images/user_3.png",
    "subject": "28 Nov 20 - 07 Dec 20",
    "isAttachmentAvailable": true,
    "isChecked": false,
    "tagColor": null,
    "time": 27,
  },
  {
    "name": "Block A/Slab/Floor 6/Unit D (8FE)",
    "person": "Nalanda Neeraj N",
    "image": "assets/images/user_4.png",
    "subject": "18 Nov 20 - ",
    "isAttachmentAvailable": false,
    "isChecked": true,
    "tagColor": Color(0xFF23CF91),
    "time": 43
  },
  {
    "name": "Block A/Slab/Floor 1/Unit A (4NE)",
    "person": "Nalanda Neeraj N",
    "image": "assets/images/user_5.png",
    "subject": "No planned date",
    "isAttachmentAvailable": false,
    "isChecked": false,
    "tagColor": Color(0xFF3A6FF7),
    "time": 18
  }
];

String emailDemoText =
    "Corporis illo provident. Sunt omnis neque et aperiam. Nemo ut dolorum fugit eum sed. Corporis illo provident. Sunt omnis neque et aperiam. Nemo ut dolorum fugit eum sed. Corporis illo provident. Sunt omnis neque et aperiam. Nemo ut dolorum fugit eum sed";
