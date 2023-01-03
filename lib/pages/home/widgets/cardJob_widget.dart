import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../store/list.store.dart';
import '../../../utils/colors.dart';
import '../../jobDetail/job_detail_page.dart';

class CardJob extends StatelessWidget {
  const CardJob({
    super.key,
    required this.size,
    required this.listStore,
  });

  final Size size;
  final ListStore listStore;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return SizedBox(
          height: size.height * 0.6,
          child: ListView(
            children: listStore.listFilter!
                .map(
                  (job) => GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => JobDetailPage(job: job),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
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
                                height: 55,
                                width: 60,
                                padding: const EdgeInsets.all(15),
                                decoration: const BoxDecoration(
                                  color: backgroundColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Image.network(
                                  job.image,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return const CircularProgressIndicator(
                                      color: Colors.white,
                                    );
                                  },
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: job.secondaryColor,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                          border: Border.all(
                                            color: job.textColor,
                                            width: 1,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 5),
                                              child: Icon(
                                                Icons.location_on,
                                                color: job.textColor,
                                                size: 20,
                                              ),
                                            ),
                                            Text(
                                              job.location,
                                              style: GoogleFonts.poppins(
                                                color: job.textColor,
                                                fontSize: 12,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            color: job.secondaryColor,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                            border: Border.all(
                                              color: job.textColor,
                                              width: 1,
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 5),
                                                child: Icon(
                                                  Icons.school,
                                                  color: job.textColor,
                                                  size: 20,
                                                ),
                                              ),
                                              Text(
                                                '${job.experience} years',
                                                style: GoogleFonts.poppins(
                                                  color: job.textColor,
                                                  fontSize: 12,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: job.secondaryColor,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                          border: Border.all(
                                            color: job.textColor,
                                            width: 1,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 5),
                                              child: Icon(
                                                Icons.schedule,
                                                color: job.textColor,
                                                size: 20,
                                              ),
                                            ),
                                            Text(
                                              job.timeJob,
                                              style: GoogleFonts.poppins(
                                                color: job.textColor,
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
                                  bottomLeft: Radius.circular(25),
                                  bottomRight: Radius.circular(25),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child: Icon(
                                          Icons.update,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        'Posted ${DateTime.now().day - job.date.day} day ago',
                                        style: GoogleFonts.poppins(
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
                                      fontWeight: FontWeight.w600,
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
      },
    );
  }
}
