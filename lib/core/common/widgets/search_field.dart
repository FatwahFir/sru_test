import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sru_test/core/extensions/context_extension.dart';

class SearchField extends StatefulWidget {
  final Function(String) onSearch;

  const SearchField({super.key, required this.onSearch});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: context.bodyMedium,
      keyboardType: TextInputType.text,
      onSaved: (newValue) => widget.onSearch(newValue!),
      controller: _controller,
      onFieldSubmitted: widget.onSearch, // Ketika user tekan enter
      decoration: InputDecoration(
        hintText: 'Type something...',
        hintStyle: context.bodyMedium.copyWith(color: Color(0xffA5A8A9)),
        filled: true,
        fillColor: Color(0xffF3F5F6),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide.none,
        ),
        suffixIcon: IconButton(
          icon: Icon(Iconsax.search_normal, color: context.primary),
          onPressed: () {
            FocusScope.of(context).unfocus();
            widget.onSearch(_controller.text);
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
