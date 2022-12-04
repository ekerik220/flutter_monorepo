# 大まかなフォルダー構造

```
equtum_app/
├── apps/
│   ├── mobile/
│   │   ├── lib/
│   │   │   └── main.dart
│   │   └── pubspec.yaml
│   └── tablet/
│       ├── lib/
│       │   └── main.dart
│       └── pubspec.yaml
├── shared/
│   ├── lib/
│   │   └── dialog.dart
│   └── pubspec.yaml
└── melos.yaml
```

`mobile`と`tablet`が`shared`に依存している。

# セットアップ

1. melos をインストールする

   `dart pub global activate melos`

2. melos で環境をセットアップする

   `melos bootstrap`

これで`shared`にあるコードを変更すると shared に依存している`mobile`と`tablet`に変更したコードが見えて hot reload が自動的に走らされる。

# CI/CD

on push の paths を使うことで関係ない deployment を避けられる。

例）

```
on:
  push:
    paths:
      - apps/mobile/**
      - shared/**
```

mobile か shared に変更があれば mobile の deployment ワークフローが走らされる。

```
on:
  push:
    paths:
      - apps/tablet/**
      - shared/**
```

tablet か shared に変更があれば tablet の deployment ワークフローが走らされる。

# リリース

github tags で tablet か mobile のリリースワークフローを走らせる。

```
on:
  push:
    tags:
      - "mobile_*.*.*"
```

mobile_1.0.0 みたいな tag を作ると mobile のワークフローが走る。

```
on:
  push:
    tags:
      - "tablet_*.*.*"
```

tablet_1.0.0 みたいな tag を作ると tablet のワークフローが走る。

# vscode を使ってる人

.vscode/launch.json を作ってこのコードを入れると vscode の debug メニューに mobile と tablet の debug オプションが追加される。

```
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "mobile",
            "cwd": "apps/mobile",
            "request": "launch",
            "type": "dart"
        },
        {
            "name": "mobile (profile mode)",
            "cwd": "apps/mobile",
            "request": "launch",
            "type": "dart",
            "flutterMode": "profile"
        },
        {
            "name": "mobile (release mode)",
            "cwd": "apps/mobile",
            "request": "launch",
            "type": "dart",
            "flutterMode": "release"
        },
        {
            "name": "tablet",
            "cwd": "apps/tablet",
            "request": "launch",
            "type": "dart"
        },
        {
            "name": "tablet (profile mode)",
            "cwd": "apps/tablet",
            "request": "launch",
            "type": "dart",
            "flutterMode": "profile"
        },
        {
            "name": "tablet (release mode)",
            "cwd": "apps/tablet",
            "request": "launch",
            "type": "dart",
            "flutterMode": "release"
        }
    ]
}
```
