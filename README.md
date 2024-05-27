# Bloc Study
Projeto criado para entender o básico da arquitetura BLoC no Flutter sem nenhuma dependência.

## Pré requisitos
- Flutter 3.19.3

## Estrutura de Diretórios

```plaintext
lib/
├── bloc/
│   └── task/
│       ├── task_bloc.dart
│       ├── task_event.dart
│       └── task_state.dart
├── models/
│   └── task_model.dart
├── repositories/
│   └── task_repository.dart
├── screens/
│   └── task_screen.dart
└── main.dart

```

## Descrição dos Arquivos

- **`lib/bloc/task/`**: Contém os arquivos relacionados ao BLoC (Business Logic Component).
  - **`task_bloc.dart`**: Implementa a lógica do BLoC.
  - **`task_event.dart`**: Define os eventos que o BLoC pode receber.
  - **`task_state.dart`**: Define os estados que o BLoC pode emitir.

- **`lib/models/`**: Contém os modelos de dados.
  - **`task.dart`**: Define o modelo de dados para uma Task.

- **`lib/repositories/`**: Contém os repositórios de dados.
  - **`task_repository.dart`**: Simula um repositório de dados para as Tasks.

- **`lib/screens/`**: Contém as telas do aplicativo.
  - **`task_screen.dart`**: A tela principal que interage com o BLoC.

- **`lib/main.dart`**: O ponto de entrada do aplicativo.

## Fluxo de dados ilustrado
![Exemplo Ilustrado](/assets/bloc_explanation.png)