# Внимание, не обязательно комментировать все подряд (здесь я это сделала, чтобы вам было легче прочесть код). Но основные шаги лучше откомментировать (здесь отмечены двойным знаком решетки ##)

##### Пример кода для решения домашнего задания #####

## Анализ мощности
## М.А. Варфоломеева
## Вариант 0

## Исходные данные
n1 <- 28
power <- 0.8
alpha1 <- 0.01
alpha2 <- 0.05

library(pwr)

## Рассчитываем величину сильного эффекта по Коэну
effect_calculation <- cohen.ES(test = "t", size = "large")
# Добываем и округляем величину сильного эффекта по Коэну
effect <- abs(effect_calculation$effect.size)

## Рассчитываем объем выборки при уровне значимости alpha1
n_alpha1 <- pwr.t2n.test(n1 = n1, n2 = NULL, d = effect, power = power, sig.level = alpha1, alternative = "two.sided")
# Где в n_alpha1 объем выборки? Посмотрим структуру
str(n_alpha1) # объем выборки в элементе $n2
# Добываем и округляем объем выборки
n_alpha1 <- ceiling(n_alpha1$n2)

## Рассчитываем величину эффекта при уровне значимости alpha2
n_alpha2 <- pwr.t2n.test(n1 = n1, n2 = NULL, d = effect, power = power, sig.level = alpha2, alternative = "two.sided")
# Добываем и округляем объем выборки
n_alpha2 <- ceiling(n_alpha2$n2)

# Цитируем R
citation()
# Как цитировать RStudio смотрим здесь
# https://support.rstudio.com/hc/communities/public/questions/200658933-How-to-cite-RStudio
# Цитируем pwr
citation("pwr")
