# Audiobook Player

## A New Flutter Project for UIC

This project is a Flutter application designed to provide a seamless experience for audiobook playback, featuring an organized folder structure following the principles of clean architecture and state management using BLoC.

## Getting Started

### Folder Structure

```plaintext
lib/
├── blocs/
│   ├── audiobook/
│   │   ├── audiobook_bloc.dart
│   │   ├── audiobook_event.dart
│   │   └── audiobook_state.dart
│   ├── player/
│   │   ├── player_bloc.dart
│   │   ├── player_event.dart
│   │   └── player_state.dart
│   └── playlist/
│       ├── playlist_bloc.dart
│       ├── playlist_event.dart
│       └── playlist_state.dart
├── data/
│   ├── models/
│   │   ├── audiobook_model.dart
│   │   └── playlist_model.dart
│   ├── repositories/
│   │   ├── audiobook_repository.dart
│   │   ├── playlist_repository.dart
│   │   └── local_storage_repository.dart
│   └── data_sources/
│       ├── remote_data_source.dart
│       └── local_data_source.dart
├── services/
│   ├── audio_service.dart
│   └── notification_service.dart
├── presentation/
│   ├── screens/
│   │   ├── audiobook_list_screen.dart
│   │   ├── audiobook_detail_screen.dart
│   │   └── playlist_screen.dart
│   ├── widgets/
│   │   ├── audiobook_card.dart
│   │   ├── player_controls.dart
│   │   └── playlist_item.dart
│   └── themes/
│       └── app_theme.dart
├── utils/
│   ├── constants.dart
│   └── helpers.dart
└── main.dart
