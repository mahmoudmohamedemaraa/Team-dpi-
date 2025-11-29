import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:depi_project/app_theme.dart';
import 'package:depi_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../../../../core/entities/report_entity.dart';
import '../../../../../core/helpers/build_snack_bar.dart';
import '../../../../../core/helpers/get_user.dart';
import '../../../../../core/helpers/media_manager.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../manager/cubits/add_report_cubit/add_report_cubit.dart';
import 'media_picker_section.dart';

class AddReportViewBody extends StatefulWidget {
  const AddReportViewBody({super.key});

  @override
  State<AddReportViewBody> createState() => _AddReportViewBodyState();
}

class _AddReportViewBodyState extends State<AddReportViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final MediaManager mediaManager = MediaManager();

  late String title;
  late String description;
  String? address;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              // Title field
              CustomTextField(
                onSaved: (value) {
                  title = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).enterReportTitle;
                  } else if (value.length < 5) {
                    return S.of(context).reportTitleAtLeast5;
                  }
                  return null;
                },
                labelText: S.of(context).reporTitle,
                hintText: S.of(context).reportEx,
                obscureText: false,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 16),

              // Description field
              CustomTextField(
                onSaved: (value) {
                  description = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).enterReportDescription;
                  } else if (value.length < 10) {
                    return S.of(context).reportDescriptionAtLeast10;
                  }
                  return null;
                },
                labelText: S.of(context).reportDescription,
                hintText: S.of(context).writeReportDescription,
                obscureText: false,
                keyboardType: TextInputType.multiline,
                maxLines: 5,
              ),
              const SizedBox(height: 16),

              // Location field (optional)
              CustomTextField(
                onSaved: (value) {
                  address = value?.isEmpty == true ? null : value;
                },
                validator: (value) => null,
                labelText: S.of(context).location,
                hintText: S.of(context).locationEx,
                obscureText: false,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 24),

              // Media Section
              MediaPickerSection(
                mediaManager: mediaManager,
                onMediaChanged: () => setState(() {}),
              ),
              const SizedBox(height: 16),

              CustomButton(
                onPressed: () {
                  if (mediaManager.isNotEmpty) {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      final user = getUser();
                      ReportEntity reportEntity = ReportEntity(
                        reportId: const Uuid().v4(),
                        title: title,
                        description: description,
                        userId: user.uId,
                        mediaUrls: [],
                        createdAt: DateTime.now(),
                        updatedAt: DateTime.now(),
                        address: address,
                        adminComment: null,
                      );
                      context.read<AddReportCubit>().addReport(
                        reportEntity,
                        mediaManager.selectedMedia,
                      );
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  } else {
                    buildSnackBar(
                      context: context,
                      title: S.of(context).alert,
                      message: S.of(context).mustAddMedia,
                      contentType: ContentType.warning,
                    );
                  }
                },
                text: S.of(context).sendingReport,
                // gradientColors: AppTheme.primaryGradientColors,
                // shadowColor: AppTheme.primaryShadowColor,
                backgroundColor: AppTheme.primaryColor,
                hasShadow: false,
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
