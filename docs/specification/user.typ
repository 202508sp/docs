#import "../lib/conf.typ": conf

#show: doc => conf(
    title: "「介護サポートのためのARグラス」仕様書",
    doc,
)

= はじめに

※現状、あくまで試作段階であるため、今後大きく変更する場合がある。

== 目的

少子高齢化に伴う要介護者の増加、介護職員の減少に対してIoTの側面から課題を解決することを目指している。各施設利用者の行動等の記録する際の都度パソコンへ移動して記録する時間を削減することが必要である。また、職員同士の連携や情報の共有・更新をスムーズに行えるようにすることも目的である。さらに、新規職員が入職後すぐに施設利用者の情報をその場で確認できるようにし、業務に慣れるまでの時間を短縮することを目指している。

= 概要

昨今の技術革新の中で、IoTを前提とした職場環境づくりが主流となりつつある。

しかし、人との関わりを主体とする介護職では、IoTの導入が進みにくい点や、難解なシステム導入に対する障壁が存在すると考えられる。

そこで、どのような人でも直感的に操作でき、かつ人との関わりの妨げにならないような仕組みとして「介護サポートのためのARグラス」を開発している。このグラスの利用により、その場で情報のやり取りが行えるため、無駄な移動時間・確認時間等を削減し、より利用者との関わりに時間を活用することが可能になると考えられる。

= システム / コマンド概要

このシステムは、介護施設で使用されるARグラスを通じて、音声コマンドを解析し、患者情報の取得や記録をするシステムである。音声コマンドを受け取り、適切な処理を行い、結果を表示する機能を持つ。

== ワークフロー

=== 音声コマンドの受信

ユーザーがARグラスに音声コマンドを入力する。例えば、「山田さんの情報表示」や「鈴木さんの体温は37.2度、血圧は138-85」などである。

=== 音声データの送信

音声データはデバイスIDと共にシステムに送信される。

=== 音声認識

システムはGoogleの音声認識サービスを使用して、音声データをテキストに変換する。このテキストは、後続のコマンド解析に使用される。

=== コマンド解析

変換されたテキストは、GoogleのAIサービスを使用して解析され、適切なコマンドとパラメータに変換される。例えば、「山田さんの情報表示」というテキストは、`GET_PATIENT_INFO` コマンドと `patientName` パラメータに変換される。

=== コマンド実行

解析されたコマンドは、システム内で実行される。例えば、`GET_PATIENT_INFO` コマンドが実行されると、指定された患者の情報が取得され、整形されたテキストとして表示される。

=== 結果の表示

実行結果はユーザーに返され、ARグラスに表示される。例えば、患者の名前、年齢、部屋番号、アレルギー情報などが表示される。

=== ログ記録

すべての操作はログに記録され、後で確認できるようになっている。

#pagebreak()

= コマンド一覧

#table(
    columns:  4,
    [コマンド名],[説明],[必要な情報],[レスポンスの例],
    [`GET_PATIENT_INFO`],[患者情報の取得],[患者の名前],[患者の名前、年齢、部屋番号、介護度、担当者、アレルギー情報、バイタルサイン],
    [`RECORD_VITAL`],[バイタルサイン記録],[患者の名前、バイタルサインの種類、値],[記録が成功したかどうか],
    [`RECORD_MEAL`],[食事摂取記録],[患者の名前、食事の種類、摂取量],[記録が成功したかどうか],
    [`RECORD_MEDICINE`],[投薬記録],[患者の名前、薬の名前],[記録が成功したかどうか],
    [`CALL_STAFF`],[スタッフ呼び出し],[スタッフの名前],[呼び出しが成功したかどうか],
    [`EMERGENCY`],[緊急事態通報],[場所],[通報が成功したかどうか],
)

== コマンド詳細

=== GET\_PATIENT\_INFO

- *説明*: 患者の情報を取得する。
- *必要な情報*: 患者の名前
- *レスポンスの例*:
  - 患者の名前: 山田太郎
  - 年齢: 75歳
  - 部屋番号: 102
  - 介護度: 3
  - 担当者: 田中看護師
  - アレルギー情報: ピーナッツ、アスピリン
  - バイタルサイン: 脈拍72、SpO2:98%

=== RECORD\_VITAL

- *説明*: 患者のバイタルサインを記録する。
- *必要な情報*: 患者の名前、バイタルサインの種類（例: 体温、血圧）、値
- *レスポンスの例*: 記録が成功した。

=== RECORD\_MEAL

- *説明*: 患者の食事摂取を記録する。
- *必要な情報*: 患者の名前、食事の種類（例: 朝食、昼食、夕食）、摂取量（例: 8割）
- *レスポンスの例*: 記録が成功した。

=== RECORD\_MEDICINE

- *説明*: 患者の投薬を記録する。
- *必要な情報*: 患者の名前、薬の名前
- *レスポンスの例*: 記録が成功した。

=== CALL\_STAFF

- *説明*: スタッフを呼び出す。
- *必要な情報*: スタッフの名前
- *レスポンスの例*: 呼び出しが成功した。

=== EMERGENCY

- *説明*: 緊急事態を通報する。
- *必要な情報*: 場所
- *レスポンスの例*: 通報が成功した。
