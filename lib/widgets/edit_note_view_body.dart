import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/helper/show_snack_bar.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_form_field.dart';
import 'package:notes_app/widgets/edit_note_colors_list_view.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            CustomAppBar(
              text: 'Edit Note',
              icon: Icons.check,
              onPressed: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.subTitle = subTitle ?? widget.note.subTitle;
                widget.note.save();

                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                showSnackBar(
                    context,
                    "Changes saved! Your note is now updated.",
                    widget.note.color);
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 50,
            ),
            CustomTextFormField(
              onChanged: (value) {
                title = value;
              },
              hint: widget.note.title,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextFormField(
              onChanged: (value) {
                subTitle = value;
              },
              hint: widget.note.subTitle,
              maxLines: 5,
            ),
            const SizedBox(
              height: 32,
            ),
            EditNoteColorsList(note: widget.note),
          ],
        ),
      ),
    );
  }
}
