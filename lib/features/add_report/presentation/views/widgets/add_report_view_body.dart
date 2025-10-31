import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:depi_project/app_theme.dart';
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
                    return 'برجاء إدخال عنوان البلاغ';
                  } else if (value.length < 5) {
                    return 'عنوان البلاغ يجب أن يكون 5 أحرف على الأقل';
                  }
                  return null;
                },
                labelText: 'عنوان البلاغ',
                hintText: 'مثال: سرقة محل تجاري',
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
                    return 'برجاء إدخال وصف البلاغ';
                  } else if (value.length < 10) {
                    return 'وصف البلاغ يجب أن يكون 10 أحرف على الأقل';
                  }
                  return null;
                },
                labelText: 'وصف البلاغ',
                hintText: 'اكتب تفاصيل البلاغ بالكامل...',
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
                labelText: 'الموقع (اختياري)',
                hintText: 'مثال: شارع الجمهورية، القاهرة',
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
                      title: 'تنبيه',
                      message: 'يجب إضافة صورة أو فيديو واحد على الأقل',
                      contentType: ContentType.warning,
                    );
                  }
                },
                text: 'إرسال البلاغ',
                gradientColors: AppTheme.primaryGradientColors,
                shadowColor: AppTheme.primaryShadowColor,
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
