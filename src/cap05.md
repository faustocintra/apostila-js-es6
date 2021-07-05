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

>> **OBSERVAÇÃO**: as chaves são opcionais quando há uma única linha de código atrelada à estrutura `if`,. No entanto, até que você esteja bem familiarizado(a) com a sintaxe do JavaScript, recomendo que você sempre use as chaves.

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