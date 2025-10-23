# Modulare Struktur für Titration App (Melos/Flutter Modular)

## Erklärung der einzelnen Module und deren Rolle

### 1. Domain-Modul
**Inhalt:** Modelle (Entities), UseCases, Schnittstellen (iRepository)
**Rolle:** Enthält die reine Geschäftslogik und die Verträge. Keine Implementierung, keine Abhängigkeit zu Datenbank oder Framework. Hier wird definiert, wie die App funktioniert und welche Daten sie verarbeitet.
**Beispiel:**
- lib/domain/models/titration.dart
- lib/domain/usecases/calculate_titration.dart
- lib/domain/repositories/titration_repository.dart (Interface)


### 2. Data-Modul
**Inhalt:** Mapper, Repository-Implementierungen, DTOs, Datenquellen-Interfaces
**Rolle:** Setzt die Verträge aus dem Domain-Modul um. Hier werden die Daten verarbeitet, transformiert und gespeichert. Das Modul bleibt unabhängig von der konkreten Datenbank-Technologie.
**Beispiel:**
- lib/data/mappers/titration_mapper.dart
- lib/data/repositories/titration_repository_impl.dart
- lib/data/datasources/sembast_database_service.dart
- lib/data/datasources/hive_database_service.dart
**Achtung:** Die Implementierung für Sembast/Hive sollte jeweils in einem eigenen Untermodul/Package liegen, z.B.:
- packages/titration_data_sembast/
- packages/titration_data_hive/
- Das Data-Modul bindet nur das gewünschte Datenbankmodul ein.

### 3. Datenbank-Adapter-Module (z.B. Sembast/Hive)
**Inhalt:** Konkrete Datenbank-Services, Adapter für Sembast, Hive etc.
**Rolle:** Implementieren die Datenquellen-Interfaces aus dem Data-Modul für eine bestimmte Datenbank. So kann die Datenbank einfach ausgetauscht werden, ohne die Logik in Domain oder Data zu ändern.
**Beispiel:**
- packages/titration_data_sembast/lib/sembast_database_service.dart
- packages/titration_data_hive/lib/hive_database_service.dart

### 4. UI-Modul
**Inhalt:** Screens, Widgets, Präsentationslogik
**Rolle:** Stellt die Benutzeroberfläche bereit und konsumiert die UseCases und Models aus dem Domain-Modul. Bleibt unabhängig von der Datenbank und der konkreten Datenverarbeitung.
**Beispiel:**
- lib/ui/screens/titration_screen.dart
- lib/ui/widgets/titration_form.dart


### 5. Core/Shared-Modul
**Inhalt:** Utilities, Fehlerbehandlung, gemeinsame Services
**Rolle:** Enthält wiederverwendbare, generische Funktionalität, die von mehreren Modulen genutzt werden kann.

## Übersicht
Dieses Dokument beschreibt eine praxisnahe, modulare Struktur für die Titration App als Monorepo mit Melos und separaten Packages für Domain, Data und Datenbank-Adapter.

---

## 1. Monorepo-Struktur

```
titration_app/
  melos.yaml
  packages/
    titration_domain/
      pubspec.yaml
      lib/
        models/
        usecases/
        repositories/
    titration_data/
      pubspec.yaml
      lib/
        mappers/
        repositories/
        datasources/
    titration_data_sembast/
      pubspec.yaml
      lib/
        sembast_database_service.dart
    titration_data_hive/
      pubspec.yaml
      lib/
        hive_database_service.dart
  app/
    pubspec.yaml
    lib/
      main.dart
      screens/
      widgets/
```

---

## 2. Beispiel `pubspec.yaml` für die einzelnen Module

### titration_domain/pubspec.yaml
```yaml
name: titration_domain
description: Domain-Logik und Verträge für Titration
version: 0.0.1
environment:
  sdk: ">=3.0.0 <4.0.0"
dependencies:
  # Keine Abhängigkeiten zu Datenbank oder Flutter!
dev_dependencies:
  test: any
```

### titration_data/pubspec.yaml
```yaml
name: titration_data
description: Implementierung der Datenzugriffslogik für Titration
version: 0.0.1
environment:
  sdk: ">=3.0.0 <4.0.0"
dependencies:
  titration_domain:
    path: ../titration_domain
  # Keine direkte Datenbank-Abhängigkeit!
dev_dependencies:
  test: any
```

### titration_data_sembast/pubspec.yaml
```yaml
name: titration_data_sembast
description: Sembast-Datenbankadapter für Titration
version: 0.0.1
environment:
  sdk: ">=3.0.0 <4.0.0"
dependencies:
  sembast: any
  titration_data:
    path: ../titration_data
dev_dependencies:
  test: any
```

### titration_data_hive/pubspec.yaml
```yaml
name: titration_data_hive
description: Hive-Datenbankadapter für Titration
version: 0.0.1
environment:
  sdk: ">=3.0.0 <4.0.0"
dependencies:
  hive: any
  titration_data:
    path: ../titration_data
dev_dependencies:
  test: any
```

### app/pubspec.yaml
```yaml
name: titration_app
description: Haupt-App für Titration
version: 0.0.1
environment:
  sdk: ">=3.0.0 <4.0.0"
  flutter: ">=3.0.0"
dependencies:
  flutter:
    sdk: flutter
  titration_domain:
    path: ../packages/titration_domain
  titration_data:
    path: ../packages/titration_data
  titration_data_sembast:
    path: ../packages/titration_data_sembast
  # oder titration_data_hive, je nach Bedarf
dev_dependencies:
  flutter_test:
    sdk: flutter
```

---

## 3. Melos-Konfiguration (melos.yaml)

```yaml
name: titration_app
packages:
  - packages/*
  - app
```

---

## 4. Zusammengefassung
**Domain:** Nur Logik und Verträge, keine Implementierung.
**Data:** Implementierung der Verträge, Mapper, DTOs, aber keine direkte Datenbankbindung.
**Database:** Adapter für konkrete Datenbanken, austauschbar.
**UI:** Präsentation, konsumiert nur die Domain.
**Core/Shared:** Hilfsfunktionen, Fehler, etc.

---

## 5. Vorteile
**Hohe Kohäsion:** Jedes Modul hat eine klar abgegrenzte Aufgabe.
**Geringe Kopplung:** Datenbank kann gewechselt werden, ohne Domain oder UI zu ändern.
**Testbarkeit:** Domain und Data können unabhängig getestet werden.
**Erweiterbarkeit:** Neue Datenbank? Einfach neues Modul, keine Änderungen an Domain/UI nötig.

---

## 6. Beispiel für die Verwendung
- Die App importiert nur die gewünschten Datenbankadapter.
- Die Datenbank kann einfach gewechselt werden, indem man das entsprechende Package einbindet.
- Die Domain bleibt immer unabhängig.

---

**Diese Struktur ist die Basis für professionelle, modulare Flutter-Projekte.**
