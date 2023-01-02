import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobportal/models/job_model.dart';
import 'package:jobportal/pages/job_detail_page.dart';
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hello, Welcome',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.rocket,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                Text(
                  'Find Jobs',
                  style: GoogleFonts.poppins(fontSize: 40, color: Colors.white),
                ),
                SizedBox(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      for (var item in menuStore.menus)
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => menuStore.changeSelectedMenu(item),
                              child: Observer(builder: (context) {
                                return Container(
                                  height: 43,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: menuStore.selectedMenu == item
                                        ? const Color(0xff5424FD)
                                        : const Color(0xffD5D5D5),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      item,
                                      style: GoogleFonts.poppins(
                                        color: menuStore.selectedMenu == item
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                            Container(
                              height: 10,
                              width: 15,
                              color: Colors.grey,
                            )
                          ],
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          height: 50,
                          width: size.width * 0.6,
                          decoration: const BoxDecoration(
                            color: Color(0xff2B2B2B),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: TextFormField(
                            controller: listStore.controllerInput,
                            style: GoogleFonts.poppins(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'Search for company or roles..',
                              hintStyle: GoogleFonts.poppins(
                                color: Colors.white30,
                                fontSize: 12,
                              ),
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 25),
                      GestureDetector(
                        onTap: () {
                          listStore.setFilter(listStore.controllerInput.text);
                        },
                        child: Container(
                          height: 50,
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: Color(0xff2B2B2B),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: const Icon(
                            Icons.filter_alt,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                StreamBuilder<List<JobModel>>(
                  stream: readJobs(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      listStore.listJobs = snapshot.data;
                      if (listStore.listFilter!.isEmpty) {
                        listStore.listFilter = listStore.listJobs;
                      }
                      return Observer(builder: (context) {
                        return SizedBox(
                          height: size.height * 0.6,
                          child: ListView(
                            children: listStore.listFilter!
                                .map(
                                  (job) => GestureDetector(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            JobDetailPage(job: job),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: job.color,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(25),
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            ListTile(
                                              title: Text(
                                                job.title,
                                                style: GoogleFonts.poppins(
                                                  color: job.textColor,
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              subtitle: Text(
                                                job.subtitle,
                                                style: GoogleFonts.poppins(
                                                  color: job.textColor,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              leading: Container(
                                                padding:
                                                    const EdgeInsets.all(15),
                                                decoration: const BoxDecoration(
                                                  color: backgroundColor,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),
                                                ),
                                                child: const Icon(
                                                  Icons.people,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          horizontal: 10,
                                                          vertical: 2,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: job
                                                              .secondaryColor,
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .all(
                                                            Radius.circular(15),
                                                          ),
                                                          border: Border.all(
                                                            color:
                                                                job.textColor,
                                                            width: 1,
                                                          ),
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      right: 5),
                                                              child: Icon(
                                                                Icons
                                                                    .location_on,
                                                                color: job
                                                                    .textColor,
                                                                size: 20,
                                                              ),
                                                            ),
                                                            Text(
                                                              job.location,
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                color: job
                                                                    .textColor,
                                                                fontSize: 12,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 10),
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                            horizontal: 10,
                                                            vertical: 2,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: job
                                                                .secondaryColor,
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  15),
                                                            ),
                                                            border: Border.all(
                                                              color:
                                                                  job.textColor,
                                                              width: 1,
                                                            ),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        right:
                                                                            5),
                                                                child: Icon(
                                                                  Icons.school,
                                                                  color: job
                                                                      .textColor,
                                                                  size: 20,
                                                                ),
                                                              ),
                                                              Text(
                                                                '${job.experience} years',
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  color: job
                                                                      .textColor,
                                                                  fontSize: 12,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          horizontal: 10,
                                                          vertical: 2,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: job
                                                              .secondaryColor,
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .all(
                                                            Radius.circular(15),
                                                          ),
                                                          border: Border.all(
                                                            color:
                                                                job.textColor,
                                                            width: 1,
                                                          ),
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      right: 5),
                                                              child: Icon(
                                                                Icons.schedule,
                                                                color: job
                                                                    .textColor,
                                                                size: 20,
                                                              ),
                                                            ),
                                                            Text(
                                                              job.timeJob,
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                color: job
                                                                    .textColor,
                                                                fontSize: 12,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Text(
                                                    job.description,
                                                    textAlign: TextAlign.start,
                                                    style: GoogleFonts.poppins(
                                                      color: job.textColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.all(15),
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(25),
                                                  bottomRight:
                                                      Radius.circular(25),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 5),
                                                        child: Icon(
                                                          Icons.update,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Posted ${DateTime.now().day - job.date.day} day ago',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          color: Colors.black,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Text(
                                                    '\$${job.salary}K/mo',
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        );
                      });
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
