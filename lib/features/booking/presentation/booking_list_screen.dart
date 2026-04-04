import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';

/// Booking list screen.
///
/// Displays available buses for a selected route and date.
/// This is currently a UI-first implementation based on the design.
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
            children: const [
              _RouteHeader(),
              SizedBox(height: 18),
              _FilterRow(),
              SizedBox(height: 22),
              _BusOptionCard(
                badgeLabel: 'Fastest Option',
                title: 'Highway Express',
                subtitle: 'Intercity Luxury • AC • Instant Booking',
                price: 'Rs. 850',
                departureTime: '08:30',
                departurePlace: 'Galle Fort',
                duration: '1h 15m',
                routeInfo: 'Non-stop',
                arrivalPlace: 'Wadduwa Jn',
                arrivalTime: '09:45',
                primaryButtonText: 'Book This Seat',
                secondaryButtonText: '',
                highlighted: true,
              ),
              SizedBox(height: 16),
              _BusOptionCard(
                badgeLabel: 'Cheapest Option',
                title: 'SLTB Normal',
                subtitle: 'Route 02 • Non AC',
                price: 'Rs. 240',
                departureTime: '08:15',
                departurePlace: 'Galle Stand',
                duration: '2h 45m',
                routeInfo: '12 Stops',
                arrivalPlace: 'Wadduwa City',
                arrivalTime: '11:00',
                primaryButtonText: 'Pay on Board',
                secondaryButtonText: 'View Route Details',
              ),
              SizedBox(height: 16),
              _BusOptionCard(
                badgeLabel: '',
                title: 'Semi-Luxury',
                subtitle: 'Comfort Seating • Non-AC',
                price: 'Rs. 420',
                departureTime: '09:00',
                departurePlace: 'Galle Fort',
                duration: '2h 10m',
                routeInfo: 'Limited Stops',
                arrivalPlace: 'Wadduwa Jn',
                arrivalTime: '11:10',
                primaryButtonText: 'Select Seats',
                secondaryButtonText: 'LKR Rates',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Top route summary section.
class _RouteHeader extends StatelessWidget {
  const _RouteHeader();

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
      child: Row(
        children: const [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Galle → Wadduwa',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Today, 24 Oct',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          _AvailabilityPill(),
        ],
      ),
    );
  }
}

class _AvailabilityPill extends StatelessWidget {
  const _AvailabilityPill();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF1FF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Text(
        '12 Available',
        style: TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.w700,
          fontSize: 12,
        ),
      ),
    );
  }
}

/// Filter chips row.
class _FilterRow extends StatelessWidget {
  const _FilterRow();

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        _FilterChip(
          label: 'Earliest First',
          selected: true,
        ),
        _FilterChip(
          label: 'AC Only',
        ),
        _FilterChip(
          label: 'Lowest Fare',
        ),
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
        border: selected
            ? null
            : Border.all(color: const Color(0xFFDCE4F2)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.white : AppColors.textSecondary,
          fontWeight: FontWeight.w700,
          fontSize: 12,
        ),
      ),
    );
  }
}

/// Single bus option card.
class _BusOptionCard extends StatelessWidget {
  const _BusOptionCard({
    required this.badgeLabel,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.departureTime,
    required this.departurePlace,
    required this.duration,
    required this.routeInfo,
    required this.arrivalPlace,
    required this.arrivalTime,
    required this.primaryButtonText,
    required this.secondaryButtonText,
    this.highlighted = false,
  });

  final String badgeLabel;
  final String title;
  final String subtitle;
  final String price;
  final String departureTime;
  final String departurePlace;
  final String duration;
  final String routeInfo;
  final String arrivalPlace;
  final String arrivalTime;
  final String primaryButtonText;
  final String secondaryButtonText;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        border: highlighted
            ? Border.all(color: const Color(0xFFBCD0FF), width: 1.2)
            : null,
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
          if (badgeLabel.isNotEmpty) ...[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              decoration: BoxDecoration(
                color: highlighted
                    ? const Color(0xFFEAF1FF)
                    : const Color(0xFFF5F7FB),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                badgeLabel,
                style: const TextStyle(
                  color: AppColors.primary,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 14),
          ],
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.directions_bus_filled_rounded,
                color: AppColors.primary,
                size: 22,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                price,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: _TimeBlock(
                  time: departureTime,
                  location: departurePlace,
                  alignEnd: false,
                ),
              ),
              Column(
                children: [
                  Text(
                    duration,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(
                        Icons.trending_flat_rounded,
                        size: 16,
                        color: AppColors.textSecondary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        routeInfo,
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: _TimeBlock(
                  time: arrivalTime,
                  location: arrivalPlace,
                  alignEnd: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          if (secondaryButtonText.isEmpty)
            SizedBox(
              width: double.infinity,
              child: _PrimaryButton(label: primaryButtonText),
            )
          else
            Row(
              children: [
                Expanded(
                  child: _SecondaryButton(label: secondaryButtonText),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _PrimaryButton(label: primaryButtonText),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _TimeBlock extends StatelessWidget {
  const _TimeBlock({
    required this.time,
    required this.location,
    required this.alignEnd,
  });

  final String time;
  final String location;
  final bool alignEnd;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          alignEnd ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(
          time,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          location,
          textAlign: alignEnd ? TextAlign.end : TextAlign.start,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  const _PrimaryButton({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),
      ),
    );
  }
}

class _SecondaryButton extends StatelessWidget {
  const _SecondaryButton({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 14),
        side: const BorderSide(color: Color(0xFFDCE4F2)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),
      ),
    );
  }
}