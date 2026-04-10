import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class AddBlogScreen extends StatefulWidget {
  const AddBlogScreen({super.key});

  @override
  State<AddBlogScreen> createState() => _AddBlogScreenState();
}

class _AddBlogScreenState extends State<AddBlogScreen> {
  late QuillController _controller;
  final FocusNode _focusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller = QuillController.basic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Bu parametr klaviatura chiqqanda UI siqilishini ta'minlaydi
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFFF2F2F7), // Oqish-kulrang fon
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          "Write",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF002366), // To'q ko'k
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text("Publish"),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            /// ASOSIY MATN MAYDONI
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    /// TITLE
                    TextField(
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey.shade200,
                      ),
                      decoration: const InputDecoration(
                        hintText: "Title",
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Color(0xFFC7C7CD)),
                      ),
                    ),

                    /// SUBTITLE
                    TextField(
                      style: const TextStyle(fontSize: 18),
                      decoration: const InputDecoration(
                        hintText: "Subtitle or brief summary...",
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Color(0xFFC7C7CD)),
                      ),
                    ),

                    const SizedBox(height: 10),

                    /// EDITOR (Tell your story...)
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

            /// TOOLBAR (Klaviatura ustida yoki ekran pastida)
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Colors.grey.shade200)),
              ),
              child: QuillSimpleToolbar(
                controller: _controller,
                config: const QuillSimpleToolbarConfig(
                  // Toolbar ko'rinishini rasmga moslash
                  showFontSize: false,
                  showFontFamily: false,
                  showColorButton: false,
                  showBackgroundColorButton: false,
                  showAlignmentButtons: false,
                  showSearchButton: false,
                  showSubscript: false,
                  showSuperscript: false,
                  showSmallButton: false,
                  showDirection: false,
                  multiRowsDisplay: false,
                  // Faqat rasmda borlarini qoldirish mumkin
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}