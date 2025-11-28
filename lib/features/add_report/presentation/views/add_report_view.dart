import 'package:depi_project/app_theme.dart';
import 'package:depi_project/core/helpers/build_app_bar.dart';
import 'package:depi_project/core/repos/media_repo/media_repo.dart';
import 'package:depi_project/features/add_report/domain/repos/add_report_repo.dart';
import 'package:depi_project/features/add_report/presentation/manager/cubits/add_report_cubit/add_report_cubit.dart';
import 'package:depi_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/get_it_service.dart';
import 'widgets/add_report_view_body_bloc_consumer.dart';

class AddReportView extends StatelessWidget {
  const AddReportView({super.key});
  static const routeName = 'add_report';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            AddReportCubit(getIt.get<MediaRepo>(), getIt.get<AddReportRepo>()),
        child: const AddReportViewBodyBlocBuilder(),
      ),
      backgroundColor: AppTheme.white,
      appBar: buildAppBar(title: S.of(context).submitReport),
    );
  }
}
