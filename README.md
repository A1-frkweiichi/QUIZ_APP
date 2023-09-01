<div align="center">
  <h1><a href="https://knowledge-tree-quiz.magia.runteq.jp/" target="_blank">ナレッジツリークイズ</a></h1>
  <h2>エンジニア学習における知識を、クイズ形式で投稿＆回答して学べるサービス</h2>
  <img src="https://github.com/furukawaeiichi/QUIZ_APP/blob/main/app/assets/images/ogp.png?raw=true" alt="KnowledgeTreeQuiz image"/>
</div>

## サービス概要
1. エンジニア学習に関するクイズを「作成・出題」できる
2. エンジニア学習に関するクイズを「回答・答え合わせ」できる

## メインのターゲットユーザー
- プログラミング学習者

## ユーザーが抱える課題
- リモート学習が多く、周りの人と教え合う機会がない
- インプット学習が多くなりがち
- アウトプット学習として技術ブログが挙げられるが、初学者にはハードルが高い

## 解決方法
  **1. クイズ「作成・出題」**
  - 学習項目ごとに、簡単なクイズを作ってアウトプットできる
  - ２〜４択の選択肢と解説を登録するので、何が正解か不正解か、改めて理解が深まる
    
  **2. クイズ「回答・答え合わせ」**
  - 「カテゴリー」「難易度」が表記されている中から、自身に適したクイズを選んで学習できる

## なぜこのサービスを作りたいのか？
  挫折率の高いエンジニア学習の要因として、「個人単位でのリモート学習」「理解度の定義の不明確さ」があると考えた。<br>
  アメリカ国立訓練研究所はラーニングピラミッドと言われる学習方法と記憶定着率の図を発表している。<br>
  <img src="https://github.com/furukawaeiichi/QUIZ_APP/blob/main/app/assets/images/learning_pyramid.jpg?raw=true" alt="LearningPyramid image"/>
  ラーニングピラミッドの効果的な学習方法を参考にして、
  1. 「個人単位でのリモート学習」でも、他の学習者と教え合える
  2. 「理解度の定義の不明確さ」であるなら、「自身の言葉で他人に解説できる」ことを理解した基準にする<br>
  
  上記の要因を解消することで、エンジニア学習のサポートになると考えた。

## 主な機能
  **1. ログイン機能（Google API）**
  - Googleアカウントでログインを簡略化できる
  - ユーザー名を取得して、パスワードの登録工程も省略できる

  **2. リッチテキストエディター機能（Action Text）**
  - Trixエディタを使用して、書式設定/リンク/引用/リストなどを簡単に記載できる

  **3. 画像保存機能（AWS S3）**
  - ユーザーのアバターや、クイズのイメージを登録できる

## 使用技術
  **バックエンド**
  - Ruby （3.2.2）
  - Rails （7.0.5）
  
  **フロントエンド**
  - JavaScript
  - Hotwire
  - TailwindCSS
  - daisyUI
  
  **インフラ**
  - RUNTEQ-magia

## ER図
<img width="1652" alt="スクリーンショット 2023-09-01 17 36 28" src="https://github.com/furukawaeiichi/QUIZ_APP/assets/102509805/3a739adf-c82f-4d52-be85-cf7f413c98b1">

