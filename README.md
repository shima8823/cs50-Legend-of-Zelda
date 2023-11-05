
# cs50-Legend-of-Zelda

It is built using the love2d framework.

Three functions were added to base the cs50 code.

- [x]  Implement hearts that sometimes drop from enemies at random, which will heal the player for a full heart when picked up (consumed).
- [x]  Add pots to the game world (from the tile sheet) at random that the player can pick up, at which point their animation will change to reflect them carrying the pot (shown in the character sprite sheets). The player should not be able to swing their sword when in this state.
- [x]  When carrying a pot, the player should be able to throw the pot. When thrown, the pot will travel in a straight line based on where the player is looking. When it collides with a wall, travels more than four tiles, or collides with an enemy, it should disappear. When it collides with an enemy, it should do 1 point of damage to that enemy as well.

japanese
- ランダムで敵からドロップするハートを実装し、拾うと（消費すると）ハート1個分の回復が得られるようにする。
- ゲームワールドに（タイルシートから）ランダムに鍋を追加し、プレイヤーが拾えるようにする。このとき、プレイヤーのアニメーションは鍋を運ぶように変化する（キャラクターのスプライトシートに表示）。この状態では、プレイヤーは剣を振るうことができません。
- 鍋を持っているとき、プレイヤーは鍋を投げることができるはずです。投げられた鍋は、プレイヤーの視線を基準にして直線的に移動します。壁にぶつかったり、4タイル以上移動したり、敵にぶつかったりすると、消えるはずです。敵にぶつかると、その敵にも1ポイントのダメージが与えられるはずです。

https://github.com/shima8823/cs50-Legend-of-Zelda/assets/57759015/865abc72-2c19-4553-bee2-e8238946207a
