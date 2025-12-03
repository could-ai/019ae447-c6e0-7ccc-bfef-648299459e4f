import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../core/theme/app_theme.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to settings
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildDashboardCard(
              context,
              title: l10n.dailyExpenses,
              icon: Icons.account_balance_wallet,
              color: AppTheme.primaryBlue,
              onTap: () {
                // Navigate to Expenses
              },
            ),
            _buildDashboardCard(
              context,
              title: l10n.debts,
              icon: Icons.handshake,
              color: Colors.orange,
              onTap: () {
                // Navigate to Debts
              },
            ),
            _buildDashboardCard(
              context,
              title: l10n.installments,
              icon: Icons.calendar_month,
              color: Colors.purple,
              onTap: () {
                // Navigate to Installments
              },
            ),
            _buildDashboardCard(
              context,
              title: l10n.partnerships,
              icon: Icons.people,
              color: AppTheme.accentGreen,
              onTap: () {
                // Navigate to Partnerships
              },
            ),
            _buildDashboardCard(
              context,
              title: l10n.reports,
              icon: Icons.bar_chart,
              color: Colors.teal,
              onTap: () {
                // Navigate to Reports
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Quick add expense
        },
        label: Text(l10n.addExpense),
        icon: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildDashboardCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: color.withOpacity(0.1),
              child: Icon(icon, size: 32, color: color),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
