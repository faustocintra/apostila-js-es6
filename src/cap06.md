# ESTRUTURAS DE REPETIÇÃO

Computadores, sem dúvida, são máquinas fascinantes. Todavia, por mais inteligentes que pareçam, tudo o que fazem baseia-se em apenas dois fundamentos: **repetir e contar**.

Neste capítulo, vamos aprender como instruir computadores a fazer repetições e contagens. As estruturas de repetição usadas para isso são chamadas, também, de **laços** ou ***loops***.

## **`while`**

O laço mais genérico é o **`while`**, cuja sintaxe é a que segue:

```
while(condição) {
    Instrução ou instruções a serem executadas
}
```

A sintaxe de **`while`** é semelhante à da estrutura condicional **`if`**. Tudo o que dissemos em relação a esta também se aplica agora, ou seja:

1. **`while`** é uma palavra reservada do JavaScript, e, como todas elas, é escrita **em minúsculas**.
2. Os **parênteses** em torno da condição **são obrigatórios**.
3. Condição é um valor booleano, ou que se resolve em um valor booleano (**`true`** ou **`false`**).
4. Depois do parêntese de fechamento da condição, segue-se uma chave de abertura (`{`). Ele indica o início do bloco de instruções que será executado **apenas se a condição for verdadeira**.
5. Uma chave de fechamento (`}`) marca o final do bloco de instruções.

> **OBSERVAÇÃO**: as chaves são opcionais quando há uma única linha de código atrelada à estrutura **`while`**. No entanto, até que você esteja bem familiarizado(a) com a sintaxe do JavaScript, recomendo que sempre use as chaves.

A finalidade do laço **`while`** é repetir a instrução ou instruções no bloco a ele associado, enquanto a condição for verdadeira. O exemplo da @lst:while1 exibirá uma contagem de 1 a 10.

```{ #lst:while1 caption="Exemplo (1) da estrutura de repetição 'while'" .js .number-lines}
let contagem = 1

while(contagem <= 10) {
    document.write(contagem + '<br>')
    contagem++  // Equivale a: contagem = contagem + 1
}
```

Na linha 1, iniciamos a variável com o valor 1. Como esse valor é menor ou igual a 10 (teste do *loop* **`while'** na linha 3), o código do bloco associado à estrutura de repetição será executado uma vez, ou seja: na linha 4, será exibido o valor atual da variável e, na linha 5, esse valor será incrementado. Seguindo, a execução retorna para a linha 3, na qual a condição será reavaliada. Enquanto o valor da variável se mantiver menor ou igual a 10, o bloco será executado novamente. Quando o valor da variável atinge 11, a condição torna-se falsa, e o laço é encerrado.

Neste outro exemplo (@lst:while2), queremos exibir apenas os números mútiplos de 7 e que sejam menores que 100. Para tanto, combinamos a estrutura de repetição **`while`** com a estrutura condicional **`if`**.

```{ #lst:while2 caption="Exemplo (2) da estrutura de repetição 'while'" .js .number-lines}
let num = 1

while(num < 100) {
    if(num % 7 === 0) {
        document.write(contagem + '<br>')
    }
    num++
}
```
> **DICA**: para determinar se um número **a** é divisível por um número **b**, use o operador `%` (resto da divisão inteira), como foi feito na linha 4, e verifique se o valor retornado foi `0`. Ou seja, **a** será divisível por **b** se não houver resto na divisão.

Se a condição inicial do laço **`while`** for falsa, ele não será executado nenhuma vez (@lst:while3). Por isso, dizemos que **`while` não tem garantia de execução**.

```{ #lst:while3 caption="Exemplo (3) da estrutura de repetição 'while'" .js .number-lines}
let x = 20

/* A condição inicial é falsa;
   o loop não será executado */
while(x < 10) {
    document.write(x + '<br>)
    x-- // Equivale a: x = x - 1
}
```

## **`do..while`**

Como vimos, o bloco de instruções associado a um *loop* **`while`** pode nem ser executado se a condição for falsa no começo. Esse comportamento se dá porque **`while`** verifica a condição logo no início, antes mesmo de executar qualquer instrução de seu bloco.

Contudo, há situações em que desejamos que o bloco de instruções seja **executado pelo menos uma vez**. Imagine, por exemplo, que estejamos pedindo para o usuário informar um número.

