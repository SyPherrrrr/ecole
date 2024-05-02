df = read.table('data.csv', header=TRUE, sep=';')
> attach(df)
> Genre
 [1] 1 1 1 1 1 1 1 1 2 1 2 2 1 1 1 1 1 1 1 2 1 1 2 1 1 1 2 1 1 1 1 1 2 2 1 1 2 1
[39] 1 2
> Genre
 [1] 1 1 1 1 1 1 1 1 2 1 2 2 1 1 1 1 1 1 1 2 1 1 2 1 1 1 2 1 1 1 1 1 2 2 1 1 2 1
[39] 1 2
> Tan             
 [1] 1 1 1 1 1 1 0 1 0 0 0 1 1 1 1 1 1 1 1 0 1 1 1 1 1 0 1 1 1 1 1 1 1 0 1 0 0 1
[39] 1 1
> tanf = factor(Tan)
> tanf
 [1] 1 1 1 1 1 1 0 1 0 0 0 1 1 1 1 1 1 1 1 0 1 1 1 1 1 0 1 1 1 1 1 1 1 0 1 0 0 1
[39] 1 1
Levels: 0 1
> proportion_tan = table(tanf)/length(tanf)
> proportion_tan 
tanf
    0     1
0.225 0.775
> pie(proportion_tan, label = c("utilise TAN", "n'utilise pas TAN"))
> pie(proportion_tan, label = c("n'utilise pas TAN", "utilise TAN"))      
> pie(proportion_tan, label = c("n'utilise pas TAN", "utilise TAN"), color = c$
Warning messages:
1: In text.default(1.1 * P$x, 1.1 * P$y, labels[i], xpd = TRUE, adj = ifelse(P$x <  :
  "color" is not a graphical parameter
2: In text.default(1.1 * P$x, 1.1 * P$y, labels[i], xpd = TRUE, adj = ifelse(P$x <  :
  "color" is not a graphical parameter
3: In title(main = main, ...) : "color" is not a graphical parameter
> pie(proportion_tan, label = c("n'utilise pas TAN", "utilise TAN"), col = c("$
transportf = factor(Transport)                                    )
Error: object 'Transport' not found
> transportf = factor(Transports)
> transportf 
 [1] 3 4 3 4 4 4 1 2 1 1 2 3 4 4 2 3 4 3 1 2 4 4 4 4 4 4 4 4 3 3 4 4 4 4 4 4 2 4
[39] 4 4
Levels: 1 2 3 4
> proportions <- table(transportf) / length(transportf)
> names(proportions) <- c("jamais", "rarement", "parfois", "souvent")
> pie(proportions, label = names(proportions), col = c("blue", "white", "green$
> pie(proportions, label = names(proportions), col = c("blue", "white", "green$
> pie(proportions, label = names(proportions), col = c("blue", "white", "green$
> Naoned              
 [1] 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0
[39] 0 0
> naonedf = factor(Naoned)
> naonedf
 [1] 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0
[39] 0 0
Levels: 0 1
> proportion_naoned = table(naonedf)/length(naonedf)
> proportion_naoned
naonedf
  0   1
0.9 0.1
> pie(proportion_naoned, label = c("n'utilise pas Naoned", "utilise Naoned"))
> pie(proportion_naoned, label = c("n'utilise pas Naoned", "utilise Naoned"), $
+ pie(proportion_naoned, label = c("n'utilise pas Naoned", "utilise Naoned"), $
+
+

> pie(proportion_naoned, label = c("n'utilise pas Naoned", "utilise Naoned"), $
> pie(proportion_naoned, label = c("n'utilise pas Naoned", "utilise Naoned"), $
> pie(proportion_naoned, label = c("n'utilise pas Naoned", "utilise Naoned"), $
> pie(proportion_naoned, label = c("n'utilise pas Naoned", "utilise Naoned"), $
> pie(proportion_naoned, label = c("n'utilise pas Naoned", "utilise Naoned"))  
> Appli.bus
 [1] 2 4 3 4 4 4 1 2 1 1 1 2 4 3 2 3 3 3 4 1 4 4 2 4 4 3 4 4 2 4 4 4 4 4 4 4 1 4
[39] 4 4
> appbusf = factor(App.bus)
Error: object 'App.bus' not found
> App.bus 
Error: object 'App.bus' not found
> appbusf = factor(Appli.bus)
> appbusf
 [1] 2 4 3 4 4 4 1 2 1 1 1 2 4 3 2 3 3 3 4 1 4 4 2 4 4 3 4 4 2 4 4 4 4 4 4 4 1 4
[39] 4 4
Levels: 1 2 3 4
> proportion_appbus = table(appbusf)/length(appbusf)
> proportion_appbus
appbusf
   1    2    3    4
0.15 0.15 0.15 0.55
> names(proportion_appbus) = c("Jamais", "Rarement", "Parfois", "Souvent"))
Error: unexpected ')' in "names(proportion_appbus) = c("Jamais", "Rarement", "Parfois", "Souvent"))"
> names(proportion_appbus) = c("Jamais", "Rarement", "Parfois", "Souvent")
> pie(proportion_appbus, label = names(proportion_appbus))
>
