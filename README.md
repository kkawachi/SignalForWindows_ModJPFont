# SignalForWindows_ModJPFont

Windows 版 [Signal](https://signal.org/) の日本語フォントをなんとかする。

## 解決したい問題

Windows 版 Signal では、日本語を表示するフォントに中国語用のフォントが使われてしまっている。

## その原因

アプリ内部で使用している css で、中国語用フォントが高い優先度で設定されている (https://github.com/signalapp/Signal-Desktop/issues/4232)。

## このツールは何か

Signal アプリケーション内の中国語フォント設定を、適当な日本語フォントに置き換えるためのスクリプトを実行するツール一式である。何らかのバイナリエディタで定義を置換してもよいが、面倒なのである程度の自動化を行った。

Signal アプリケーションがビルドされるときにフォント設定を含む css が生成され、最終的に app.asar というファイルに格納されている。このツールは app.asar を直接書き換え、中国語フォント設定を日本語フォント設定
に置き換える。

書き換えが想定通りに行われることを確認した Signal のバージョンは v5.1.0 (2021-05-15)。

## このツールの使用手順

1. Signal が起動していたら終了させる
  
1. Signal がインストールされたフォルダ内でファイル `app.asar` を見つける。通常は
     `C:/Users/_username_/AppData/Local/Programs/signal-desktop/resources/app.asar`
にある。

1. 上の `app.asar` ファイルを、この `README.md` と同じフォルダにコピーする

1. コピーしたファイルを、`ORIG.asar` にリネームする (ORIG は大文字)

1. バッチファイル `00_DO_IT.BAT` を実行する。もし書き換えが成功していたら、 `ORIG.asar: 310 occurrences changed` のように表示される。(310 は Signal のバージョンによって異なる数)

1. 新しく `app.asar` ファイルが生成されるているので、これをもとのフォルダに上書きコピーする

1. Signal を起動してフォントが変わっていることを確認する

## 高度な設定

既定値では、日本語フォントはメイリオを使用する。それ以外の日本語フォントに設定したい場合には、 `REPLACE_FONT.sh` を修正する。ただし `REPLACE_FONT.sh` の改行コードを変更してはならない。

`REPLACE_FONT.sh` を適当なテキストエディタで開いたとき、
```sh
NEWFONT='"Meiryo"                               '
```
となっている行が置き換え後のフォント定義である。

もし游ゴシック体に置き換えたい場合には、 `REPLACE_FONT.sh` 内 の
```sh
#NEWFONT='"Yu Gothic"                            '
```
となっている行の先頭一文字 (#) を削除して、
```sh
NEWFONT='"Yu Gothic"                            '
```
に書き換えたのち、手順5以降を実行すればよい。

## 注意事項

Signal アプリケーションが更新されるたびに  `app.asar` が元に戻されるので、　その度に本ツールを適用する必要がある。

中国語フォントの定義を潰しているので、中国語が正しく表示されなくなる可能性がある。

ツール内の bash.exe は Git for windows (https://gitforwindows.org/) から借用している。

ツール内の gsar.exe は GnuWin32 (http://gnuwin32.sourceforge.net/packages/gsar.htm) から借用している。
