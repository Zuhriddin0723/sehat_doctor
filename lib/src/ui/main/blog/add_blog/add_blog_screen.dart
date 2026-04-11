import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gap/flutter_gap.dart';

import '../../../../app_theme/app_colors/app_colors.dart';
import '../../../../app_theme/app_styles/app_styles.dart';

class AddBlogScreen extends StatefulWidget {
  const AddBlogScreen({super.key});

  @override
  State<AddBlogScreen> createState() => _AddBlogScreenState();
}

class _AddBlogScreenState extends State<AddBlogScreen> {
  late QuillController _controller;
  final FocusNode _focusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subtitleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = QuillController.basic();
  }

  @override
  void dispose() {
    _controller.dispose();
    _titleController.dispose();
    _subtitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf5f5f5), // Light gray background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          "Write",
          style: AppStyles.medium16(AppColors.black),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF001E62), // Dark blue
                foregroundColor: Colors.white,
                elevation: 0,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
              child: Text("Publish", style: AppStyles.medium14(Colors.white)),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Gap(10.h),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 20.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// TITLE
                            TextField(
                              controller: _titleController,
                              style: TextStyle(
                                fontSize: 32.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFFC2C9D6),
                              ),
                              decoration: InputDecoration(
                                hintText: "Title",
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  color: const Color(0xFFC2C9D6),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Gap(12.h),

                            /// SUBTITLE
                            TextField(
                              controller: _subtitleController,
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: const Color(0xFFC2C9D6),
                              ),
                              decoration: InputDecoration(
                                hintText: "Subtitle or brief summary...",
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  color: const Color(0xFFC2C9D6),
                                ),
                              ),
                            ),
                            Gap(20.h),

                            /// EDITOR
                            Expanded(
                              child: QuillEditor(
                                controller: _controller,
                                focusNode: _focusNode,
                                scrollController: _scrollController,
                                config: const QuillEditorConfig(
                                  placeholder: "Tell your story...",
                                  autoFocus: false,
                                  expands: true,
                                  padding: EdgeInsets.zero,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// TOOLBAR
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      child: QuillSimpleToolbar(
                        controller: _controller,
                        config: const QuillSimpleToolbarConfig(
                          multiRowsDisplay: false,
                          showFontFamily: false,
                          showFontSize: false,
                          showColorButton: false,
                          showBackgroundColorButton: false,
                          showClearFormat: false,
                          showAlignmentButtons: false,
                          showHeaderStyle: false,
                          showListCheck: false,
                          showCodeBlock: false,
                          showInlineCode: false,
                          showQuote: true,
                          showIndent: false,
                          showLink: true,
                          showUndo: false,
                          showRedo: false,
                          showDirection: false,
                          showSearchButton: false,
                          showSubscript: false,
                          showSuperscript: false,
                          showSmallButton: false,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
