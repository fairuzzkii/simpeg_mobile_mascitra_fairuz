import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class PilihTanggalScreen extends StatefulWidget {
  const PilihTanggalScreen({super.key});

  @override
  State<PilihTanggalScreen> createState() => _PilihTanggalScreenState();
}

class _PilihTanggalScreenState extends State<PilihTanggalScreen> {
  DateTime? _tanggalMulai;
  DateTime? _tanggalBerakhir;
  String _calendarType = ''; // 'start' or 'end'
  DateTime? _tempSelectedDate; // Temporary selected date

  void _showDatePickerDialog({required bool isStartDate}) {
    setState(() {
      _calendarType = isStartDate ? 'start' : 'end';
      _tempSelectedDate = null; // Reset temporary selection
    });

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFFC64304),
                      width: 2,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TableCalendar(
                        focusedDay: DateTime.now(),
                        firstDay: DateTime(2000),
                        lastDay: DateTime(2100),
                        selectedDayPredicate: (day) {
                          return _tempSelectedDate != null &&
                              isSameDay(_tempSelectedDate!, day);
                        },
                        onDaySelected: (selectedDay, focusedDay) {
                          setDialogState(() {
                            _tempSelectedDate = selectedDay;
                          });
                        },
                        calendarStyle: CalendarStyle(
                          outsideDaysVisible: false,
                          weekendTextStyle: const TextStyle(color: Colors.black),
                          holidayTextStyle: const TextStyle(color: Colors.black),
                          defaultTextStyle: const TextStyle(color: Colors.black),
                          todayDecoration: BoxDecoration(
                            color: const Color(0xFFC64304).withOpacity(0.3),
                            shape: BoxShape.circle,
                          ),
                          selectedDecoration: const BoxDecoration(
                            color: Color(0xFFC64304),
                            shape: BoxShape.circle,
                          ),
                          selectedTextStyle: const TextStyle(color: Colors.white),
                          todayTextStyle: const TextStyle(color: Colors.white),
                        ),
                        headerStyle: HeaderStyle(
                          formatButtonVisible: false,
                          titleCentered: true,
                          leftChevronIcon: const Icon(
                            Icons.chevron_left,
                            color: Color(0xFFC64304),
                          ),
                          rightChevronIcon: const Icon(
                            Icons.chevron_right,
                            color: Color(0xFFC64304),
                          ),
                          titleTextStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        daysOfWeekStyle: const DaysOfWeekStyle(
                          weekdayStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          weekendStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _tempSelectedDate != null
                            ? () {
                                _selectDate(_tempSelectedDate!);
                                Navigator.pop(context);
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _tempSelectedDate != null
                              ? const Color(0xFFC64304)
                              : Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "Choose Date",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _selectDate(DateTime selectedDate) {
    if (_calendarType == 'start') {
      setState(() {
        _tanggalMulai = selectedDate;
        if (_tanggalBerakhir != null &&
            _tanggalBerakhir!.isBefore(selectedDate)) {
          _tanggalBerakhir = null;
        }
      });
    } else {
      if (_tanggalMulai != null && selectedDate.isBefore(_tanggalMulai!)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Tanggal berakhir tidak boleh kurang dari tanggal mulai',
            ),
            backgroundColor: Color(0xFFC64304),
          ),
        );
      } else {
        setState(() {
          _tanggalBerakhir = selectedDate;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).padding.top + 80,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Grey.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () {
                        if (_tanggalMulai != null && _tanggalBerakhir != null) {
                          Navigator.pop(context, {
                            'startDate': _tanggalMulai,
                            'endDate': _tanggalBerakhir,
                          });
                        } else {
                          Navigator.pop(context);
                        }
                      },
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    const SizedBox(width: 0),
                    const Text(
                      'Pilih Tanggal',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          GestureDetector(
            onTap: () => _showDatePickerDialog(isStartDate: true),
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.calendar_today,
                      color: Color(0xFFC64304),
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Text(
                              'Tanggal Mulai',
                              style: TextStyle(
                                color: Color(0xFFC64304),
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(width: 8),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _tanggalMulai == null
                              ? 'Pilih Tanggal'
                              : '${_tanggalMulai!.day}/${_tanggalMulai!.month}/${_tanggalMulai!.year}',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.expand_more, color: Color(0xFFC64304), size: 20),
                ],
              ),
            ),
          ),

          GestureDetector(
            onTap: () => _showDatePickerDialog(isStartDate: false),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.calendar_today,
                      color: Color(0xFFC64304),
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Text(
                              'Tanggal Berakhir',
                              style: TextStyle(
                                color: Color(0xFFC64304),
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(width: 8),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _tanggalBerakhir == null
                              ? 'Pilih Tanggal'
                              : '${_tanggalBerakhir!.day}/${_tanggalBerakhir!.month}/${_tanggalBerakhir!.year}',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.expand_more, color: Color(0xFFC64304), size: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}