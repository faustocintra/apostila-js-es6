# ESTRUTURAS CONDICIONAIS

Instruções em programas de computador são normalmente executadas em sequência, uma após as outras. No entanto, existem situações nas quais existe mais de uma possibilidade, e precisamos fazer um **desvio condicional**: seguir por um ou por outro caminho de acordo com o resultado de uma decisão. Para fazer isso, precisamos das estruturas condicionais.

## A estrutura **`if`**

A estrutura condicional mais simples é **`if`**. Seu formato é o seguinte:

```
if(condição) {
    Instrução ou instruções a serem executadas
}
```

Algumas observações:

1. **`if`** é uma palavra reservada do JavaScript, e, como todas elas, é escrita **em minúsculas**.
2. Os **parênteses** em torno da condição **são obrigatórios**.
3. Condição é um valor booleano, ou que se resolve em um valor booleano (**`true`** ou **`false`**).
4. Depois do parêntese de fechamento da condição, segue-se uma chave de abertura (`{`). Ele indica o início do bloco de instruções que será executado **apenas se a condição for verdadeira**.
5. Uma chave de fechamento (`}`) marca o final do bloco de instruções.

> **OBSERVAÇÃO**: as chaves são opcionais quando há uma única linha de código atrelada à estrutura `if`,. No entanto, até que você esteja bem familiarizado(a) com a sintaxe do JavaScript, recomendo que você sempre use as chaves.

Vejamos um exemplo prático na @lst:if.

```{ #lst:if caption="Exemplo (1) da estrutura condicional 'if'" .js .number-lines}
let resposta

resposta = confirm('Deseja realmente continuar?')

if(resposta) {
    alert('Você decidiu continuar.')
}
```

Recorde que `confirm()` retorna um valor booleano, de acordo com a resposta dada pelo usuário na caixa de diálogo. O `alert()` da linha 6 será executado somente se a resposta tiver sido `OK`.

Mais um exemplo (@lst:if2):

```{ #lst:if2 caption="Exemplo (2) da estrutura condicional 'if'" .js .number-lines}
let nota1 = 7, nota2 = 8, media

media = (nota1 + nota2) / 2

if(media >= 6) {
    document.write('Média final: ' + media + ', maior ou igual a 6.')
    document.write('Situação: APROVADO')
}
```

Neste outro exemplo, a condição é uma expressão que se resolve em um valor booleano. Afinal, ou a média é maior ou igual a 6 (**`true`**) ou é menor que 6 (**`false`**). As instruções das linhas 6 e 7 serão executadas apenas no primeiro caso.

### `if..else`

Se você for observador(a), deve ter notado que tínhamos **duas** possibilidades em cada uma das listagens anteriores. E pode estar se perguntado: que mensagem o usuário verá se decidir não continuar ou se a média tiver ficado abaixo de 6?

Na verdade, nenhuma mensagem será exibida naqueles casos, pois tratamos apenas uma das possibilides: aquela em que a condição se resolve em **`true`**. Para lidar também com as possibilidades falsas, precisamos acrescentar o bloco **`else`** abaixo do **`if`**.

```
if(condição) {
    Instruções a serem executadas se a condição for verdadeira
}
else {
    Instruções a serem executadas se a condição for falsa
}
```

Quero chamar a sua atenção para o fato de que tanto o **`if`** quanto o **`else`** **têm seu próprio par de chaves**. Ou seja, antes de escrever o **`else`**, você deve fechar a chave do bloco do **`if`**.

Vejamos como fica o primeiro exemplo anterior, agora com **`else`** (@lst:if-else):

```{ #lst:if-else caption="Exemplo (1) da estrutura condicional 'if' com 'else'" .js .number-lines}
let resposta

resposta = confirm('Deseja realmente continuar?')

if(resposta) {
    alert('Você decidiu continuar.')
}
else {
    alert('Pediu para parar, parou.')
}
```

E também o segundo exemplo (@lst:if-else2):

```{ #lst:if-else2 caption="Exemplo (2) da estrutura condicional 'if' com 'else'" .js .number-lines}
let nota1 = 7, nota2 = 8, media

media = (nota1 + nota2) / 2

if(media >= 6) {
    document.write('Média final: ' + media + ', maior ou igual a 6.')
    document.write('Situação: APROVADO')
}
else {
    document.write('Média final: ' + media + ', menor que 6.')
    document.write('Situação: REPROVADO')
}
```
_____

## PROBLEMA REAL: conversão de tipos {.unnumbered}

Agora que já aprendemos a estrutura condicional básica, temos condições de resolver alguns problemas práticos. Tente executar o programa da @lst:typconv.

```{ #lst:typconv caption="Programa simples para somar dois números inteiros" .js .number-lines}
let num1, num2, soma

num1 = prompt('Informe um número inteiro:')
num2 = prompt('Informe outro número inteiro:')

soma = num1 + num2

document.write('A soma dos dois inteiros informados é ' + soma)
```

Se você tiver feito o teste, talvez esteja decepcionado(a) agora. Isso porque, não importa quais números tenham sido informados, não veremos uma soma - e sim a concatenação dos dois valores informados.

São dois os motivos desse resultado:

1. **A função `prompt()` sempre vai retornar seu valor como *string***, mesmo que o usuário tenha informado valores numéricos.
2. **O operador `+`**, como sabemos, **concatena seus operandos caso pelo menos um deles seja *string***.

Portanto, precisamos converter as *strings* informadas em números antes de efetuar a soma. A forma mais comum de fazer essa conversão é usando a função `parseInt()`. Podemos usá-la em conjunto com a função `prompt()`, como mostrado na @lst:typconv2.

```{ #lst:typconv2 caption="Programa simples para somar dois números inteiros, usando 'parseInt()'" .js .number-lines}
let num1, num2, soma

// Note o uso da função parseInt() nas duas linhas a seguir
num1 = parseInt(prompt('Informe um número inteiro:'))
num2 = parseInt(prompt('Informe outro número inteiro:'))

soma = num1 + num2

document.write('A soma dos dois inteiros informados é ' + soma)
```
> **ATENÇÃO** ao nome da função. `parseInt` é escrita com inicial **minúscula**, e o `I` de `Int` é **maiúsculo**. JavaScript é uma linguagem sensível à diferença entre letras maiúsculas e minúsculas, você se lembra?

Essa nova versão funcionár corretamente **caso o usuário informe *strings* que possam ser convertidas para números**. Mas, o que acontecerá se o usuário informar, por exemplo, `batata` ou `gsfdjghfdljgh`? A função **`parseInt()` não conseguirá efetuar a conversão**, e **retornará o valor especial `NaN`** (*Not a Number*).

Podemos detectar se a tentativa de conversão falhou usando uma outra função, `isNaN()`, que, como seu próprio nome indica, retorna **`true`** se o valor testado for igual a `NaN`. Com o uso dessa função e de uma estrutura condicional **`if..else`**, chegamos à versão definitiva e robusta do nosso programa de soma de números inteiros (@lst:typconv3).

```{ #lst:typconv3 caption="Programa simples para somar dois números inteiros, usando 'parseInt()' e 'isNaN()'" .js .number-lines}
let num1, num2, soma

num1 = parseInt(prompt('Informe um número inteiro:'))
num2 = parseInt(prompt('Informe outro número inteiro:'))

// Se a conversão de num1 OU se a conversão de num2 tiver falhado:
if(isNaN(num1) || isNaN(num2)) {
    alert('Algum dos valores informados não é um número!')
}
// Se conversão tiver sido bem sucedida
else {
    soma = num1 + num2
    document.write('A soma dos dois inteiros informados é ' + soma)
}
```
> **ATENTE-SE-** ao uso de letras maiúsculas e minúsculas no nome da função `isNaN()`.

_____

### `if..else if..else`