package KetaiPost::L10N::ja;

use strict;
use warnings;

use utf8;

use base 'KetaiPost::L10N::en_us';
use vars qw( %Lexicon );

%Lexicon = (
    '_PLUGIN_DESCRIPTION' => '携帯メール投稿プラグイン',
    'KetaiPost Default' => 'KetaiPost標準',
    'System Template Modules' => 'システムのテンプレートモジュール',
    'Mail Post' => 'メール投稿',
    'Mailbox List (To Addresses)' => '送信先一覧（受付用メールボックス）',
    'Mailbox' => '送信先',
    'From Address' => '送信元',
    'Mail Address' => 'メールアドレス',
    'Mail Account' => 'アカウント名',
    'Host' => 'ホスト',
    'Port' => 'ポート',
    'Mailbox List' => '送信先一覧',
    'Add Mailbox' => '送信先の追加',
    'Mail Check' => '新着チェック',
    'Create Mailbox' => '送信先設定の追加',
    'Edit Mailbox' => '送信先設定の編集',
    'Author List' => '送信元一覧',
    'Add Author' => '送信元の追加',
    'Author List (From Addresses)' => '送信元一覧（送信元メールアドレス）',
    'Create Author' => '送信元設定の追加',
    'Edit Author' => '送信元設定の編集',
    'Enable Sync' => '同期',
    'Add All Authors' => 'すべてユーザーを登録（いずれかのブログで記事作成権限のあるユーザーのみ）',
    'Add Blog Authors' => 'ブログのメンバーを送信元として登録（あなたが管理権限を持つブログで記事作成権限のあるユーザーのみ）',
    'Do you add all authors?' => 'すべてのユーザーを送信元として登録しますか？',
    'Do you add blog authors?' => 'あなたが管理するブログのメンバーを送信元として登録しますか？',
    '(Not Permitted)' => '（表示する権限がありません）',
);

1;