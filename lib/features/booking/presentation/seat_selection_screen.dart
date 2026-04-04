import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';

/// Seat selection screen for bus booking.
///
/// This screen provides a realistic bus seat layout with:
/// - available seats
/// - booked seats
/// - selected seat
/// - booking summary and confirmation button
class SeatSelectionScreen extends StatefulWidget {
  const SeatSelectionScreen({super.key});

  @override
  State<SeatSelectionScreen> createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  static const double _seatPrice = 450.00;

  // Example seat map
  final Set<String> _bookedSeats = {
    '02',
    '05',
    '08',
    '11',
    '14',
  };

  String? _selectedSeat;

  void _onSeatTap(String seatNumber) {
    if (_bookedSeats.contains(seatNumber)) return;

    setState(() {
      if (_selectedSeat == seatNumber) {
        _selectedSeat = null;
      } else {
        _selectedSeat = seatNumber;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double totalPrice = _selectedSeat != null ? _seatPrice : 0.0;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'BuZ',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w800,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.textPrimary,
            size: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _TripHeader(),
              const SizedBox(height: 20),
              const _SeatLegend(),
              const SizedBox(height: 20),
              _SeatLayout(
                bookedSeats: _bookedSeats,
                selectedSeat: _selectedSeat,
                onSeatTap: _onSeatTap,
              ),
              const SizedBox(height: 22),
              _BookingSummary(
                selectedSeat: _selectedSeat,
                totalPrice: totalPrice,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Route and trip summary card.
class _TripHeader extends StatelessWidget {
  const _TripHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Express 402 Luxury',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Colombo to Kandy via Highway',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'AC / WIFI',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

/// Seat status legend.
class _SeatLegend extends StatelessWidget {
  const _SeatLegend();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 10,
      children: const [
        _LegendItem(
          label: 'Available',
          color: Colors.white,
          borderColor: Color(0xFFD7E2F2),
        ),
        _LegendItem(
          label: 'Booked',
          color: Color(0xFFE6ECF7),
          borderColor: Color(0xFFE6ECF7),
        ),
        _LegendItem(
          label: 'Selected',
          color: AppColors.primary,
          borderColor: AppColors.primary,
          textColor: Colors.white,
        ),
      ],
    );
  }
}

class _LegendItem extends StatelessWidget {
  const _LegendItem({
    required this.label,
    required this.color,
    required this.borderColor,
    this.textColor = AppColors.textPrimary,
  });

  final String label;
  final Color color;
  final Color borderColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: borderColor),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: textColor == Colors.white
                ? AppColors.textPrimary
                : AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}

/// Realistic bus seat layout.
class _SeatLayout extends StatelessWidget {
  const _SeatLayout({
    required this.bookedSeats,
    required this.selectedSeat,
    required this.onSeatTap,
  });

  final Set<String> bookedSeats;
  final String? selectedSeat;
  final ValueChanged<String> onSeatTap;

  @override
  Widget build(BuildContext context) {
    final List<List<String>> seatRows = [
      ['01', '02', '03'],
      ['04', '05', '06'],
      ['07', '08', '09'],
      ['10', '11', '12'],
      ['13', '14', '15'],
    ];

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF1FF),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.settings_input_component_rounded,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                'Steering wheel',
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              const Text(
                'Front',
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),

          // Bus seat rows
          Column(
            children: seatRows.map((row) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _SeatItem(
                      seatNumber: row[0],
                      isBooked: bookedSeats.contains(row[0]),
                      isSelected: selectedSeat == row[0],
                      onTap: () => onSeatTap(row[0]),
                    ),
                    const SizedBox(width: 12),
                    _SeatItem(
                      seatNumber: row[1],
                      isBooked: bookedSeats.contains(row[1]),
                      isSelected: selectedSeat == row[1],
                      onTap: () => onSeatTap(row[1]),
                    ),
                    const SizedBox(width: 28), // aisle
                    _SeatItem(
                      seatNumber: row[2],
                      isBooked: bookedSeats.contains(row[2]),
                      isSelected: selectedSeat == row[2],
                      onTap: () => onSeatTap(row[2]),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _SeatItem extends StatelessWidget {
  const _SeatItem({
    required this.seatNumber,
    required this.isBooked,
    required this.isSelected,
    required this.onTap,
  });

  final String seatNumber;
  final bool isBooked;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = isSelected
        ? AppColors.primary
        : isBooked
            ? const Color(0xFFE6ECF7)
            : Colors.white;

    final Color borderColor = isSelected
        ? AppColors.primary
        : isBooked
            ? const Color(0xFFE6ECF7)
            : const Color(0xFFD7E2F2);

    final Color textColor = isSelected
        ? Colors.white
        : isBooked
            ? AppColors.textSecondary
            : AppColors.textPrimary;

    return GestureDetector(
      onTap: isBooked ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        width: 62,
        height: 58,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor, width: 1.2),
        ),
        child: Center(
          child: Text(
            seatNumber,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}

/// Booking summary card with confirm button.
class _BookingSummary extends StatelessWidget {
  const _BookingSummary({
    required this.selectedSeat,
    required this.totalPrice,
  });

  final String? selectedSeat;
  final double totalPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Selected Seat',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            selectedSeat != null ? 'Seat $selectedSeat' : 'No seat selected',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Total Price',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'LKR ${totalPrice.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 18),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: selectedSeat == null
                  ? null
                  : () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Seat $selectedSeat confirmed'),
                        ),
                      );
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                disabledBackgroundColor: const Color(0xFFD8E2F1),
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: const Text(
                'Confirm Booking',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}