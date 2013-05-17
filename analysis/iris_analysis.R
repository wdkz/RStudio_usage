#Rに標準で組み込まれているirisデータセットを使う
data(iris)
#データセットのサマリ出力
summary(iris)

#Sepalのほうをplot
par(mfrow=c(1,2))
boxplot(Sepal.Length ~ Species, data=iris, outline=FALSE, main="Sepal.Length")
points(jitter(as.numeric(iris$Species)), iris$Sepal.Length, col="blue", pch=20, cex=2)
boxplot(Sepal.Width ~ Species, data=iris, outline=FALSE, main="Sepal.Width")
points(jitter(as.numeric(iris$Species)), iris$Sepal.Width, col="red", pch=20, cex=2)
#Petalのほうをplot
boxplot(Petal.Length ~ Species, data=iris, outline=FALSE, main="Petal.Length")
points(jitter(as.numeric(iris$Species)), iris$Petal.Length, col="blue", pch=20, cex=2)
boxplot(Petal.Width ~ Species, data=iris, outline=FALSE, main="Petal.Width")
points(jitter(as.numeric(iris$Species)), iris$Petal.Width, col="red", pch=20, cex=2)

#決定木用のライブラリを読み込む
library(rpart)
#決定木モデルの生成_アヤメの種を目的変数に、それ以外の変数を説明変数に
tree.mdl <- rpart(Species ~ ., data=iris)
#決定木結果を綺麗に描画するライブラリを読み込む
library(partykit)
#決定木の結果をプロット
plot(as.party(tree.mdl))
