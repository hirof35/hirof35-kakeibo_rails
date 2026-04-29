# 🛡️ Strategic Kakeibo App (家計簿ログ)

Railsを使用して構築した、個人の資産ロジスティクスを最適化するための家計簿アプリケーションです。
単なる記録ツールではなく、予算に対する「消費率」を可視化し、戦略的な支出管理を支援します。

## 🚀 主な機能

- **動的予算管理**: 全体予算およびカテゴリ別予算を設定し、リアルタイムで進捗率（%）を可視化。
- **マルチユーザー対応（簡易）**: 記録ごとに「名前」を紐付け、誰の支出かを明確に分離。
- **レスポンシブUI**: Tailwind CSSによる、デスクトップ・モバイル双方で操作しやすいデザイン。
- **ワンクリック起動**: Windows環境での利便性を考慮した、バッチファイルによる自動起動（exe化対応）。

## 🛠️ 技術スタック

| カテゴリ | 使用技術 |
| :--- | :--- |
| **Language** | Ruby 3.x |
| **Framework** | Ruby on Rails 7.x |
| **Frontend** | Tailwind CSS / Hotwire (Turbo) |
| **Database** | PostgreSQL (or SQLite3) |
| **Styling** | Lucide Icons / Google Fonts (Inter) |

## 📂 セットアップ方法

### 1. 依存関係のインストール
```bash
bundle install
2. データベースの構築
Bash
rails db:create
rails db:migrate
3. アプリケーションの起動
Bash
rails server
ブラウザで http://localhost:3000 にアクセスしてください。

📈 設計のこだわり（思想工学の観点から）
構造サイエンスとしての実装:
支出を単なる「消費」ではなく、家計というシステムの「コスト」として定義。Recordモデルを中心に、BudgetおよびCategoryBudgetモデルをリレーションさせることで、動的な進捗計算を可能にしました。

UI/UX:
マテリアルデザインの思想を取り入れ、ダークモードに近い高コントラストな配色（Indigo & Gray）を採用し、視認性を高めています。

📝 今後のアップデート予定
[ ] 期間別（月次・年次）レポートのグラフ化

[ ] ユーザー認証機能（Devise）の導入

[ ] 支出傾向のAI分析機能
