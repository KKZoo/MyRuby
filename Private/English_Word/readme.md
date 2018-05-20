##英単語プログラムについて
---

使い方はターミナル上で
```
ruby word.rb mode data_name
```

と入力するとよい

- プログラムのモード
	- i
		- txtファイルの上から順に順番通り出力してくれるモード
		```
		ruby word.rb i data_name
		```
		
	- r
		- txtファイルの中の単語をランダムに出力してくれるモード
		```
		ruby word.rb r data_name
		```


- データを追加するときのルール
	- Word_Dataの中にtxt形式で保存すること
	- データの形式は各行毎に => [英単語] [日本語訳] とすること
		- 例
		```txt
		read 読む
		write 書く
		answer 答え
		```