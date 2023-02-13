import 'dart:io';

import 'package:mongo_dart/mongo_dart.dart';
import "constants.dart";

class MongoDatabase {
  static connect() async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    var collection = db.collection(COLLECTION_NAME);
    // print(await collection.find().toList());
    // await collection.update(where.eq("Name", "Vishnu  Nadella"), modify.set("age", "21"));
  }
}

searchInDb(String uid, String phone) async {
  var db = await Db.create(MONGO_URL);

  await db.open();
  var collection = db.collection(COLLECTION_NAME);
  print("uid $uid and phone $phone $COLLECTION_NAME");
  var res = await collection.findOne({"uid": uid});

  if (res != null) {
    late bool attended;
    late String phone_no;
    late String name;
    for (var entry in res.entries) {
      print(entry.key);
      print(entry.value);

      if (entry.key == "name") {
        name = entry.value;
      }
      if (entry.key == "phone_no") {
        phone_no = entry.value;
      }
      if (entry.key == "attended") {
        attended = entry.value;
      }

      // if (entry.key == "attended") {
      //   if (entry.value == false) {
      //     await collection.update(
      //         where.eq("uid", uid), modify.set("attended", true));
      //     await collection.update(where.eq("uid", uid),
      //         modify.set("date_time_of_scan", DateTime.now().toString()));
      //     await db.close();
      //     return ["true", res["name"]];
      //   } else if (entry.value == true) {
      //     return ["false", res["name"]];
      //   }
      // }
    }
    if (!attended) {
      await collection.update(
          where.eq("uid", uid), modify.set("attended", true));
      await collection.update(where.eq("uid", uid),
          modify.set("date_time_of_scan", DateTime.now().toString()));
      await db.close();
      return ["true", name];
    } else if (attended) {
      await db.close();
      return ["false", name];
    }
  } else {
    await db.close();
    return ["Dosen't Exist", "none"]; // No record in db
  }

  // if (res["phone_no"] == phone && res["attended"] == false) {
  //   await collection.update(where.eq("uid", uid.trim()), modify.set("attended", true));
  //   await collection.update(where.eq("uid", uid),
  //       modify.set("date_time_of_scan", DateTime.now().toString()));
  //   await db.close();
  //   return ["true", res["name"]];
  // } else if (res["phone"] == phone && res["attended"] == true) {
  //   await db.close();
  //   return ["false", res["name"]]; // means duplicate
  // } else {
  //   return ["Dosen't Exist", "none"]; // No record in db
  // }

  return ['a', 'b'];
}

// class MongoDatabase {
//   static connect() async {
//     var db = await Db.create(MONGO_URL);
//     await db.open();
//     // await db.useDb();
//     // inspect(db);
//     var status = db.serverStatus();
//     var collection = db.collection(COLLECTION_NAME);
//     // await collection.insertOne({
//     //   "Name" : "Vishnu Sai Nadella",
//     //   "age" : 20,
//     // });
//     print("MongoDB Database ");
//     print(await collection.find().toList());
//     await collection.update(where.eq("Name", "Vishnu  Nadella"), modify.set("age", "21"));
//   }
// }
