import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jobportal/models/job_model.dart';
import 'package:jobportal/pages/home/widgets/cardJob_widget.dart';
import 'package:jobportal/pages/home/widgets/head_widget.dart';
import 'package:jobportal/pages/home/widgets/menusFilter_widget.dart';
import 'package:jobportal/pages/home/widgets/textFormFilter_widget.dart';
import 'package:jobportal/pages/home/widgets/titleFind_widget.dart';
import 'package:jobportal/store/list.store.dart';
import 'package:jobportal/store/menus.store.dart';
import 'package:jobportal/utils/colors.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  Stream<List<JobModel>> readJobs() {
    return FirebaseFirestore.instance
        .collection('jobs')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((e) => JobModel.fromJson(e.data())).toList();
    });
  }

  final menuStore = MenusStore();
  final listStore = ListStore();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Head(),
                const TitleFind(),
                MenusFilter(menuStore: menuStore),
                TextFormFilter(size: size, listStore: listStore),
                SizedBox(
                  height: size.height * 0.62,
                  child: StreamBuilder<List<JobModel>>(
                    stream: readJobs(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        listStore.listJobs = snapshot.data;
                        if (listStore.listFilter!.isEmpty) {
                          listStore.listFilter = listStore.listJobs;
                        }
                        return CardJob(size: size, listStore: listStore);
                      } else {
                        return const Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
