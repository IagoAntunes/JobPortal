import 'package:flutter/material.dart';
import 'package:jobportal/models/job_model.dart';
import 'package:mobx/mobx.dart';

part 'list.store.g.dart';

class ListStore = _ListStore with _$ListStore;

abstract class _ListStore with Store {
  @observable
  List<JobModel>? listFilter = [];
  List<JobModel>? listJobs = [];

  @observable
  String search = "";

  @observable
  TextEditingController controllerInput = TextEditingController();

  @action
  void setFilter(String value) {
    listFilter = [];
    for (var element in listJobs!) {
      if (element.title.toUpperCase().contains(value.toUpperCase()) ||
          element.subtitle.toUpperCase().contains(value.toUpperCase()) ||
          element.location.toUpperCase().contains(value.toUpperCase())) {
        listFilter!.add(element);
      }
    }
  }
}
