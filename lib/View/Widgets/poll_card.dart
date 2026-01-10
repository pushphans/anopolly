import 'package:flutter/material.dart';

class PollCard extends StatefulWidget {
  final String question;
  final String optionA;
  final String optionB;
  final String? optionC;
  final String? optionD;
  const PollCard({
    super.key,
    required this.question,
    required this.optionA,
    required this.optionB,
    this.optionC,
    this.optionD,
  });

  @override
  State<PollCard> createState() => _PollCardState();
}

class _PollCardState extends State<PollCard> {
  String? _selectedOption;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Q: ${widget.question}",
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            RadioListTile<String>(
              title: Text(widget.optionA),
              value: widget.optionA,
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            RadioListTile<String>(
              title: Text(widget.optionB),
              value: widget.optionB,
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            if (widget.optionC != null)
              RadioListTile<String>(
                title: Text(widget.optionC!),
                value: widget.optionC!,
                groupValue: _selectedOption,
                onChanged: (value) {
                  setState(() {
                    _selectedOption = value;
                  });
                },
              ),
            if (widget.optionD != null)
              RadioListTile<String>(
                title: Text(widget.optionD!),
                value: widget.optionD!,
                groupValue: _selectedOption,
                onChanged: (value) {
                  setState(() {
                    _selectedOption = value;
                  });
                },
              ),
          ],
        ),
      ),
    );
  }
}
