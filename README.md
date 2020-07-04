# Loffets

Loffetsはトレーニング結果を効率的に管理するためのアプリケーションです。  
https://www.loffets.com/

## 使用技術
### 言語
- Ruby 2.6.1
  - Ruby on Rails 5.2.4
  - Rspec

### インフラ
- AWS
  - コンピューティング (ECS)
  - コンテナ技術（ECS, ECR）
  - データベース（RDS）
  - ネットワーキング（VPC, ELB, Route53）
- Nginx
- CircleCI
- Docker (Docker Compose)

![AWS_architecture](https://github.com/DeliciousKokas/myapp/blob/master/AWS_architecture.png?raw=true)

## 機能一覧
### ユーザー関連機能
- 新規登録・編集・ログイン・ログアウト
- プロフィール画像のアップロード
- 自己紹介登録
- ユーザー検索
- フォロー・アンフォロー
- 他のユーザー情報表示

### 記録管理機能
- トレーニング日登録・閲覧・カレンダー表示
- トレーニング実績の登録・閲覧
- トレーニング実績のフィード
- マイトレーニングの登録・閲覧
- レコード分析 (頻度、種類、割合、推移)