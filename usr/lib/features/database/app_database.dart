import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'schema.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Expenses, Debts, Installments, Partners, PartnershipEntries, Settings])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // CRUD Operations - Expenses
  Future<int> addExpense(ExpensesCompanion entry) => into(expenses).insert(entry);
  Future<List<Expense>> getAllExpenses() => select(expenses).get();
  Stream<List<Expense>> watchAllExpenses() => select(expenses).watch();
  Future<bool> updateExpense(Expense entry) => update(expenses).replace(entry);
  Future<int> deleteExpense(int id) => (delete(expenses)..where((t) => t.id.equals(id))).go();
  
  // CRUD Operations - Debts
  Future<int> addDebt(DebtsCompanion entry) => into(debts).insert(entry);
  Future<List<Debt>> getAllDebts() => select(debts).get();
  Stream<List<Debt>> watchAllDebts() => select(debts).watch();
  Future<bool> updateDebt(Debt entry) => update(debts).replace(entry);
  Future<int> deleteDebt(int id) => (delete(debts)..where((t) => t.id.equals(id))).go();

  // CRUD Operations - Installments
  Future<int> addInstallment(InstallmentsCompanion entry) => into(installments).insert(entry);
  Stream<List<Installment>> watchAllInstallments() => select(installments).watch();
  Future<int> deleteInstallment(int id) => (delete(installments)..where((t) => t.id.equals(id))).go();

  // CRUD Operations - Partners
  Future<int> addPartner(PartnersCompanion entry) => into(partners).insert(entry);
  Stream<List<Partner>> watchAllPartners() => select(partners).watch();

  // CRUD Operations - Partnership Entries
  Future<int> addPartnershipEntry(PartnershipEntriesCompanion entry) => into(partnershipEntries).insert(entry);
  Stream<List<PartnershipEntry>> watchPartnershipEntries(int partnerId) => 
      (select(partnershipEntries)..where((t) => t.partnershipId.equals(partnerId))).watch();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'smart_home_ledger.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
