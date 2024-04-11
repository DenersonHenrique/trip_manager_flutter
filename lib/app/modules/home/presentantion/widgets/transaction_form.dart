import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class TransactionFormWidget extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  const TransactionFormWidget({
    super.key,
    required this.onSubmit,
  });

  @override
  State<TransactionFormWidget> createState() => _TransactionFormWidgetState();
}

class _TransactionFormWidgetState extends State<TransactionFormWidget> {
  DateTime? _selectedDate = DateTime.now();
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;
    if (title.isEmpty || value <= 0) return;
    widget.onSubmit(title, value, _selectedDate!);
  }

  @override
  Widget build(BuildContext context) => Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              TextField(
                onSubmitted: (_) => _submitForm(),
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Título'),
              ),
              TextField(
                onSubmitted: (_) => _submitForm(),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                controller: _valueController,
                decoration: const InputDecoration(labelText: 'Valor (R\$)'),
              ),
              SizedBox(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'Nenhuma data selecionada.'
                            : 'Data Selecionada: ${DateFormat('dd/MM/y').format(
                                _selectedDate!,
                              )}',
                      ),
                    ),
                    TextButton(
                      onPressed: _showDatePicker,
                      child: const Text(
                        'Data Selecionada',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: const Text('Salvar Transação'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
