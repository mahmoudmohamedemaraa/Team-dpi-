import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:depi_project/core/entities/report_entity.dart';
import 'package:depi_project/core/helpers/get_user.dart';
import 'package:depi_project/features/reports/presentation/manager/cubit/reports_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetUserReportsCubit extends Cubit<GetUserReportsState> {
  GetUserReportsCubit() : super(GetUserReportsInitial());
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? _subscription;

  void listenToUserReports() async {
    try {
      emit(GetUserReportsLoading());
      final currentUser = await getUser();
      final userId = currentUser.uId;

      if (userId.isEmpty) {
        emit(GetUserReportsError("User ID is missing"));
        return;
      }

      log("Listening to reports for user: $userId");

      await _subscription?.cancel();

      final query = _firestore
          .collection('reports')
          .where('userId', isEqualTo: userId)
          .orderBy('createdAt', descending: true);

      _subscription = query.snapshots().listen(
        (querySnapshot) {
          try {
            final reports = querySnapshot.docs.map((doc) {
              final data = Map<String, dynamic>.from(doc.data());

              if (data['createdAt'] is String) {
                try {
                  data['createdAt'] = Timestamp.fromDate(
                    DateTime.parse(data['createdAt']),
                  );
                } catch (e) {
                  log("Failed to parse createdAt: $e");
                }
              }
              if (data['updatedAt'] is String) {
                try {
                  data['updatedAt'] = Timestamp.fromDate(
                    DateTime.parse(data['updatedAt']),
                  );
                } catch (e) {
                  log("Failed to parse updatedAt: $e");
                }
              }

              return ReportEntity.fromJson(data);
            }).toList();

            emit(GetUserReportsSuccess(reports));
          } catch (e) {
            emit(GetUserReportsError(e.toString()));
          }
        },
        onError: (err) {
          emit(GetUserReportsError(err.toString()));
        },
      );
    } catch (e) {
      emit(GetUserReportsError(e.toString()));
    }
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
