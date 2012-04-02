# KetaiPost
* Author:: Yuichi Takeuchi <uzuki05@takeyu-web.com>
* Website:: http://takeyu-web.com/
* Copyright:: Copyright 2011 Yuichi Takeuchi
* License:: GPL v2

Movable Type (MTOS) 5.1 にメール投稿機能を追加するためのプラグインです。
類似の機能をもつプラグインはすでに存在しますがライセンス上の問題により自作しましたので、せっかくなので公開します。
自分で使う上で欲しいなと思った機能を割と節操なく実装する一方で、一般的でも私が不要と思った機能は付けていません。

バージョン 1.0.0 にあわせて、パーミッションなどセキュリティ面を少し強化しました。（私が複数ユーザーで使いたかったので。）


## 特徴
* *携帯メール* でブログ記事の投稿が行えるようになります。
* 写真付きメールを送信すると、アイテムに登録した上で記事に掲載します。 *複数枚の添付にも対応* しています。（きちんと"ブログ記事アイテム"として登録します）
* 写真は *自動的にサムネイルを生成* されます。（v0.40～はMTAssetThumbnailURLタグを利用）
* サムネイルの大きさと形状（正方形に切り抜くか、そのまま縮小するか）を設定可能。（v0.40～はMTAssetThumbnailURLタグを利用）
* 投稿される記事本文レイアウトは *テンプレートタグによるカスタマイズが可能。*
  * 添付ファイルの表示位置などを自由に設定可能。通常のテンプレートモジュールを使ってカスタマイズを行うので、通常のテンプレート編集と何ら変わりません。（面倒な人はそのままで十分使えます）（v0.40～）
* 公開設定及びコメント・トラックバック受付可否はブログの設定を利用するので、たとえばメールで受け付け時点では下書きとし、確認してから公開といったことも可能です。
  * 記事公開権限のないユーザーからの投稿は自動的に下書きとして保存されます。（v1.0.0～）
* *マルチブログ対応。* ･･･というかマルチブログ・マルチユーザ環境を強く意識しており、ブログ毎に受付メールアドレスを設定できます。
* *投稿先カテゴリ設定可能。* ブログとあわせて、掲載カテゴリを指定できます。もちろん、同じブログにカテゴリ毎に別々の受け付けようメールアドレスを設定することもできます。
* *送信元メールアドレスとMovable Typeのユーザーの関連づけが可能。*同じ受付メールアドレスに送信しても、送信元によってAさん、Bさんの記事として登録することができます。
  * ユーザーの管理権限はMovable Typeのそれに準じます。これにより、Aさんはブログ1だけ投稿可能といったことができます。
* *匿名ユーザーを設定可能。 *記事の投稿のみを許可したユーザーを作成し、不特定多数のユーザーからの投稿を受け付けることができます。
* *投稿可能なユーザーを送信元メールアドレスで制限* することができます。匿名ユーザーを作成しない場合、あらかじめ登録した送信元メールアドレスからのみ記事の追加が可能です。
* メールの件名が省略された時の *デフォルトの記事タイトルをブログ・ウェブサイト別に指定可能。*
* 受付用メールアドレスに *「拡張メールアドレス」を指定可能* なので、1つのメールボックスでたくさんの受付用メールアドレスを設定することが可能です。（Gmail等、拡張メールアドレスが使用可能なメールサーバーを利用のこと）
  * メールの既読・未読管理は行っていないので、あまり大量のメールがあると受信処理が重くなります。可能なら専用のメールボックスを用意してください。
* *APOPの使用・不使用をメールボックス毎に設定可能* です。
* 写真に含まれるEXIF情報を使って、 *自動的に正しい向きに回転させて登録* します。（Image::ExifToolモジュールが必要）
  * Exifの自動削除機能もあるので、最近問題になったようなExifのセキュリティリスクを回避できます。（Image::Magickモジュールが必要／v1.0.11より）
* Gmailを利用すれば、 *絵文字を利用可能。* （Gmail以外の場合は、各キャリア網から抜けた時点で〓に変換されるため無理です）（私が持っているSO503i以外ではテストできていません。au/Softbankでは未知数。）
  * pure Perlの絵文字変換モジュール Encode::JP::Emoji を利用する為、共用サーバ等での絵文字利用も比較的容易です。
  * Encode::JP::Emoji 対応バージョンのmt4iと併用すれば、手軽にPC/携帯両対応の絵文字対応ブログを構築できます。
* iショット等の *携帯動画の掲載が可能。* （ある程度の知識と環境が必要/要FFmpeg）
* 本文中のHTMLのエスケープの有無を設定できます。
* 本文中ではてな記法のような記法を使用できます。（Text::Xatenaモジュールがあれば）
* ブログ記事公開時に、公開通知メールを送信することができます。（MovableType標準の『アドレス帳対応』）
* *個人法人問わず無料* で利用できます。今後有料化されることもありません。
* 万年β（α？）テスト状態です。←重要

## バージョン 1.0.0 の新機能
* Movable Typeのユーザーに記事作成権限が付与された際に、自動的に送信元メールアドレスに登録できます。複数ユーザーが利用するコミュニティ的なブログに使える・・・かも？（プラグイン設定より有効化が必要）
* システムに登録されている、いずれかのブログで記事作成権限のあるユーザーを一括で送信元登録できます。楽ちん。
* cron の実行を待たず、手動で投稿受付処理を行うこともできます。設定の確認等にどうぞ。
* セキュリティ（前よりマシ）
  * 送信元、送信先設定においてシステム管理者はすべて設定可能、ブログ管理者は自信が管理するブログに関するものだけを設定可能。
  * 記事登録時のパーミッションをすこし厳密化
    * 記事公開権限がない場合は、ブログの公開設定に関係なく「下書き」として保存されます。
    * ファイルアップロード権限がない場合は、画像や動画の添付ができません。（添付は無視されます）

## 動作環境
* cron が利用可能であること。
  * 利用できない方は、RunPeriodicTasksプラグインが使えるかも知れません。
* Movable Type/MTOS バージョン 5.12以上
  * KetaiPostバージョン 1.0.0 より、MT5.0系では動きません。5.0系をお使いの方は 0.4.4 をお使い下さい。
* Perl 5.8.1 以上で以下のモジュールがインストールされているサーバーであること。（ものによって`extlib`への配置でOK）
  * `Mail::POP3Client`
  * `MIME-tools`
  また、POP3 over SSL (Gmailなど)のメールボックスを使用する場合は、次も必要です。
  * `IO::Socket::SSL`
  EXIF情報を使った写真の回転や位置情報の表示を行う場合は、次も必要です。
  * `Image::ExifTool`
  * `Image::Magick` （写真の回転を行う場合）
  Gmailを利用する方で、絵文字入りメールを掲載する場合は、Yusuke Kawasaki氏による次のモジュールが必要です。
  * `Encode::JP::Emoji` ( http://search.cpan.org/~kawasaki/Encode-JP-Emoji-0.05/ )
  * `Encode::JP::Emoji::FB_EMOJI_TYPECAST` ( http://search.cpan.org/~kawasaki/Encode-JP-Emoji-FB_EMOJI_TYPECAST-0.05/ )

  なお、 Mail::POP3Client 及び MIME-tools 、Encode::JP::Emoji については、extlib に配置することで動作します。（たぶん）
  * `extlib/Mail/POP3Client.pm`
  * `extlib/MIME/*`	
  * `extlib/Encode/JP/Emoji.pm`
  * `extlib/Encode/JP/Emoji/*`
* 携帯電話で撮影した動画を掲載するには、適切にコンパイルされたffmpegと、ビューワであるJWPlayerが必要です。
  * 共用レンタルサーバでの利用はいろいろな理由で難しいです。これだけで理解できない人は諦めましょう。
  * 持っている端末（SO503i/Xperia SO-01B）でしかテストしていません。


## 動くっぽい共用レンタルサーバ（報告のあったもの）
* さくらのレンタルサーバ
  * `Mail::POP3Client`がありませんが、`MT_DIR/extlib/Mail/POP3Client.pm`を配置すれば動くようです。


## しくみ
KetaiPostはごくありふれた方法で記事の投稿を実現します。

投稿受付用メールアドレスを用意、POP3の接続情報を登録しておくことで、KetaiPostがメールボックスにアクセス、宛先に投稿受付用メールアドレスが指定されたメールが存在するかを確認します。

見つかったら、送信元のメールアドレスから投稿ユーザーを決定します。見つからない時はそのメールは破棄します。
ユーザーを特定できたら、そのブログに記事を追加できるか、権限の確認を行います。

投稿できることを確認したら、実際に記事を作成し、必要に応じてカテゴリ設定及びアイテムの追加を行います。
記事の投稿が完了したら、メールを削除します。

最後に、ブログの投稿設定において新しい記事の状態が「公開」（デフォルト）であれば再構築を行います。


## インストール方法
### メールボックスの用意
POP3でメールを受信可能な適当なメールアドレス（メールボックス）を用意します。

Gmailがオススメですが、その場合には`IO::Socket::SSL`モジュールが利用可能であることを確認して下さい。

いたずらを防止するため、予想不可能なメールアドレスにします。
また、公開したくないメールを誤って記事として投稿してしまうリスクを考えて、KetaiPost以外で利用しない専用のメールアドレスが良いです。

拡張メールアドレス（@の前の+以降を無視する機能）が利用できれば、予測不可能なメールアドレスをたくさん用意することができます。

  例）hoge+xxxx@takeyu-web.com が hoge@takeyu-web.com に届く。

### ダウンロード・配置
KetaiPostディレクトリ（フォルダ）をpluginsディレクトリにそのままコピーしてください。

管理画面にアクセスすると、データベースの更新が自動的にはじまり、インストールが完了します。

必要モジュールが足りない場合は、便宜cpan等でインストールするか、extlibディレクトリへ配置して下さい。

### インストール確認
ツール -> プラグインで一覧に「KetaiPost」が表示され、「KetaiPost」の「詳細」タブで必要な依存モジュールが「使用できます」と表示されていることを確認して下さい。

### KetaiPostの設定
受付用メールアドレス（送信先）とユーザー（送信元）の設定を行う必要があります。

#### 送信先設定

1. 「システム」メニューから、「メール投稿」->「送信先の追加」を選びます。
2. メールでの投稿を受け付けるブログを選択ボックスから選び、「次へ」を押します。
3. 投稿先のカテゴリやPOP3の接続情報などを記入し、「OK」を押します。
4. 送信先一覧のに追加されたことを確認します。

#### 送信元設定

5. 「システム」メニューから、「メール投稿」->「送信元の追加」を選びます。
6. 投稿に使用するユーザーを選び、（携帯）メールアドレスを記入します。匿名ユーザーからの投稿を受け付ける場合には、「送信元メールアドレス」は空白にしておきます。できたら、「OK」を押します。なお、「メールアドレスの同期」を「有効」にすると、ユーザー情報で設定されたメールアドレスを自動的に使用します。ユーザーがメールアドレスを変更した場合にも自動的に更新するので、便利です。
7. 送信元メールアドレスの表に追加されたことを確認します。

### Taskの設定
定期的にメール受信処理が動くように設定します。
公式サイトのドキュメント（http://www.movabletype.jp/documentation/schedule_task_framework.html ）を参考に設定して下さい。

また、cronが使えない環境の方は、H.Fujimotoさんが公開されている、RunPeriodicTasksプラグイン（http://www.h-fj.com/blog/mtplgdoc/ ）が利用できるかもしれません。

### 投稿確認
実際に受付用メールアドレスにメールを送信し、しばらくして記事として追加されることを確認します。

cron 自体は適切に動くことがわかっている場合や、送信元・送信先設定が正しいかを確認したい場合には、cronによる実行を待たず手動で投稿受付処理をさせることができます。その場合は、「送信先一覧」より対象の送信先を選択し、「新着チェック」ボタンを押して下さい。

## 有償サポート
ご自身で設置・設定できない方向けに、設置代行サービスもございますのでお気軽にお問い合わせください。
詳しくは http://takeyu-web.com/download/2010/10/post-1.html


## ご注意
* 無保証です。このプラグインを使用したことでいかなる損害が発生しても、制作者は一切責任を負いません。
  * サポートが欲しい人は有償の製品を利用して下さい。
* すべての携帯電話などから正しく投稿できることを保証するものではありません。そもそもきちんと動くことも保証しません。
