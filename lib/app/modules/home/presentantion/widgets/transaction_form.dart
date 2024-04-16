import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/domain.dart';

class TransactionFormWidget extends StatefulWidget {
  final TransactionEntity? transactionEntity;
  final void Function(TransactionEntity) onEdit;
  final void Function(TransactionEntity) onSubmit;

  const TransactionFormWidget({
    super.key,
    required this.onEdit,
    required this.onSubmit,
    required this.transactionEntity,
  });

  @override
  State<TransactionFormWidget> createState() => _TransactionFormWidgetState();
}

class _TransactionFormWidgetState extends State<TransactionFormWidget> {
  DateTime? _selectedDate = DateTime.now();
  bool get isEdit => widget.transactionEntity != null;
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (isEdit) {
      _titleController.text = widget.transactionEntity!.title!;
      _valueController.text =
          widget.transactionEntity!.value!.toStringAsFixed(2);
      _selectedDate = widget.transactionEntity?.date;
      _dateController.text = DateFormat('dd/MM/yyyy').format(
        _selectedDate ?? DateTime.now(),
      );
    }
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      lastDate: DateTime.now(),
      firstDate: DateTime(2019),
      initialDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
        _dateController.text = DateFormat('dd/MM/yyyy').format(
          pickedDate,
        );
      });
    });
  }

  _submitForm() {
    final transaction = TransactionEntity(
      id: isEdit
          ? widget.transactionEntity?.id
          : Random().nextDouble().toString(),
      title: _titleController.text,
      value: double.tryParse(_valueController.text) ?? 0.0,
      date: _selectedDate!,
    );

    if (transaction.title!.isEmpty || transaction.value! <= 0) return;

    !isEdit ? widget.onSubmit(transaction) : widget.onEdit(transaction);
  }

  @override
  Widget build(BuildContext context) => Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  isEdit ? 'Editar Despesa' : 'Adicionar Despesa',
                  style: const TextStyle(
                    fontSize: 22.0,
                    fontFamily: 'Google',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  onSubmitted: (_) => _submitForm(),
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: 'Título',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  onSubmitted: (_) => _submitForm(),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  controller: _valueController,
                  decoration: InputDecoration(
                    labelText: 'Valor (R\$)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  onSubmitted: (_) => _submitForm(),
                  controller: _dateController,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Data',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                  onTap: _showDatePicker,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: const Text('Salvar Transação'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancelar'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
