import 'dart:developer';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:depi_project/core/helpers/build_snack_bar.dart';
import 'package:depi_project/features/add_report/presentation/manager/cubits/add_report_cubit/add_report_cubit.dart';
import 'package:depi_project/features/add_report/presentation/views/widgets/add_report_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AddReportViewBodyBlocBuilder extends StatelessWidget {
  const AddReportViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddReportCubit, AddReportState>(
      listener: (context, state) {
        if (state is AddReportFailure) {
          log(state.error);
          buildSnackBar(
            context: context,
            title: 'خطا',
            message: 'فشل في اضافة البلاغ',
            contentType: ContentType.failure,
          );
        }
        if (state is AddReportSuccess) {
          Navigator.pop(context);
          buildSnackBar(
            context: context,

            title: 'نجاح',
            message: 'تم اضافة البلاغ بنجاح',
            contentType: ContentType.success,
          );
        }
      },
      builder: (context, state) {
        return Skeletonizer(
          enabled: state is AddReportLoading,
          enableSwitchAnimation: true,
          child: const AddReportViewBody(),
        );
      },
    );
  }
}
