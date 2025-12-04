import 'dart:developer';

import 'package:depi_project/core/theme/app_theme.dart';
import 'package:depi_project/core/entities/report_entity.dart';
import 'package:depi_project/features/reports/presentation/manager/cubit/reports_cubit.dart';
import 'package:depi_project/features/reports/presentation/manager/cubit/reports_state.dart';
import 'package:depi_project/features/reports/presentation/widgets/report_detail_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/build_app_bar.dart';

class RepportsBody extends StatefulWidget {
  const RepportsBody({super.key});

  @override
  State<RepportsBody> createState() => _RepportsBodyState();
}

class _RepportsBodyState extends State<RepportsBody> {
  final List<ReportEntity> reports = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: buildAppBar( context, title: 'بلاغاتي'),
      body: BlocProvider(
        create: (_) => GetUserReportsCubit()..listenToUserReports(),
        child: BlocBuilder<GetUserReportsCubit, GetUserReportsState>(
          builder: (context, state) {
            if (state is GetUserReportsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetUserReportsError) {
              log(state.message);
              return Center(
                child: Text(
                  'حدث خطأ أثناء تحميل البلاغات:\n${state.message}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16, color: Colors.red),
                ),
              );
            } else if (state is GetUserReportsSuccess) {
              if (state.reports.isEmpty) {
                return const Center(
                  child: Text(
                    'لا توجد بلاغات لهذا المستخدم.',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                );
              }

              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.reports.length,
                itemBuilder: (context, index) {
                  final report = state.reports[index];
                  return ReportDetailCard(data: report);
                },
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
