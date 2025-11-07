import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:depi_project/core/entities/report_entity.dart';
import 'package:depi_project/core/helpers/get_user.dart';
import 'package:depi_project/features/reports/presentation/manager/cubit/reports_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetUserReportsCubit extends Cubit<GetUserReportsState> {
  GetUserReportsCubit() : super(GetUserReportsInitial());

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> fetchUserReports() async {
    try {
      emit(GetUserReportsLoading());
      final currentUser = await getUser();
      final userId = currentUser?.uId ?? '';

      if (userId.isEmpty) {
        emit(GetUserReportsError("User ID is missing"));
        return;
      }

      log("Fetching reports for user: $userId");

      final querySnapshot = await _firestore
          .collection('reports')
          .where('userId', isEqualTo: userId)
          .get();

      log("Query returned ${querySnapshot.docs.length} documents");

      final reports = querySnapshot.docs.map((doc) {
        final data = doc.data();

        if (data['createdAt'] is String) {
          try {
            data['createdAt'] = Timestamp.fromDate(DateTime.parse(data['createdAt']));
          } catch (e) {
            print("Failed to parse createdAt: $e");
          }
        }
        if (data['updatedAt'] is String) {
          try {
            data['updatedAt'] = Timestamp.fromDate(DateTime.parse(data['updatedAt']));
          } catch (e) {
            print("Failed to parse updatedAt: $e");
          }
        }

        return ReportEntity.fromJson(data);
      }).toList();

      emit(GetUserReportsSuccess(reports));
    } catch (e) {
      emit(GetUserReportsError(e.toString()));
    }
  }
}
