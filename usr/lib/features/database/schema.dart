import 'package:drift/drift.dart';

class Expenses extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get amount => real()();
  TextColumn get category => text()();
  DateTimeColumn get date => dateTime()();
  TextColumn get note => text().nullable()();
  TextColumn get photoPath => text().nullable()();
  TextColumn get tag => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class Debts extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  // 0: Creditor (Owed to me), 1: Debtor (Owed by me)
  IntColumn get type => integer()(); 
  RealColumn get amount => real()();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get dueDate => dateTime().nullable()();
  TextColumn get note => text().nullable()();
  BoolColumn get isPaid => boolean().withDefault(const Constant(false))();
}

class Installments extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  RealColumn get amount => real()();
  DateTimeColumn get startDate => dateTime()();
  // 0: Weekly, 1: Monthly, 2: Yearly
  IntColumn get frequency => integer()(); 
  DateTimeColumn get nextDate => dateTime()();
  BoolColumn get autoReminder => boolean().withDefault(const Constant(true))();
  TextColumn get note => text().nullable()();
}

class Partners extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  RealColumn get sharePercent => real()(); // 0-100
}

class PartnershipEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get partnershipId => integer().references(Partners, #id)();
  // 0: Profit, 1: Expense
  IntColumn get type => integer()(); 
  RealColumn get amount => real()();
  DateTimeColumn get date => dateTime()();
  TextColumn get note => text().nullable()();
}

class Settings extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();
  
  @override
  Set<Column> get primaryKey => {key};
}
