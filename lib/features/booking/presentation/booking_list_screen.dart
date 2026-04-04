import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';

class BookingListScreen extends StatelessWidget {
  const BookingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _RouteHeader(),
              SizedBox(height: 20),
              _FilterRow(),
              SizedBox(height: 20),

              _BusOptionCard(
                badge: 'Fastest Option',
                title: 'Highway Express',
                subtitle: 'Intercity Luxury • AC • Instant Booking',
                price: 'Rs. 850',
                departure: '08:30',
                arrival: '09:45',
                from: 'Galle Fort',
                to: 'Wadduwa Jn',
                duration: '1h 15m',
                buttonText: 'Book This Seat',
              ),

              SizedBox(height: 16),

              _BusOptionCard(
                badge: 'Cheapest Option',
                title: 'SLTB Normal',
                subtitle: 'Route 02 • Non AC',
                price: 'Rs. 240',
                departure: '08:15',
                arrival: '11:00',
                from: 'Galle Stand',
                to: 'Wadduwa City',
                duration: '2h 45m',
                buttonText: 'Pay on Board',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// ROUTE HEADER
class _RouteHeader extends StatelessWidget {
  const _RouteHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Galle → Wadduwa',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Today, 24 Oct',
                  style: TextStyle(color: AppColors.textSecondary),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFEAF1FF),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Text(
              '12 Available',
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }
}

/// FILTERS
class _FilterRow extends StatelessWidget {
  const _FilterRow();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        _FilterChip(label: 'Earliest First', selected: true),
        SizedBox(width: 10),
        _FilterChip(label: 'AC Only'),
        SizedBox(width: 10),
        _FilterChip(label: 'Lowest Fare'),
      ],
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    this.selected = false,
  });

  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: selected ? AppColors.primary : AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFDCE4F2)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.white : AppColors.textSecondary,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

/// BUS CARD
class _BusOptionCard extends StatelessWidget {
  const _BusOptionCard({
    required this.badge,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.departure,
    required this.arrival,
    required this.from,
    required this.to,
    required this.duration,
    required this.buttonText,
  });

  final String badge;
  final String title;
  final String subtitle;
  final String price;
  final String departure;
  final String arrival;
  final String from;
  final String to;
  final String duration;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFBCD0FF)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFEAF1FF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              badge,
              style: const TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
                fontSize: 11,
              ),
            ),
          ),

          const SizedBox(height: 12),

          /// Title Row
          Row(
            children: [
              const Icon(Icons.directions_bus, color: AppColors.primary),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Text(
                price,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),
            ],
          ),

          const SizedBox(height: 4),

          Text(
            subtitle,
            style: const TextStyle(color: AppColors.textSecondary),
          ),

          const SizedBox(height: 14),

          /// Time Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _TimeColumn(time: departure, label: from),
              Column(
                children: [
                  Text(duration),
                  const SizedBox(height: 4),
                  const Text('→ Non-stop'),
                ],
              ),
              _TimeColumn(time: arrival, label: to),
            ],
          ),

          const SizedBox(height: 16),

          /// Button
          _PrimaryButton(
            label: buttonText,
            onPressed: () {
              Navigator.pushNamed(context, '/seat-selection');
            },
          ),
        ],
      ),
    );
  }
}

class _TimeColumn extends StatelessWidget {
  const _TimeColumn({
    required this.time,
    required this.label,
  });

  final String time;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          time,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

/// PRIMARY BUTTON
class _PrimaryButton extends StatelessWidget {
  const _PrimaryButton({
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }
}