import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class DatePickerPage extends StatefulWidget {
  final String? initialDate;
  
  const DatePickerPage({super.key, this.initialDate});

  @override
  State<DatePickerPage> createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
  DateTime? selectedDate;
  DateTime? _tempSelectedDate; // Temporary selected date for dialog

  @override
  void initState() {
    super.initState();
    // Convert initial date string to DateTime if provided
    if (widget.initialDate != null && widget.initialDate!.isNotEmpty && widget.initialDate != 'Tidak Ada Data') {
      try {
        final parts = widget.initialDate!.split('/');
        if (parts.length == 3) {
          selectedDate = DateTime(
            int.parse(parts[2]), // year
            int.parse(parts[1]), // month
            int.parse(parts[0]), // day
          );
        }
      } catch (e) {
        selectedDate = null;
      }
    }
  }

  void _showDatePickerDialog() {
    setState(() {
      _tempSelectedDate = selectedDate; // Initialize with current selected date
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
                        focusedDay: selectedDate ?? DateTime.now(),
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
                                setState(() {
                                  selectedDate = _tempSelectedDate;
                                });
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
                          "Pilih Tanggal",
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

  String _formatDate(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header
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
                      onPressed: () => Navigator.pop(context),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    const SizedBox(width: 8),
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

          // Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Date Selection Container - Updated design to match PilihTanggalScreen
                  GestureDetector(
                    onTap: _showDatePickerDialog,
                    child: Container(
                      width: double.infinity,
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
                                const Text(
                                  'Pilih Tanggal Kegiatan',
                                  style: TextStyle(
                                    color: Color(0xFFC64304),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  selectedDate != null ? _formatDate(selectedDate!) : 'Pilih Tanggal',
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

                  const Spacer(),

                  // Confirm Button (only show if date is selected)
                  if (selectedDate != null)
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, _formatDate(selectedDate!));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFC64304),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Konfirmasi Tanggal',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}