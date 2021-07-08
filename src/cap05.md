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

> **OBSERVAÇÃO**: as chaves são opcionais quando há uma única linha de código atrelada à estrutura **`if`**. No entanto, até que você esteja bem familiarizado(a) com a sintaxe do JavaScript, recomendo que sempre use as chaves.

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

### **`if..else`**

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
### PROBLEMA REAL: conversão de tipos {.unnumbered}

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


### **`if..else if..else`**

Há casos em que apenas duas saídas em uma estrutura condicional não são suficientes. Suponha que precisemos converter a nota de um aluno, um valor numérico, em um conceito alfabético, segundo a @tbl:conceitos.

| Faixa de notas | Conceito |
|:-:|:-:|
| 9 a 10 | A |
| 7 a 8,9 | B |
| 5 a 6,9 | C |
| 3 a 4,9 | D |
| 0 a 2,9 | E |
: Tabela de conversão entre notas e conceitos {#tbl:conceitos}

Suponha, ainda, que é o usuário quem irá digitar a nota a ser convertida para conceito (usando `prompt()`), e, obviamente, ele tem a possibilidade de digitar algo que não é um valor numérico ou mesmo fora dos limites entre 0 e 10.

Logo, temos nada menos do que seis possibilidades, uma para cada conceito e mais uma para o caso de nota inválida. Para lidar com essa situação, usamos a estrutura **`if..else if..else`**, como demonstra a @lst:ifelif.

```{ #lst:ifelif caption="Exemplo de uso da estrutura condicional 'if..else if..else'" .js .number-lines}
let nota, conceito

/* Number() efetua conversão de string para números,
   aceitando valores fracionários */
nota = Number('Informe a nota (entre 0 e 10)')

if(nota >= 9) {             // Possibilidade nº 1
    conceito = 'A'
}
else if(nota >= 7) {        // Possibilidade nº 2
    conceito = 'B'
}
else if(nota >= 5) {        // Possibilidade nº 3
    conceito = 'C'
}
else if(nota >= 3) {        // Possibilidade nº 4
    conceito = 'D'
}
else if(conceito >= 0) {    // Possibilidade nº 5
    conceito = 'E'
}
// Nota não numérica ou fora da faixa entre 0 e 10
else {                      // Possibilidade nº 6
    alert('ERRO: nota inválida')
}

document.write('Conceito: ' + conceito)
```
\clearpage

Vamos analisar os principais pontos desse programa.

* Na linha 5, usamos a função `Number()` (note o `N` maiúsculo) para fazer a conversão do valor que usuário digitar no `prompt()` para número. Ela trabalha de modo semelhante à `parseInt()`, mas aceita valores fracionários, como é o caso das notas.

> Existe também a função `parseFloat()`, que produz o mesmo efeito que `Number()`.

* Nas linhas 10, 13, 16 e 19, encadeamos um **`else`** imediatamente a um novo **`if`**. Note que, ao contrário do que acontece em outras linguagens de programação, **`else if`** são **duas palavras separadas**.
* A última possibilidade (linha 23) conta apenas com um **`else`**, recaindo sobre ela qualquer valor não manipulado pelas possibilidades anteriores.

## A estrutura **`switch..case`**

A estrutura **`if..else if..else`** nos oferece uma forma de lidar com várias possibilidades. Observe este outro programa, que recebe um número entre 1 e 7 e retorna o dia da semana correspondente (@lst:switch1).

```{ #lst:switch1 caption="Outro exemplo de uso da estrutura condicional 'if..else if..else'" .js .number-lines}
let diaNum

diaNum = parseInt(prompt('Informe o dia da semana (entre 1 e 7):'))

if(diaNum === 1) {
    alert('domingo')
}
else if(diaNum === 2) {
    alert('segunda-feira')
}
else if(diaNum === 3) {
    alert('terça-feira')
}
else if(diaNum === 4) {
    alert('quarta-feira')
}
else if(diaNum === 5) {
    alert('quinta-feira')
}
else if(diaNum === 6) {
    alert('sexta-feira')
}
else if(diaNum === 7) {
    alert('sábado')
}
else {
    alert('ERRO: dia inválido')
}
```

Nesse programa, temos algumas características bastante peculiares. Vejamos:

* **todos os testes feitos foram de igualdade**; e
* **a mesma variável foi testada em todos os casos** (a variável `diaNum`).

Ou seja, em cada **`if`** ou **`else if`**, escrevemos o nome da mesma variável e vamos testando-a contra diferentes valores.

Uma outra de testar uma única variável contra uma série de valores diferentes é usando a estrutura **`switch..case`**. Uma primeira tentativa de uso dessa estrutura resultaria na @lst:switch2.

```{ #lst:switch2 caption="A estrutura 'switch..case', ainda sem 'breaks'" .js .number-lines}
let diaNum

diaNum = parseInt(prompt('Informe o dia da semana (entre 1 e 7):'))

switch(diaNum) {
    case 1:
        alert('domingo')
    case 2:
        alert('segunda-feira')
    case 3:
        alert('terça-feira')
    case 4:
        alert('quarta-feira')
    case 5:
        alert('quinta-feira')
    case 6:
        alert('sexta-feira')
    case 7:
        alert('sábado')
    default:
        alert('ERRO: dia inválido')
}
```

\clearpage

Observemos os detalhes.

1. A estrutura **`switch..case`** inicia-se com a palavra **`switch`**, seguida do nome da variável a ser testada entre parênteses e uma chave de abertura (linha 5). Essa chave só será fechada no final da estrutura (no nosso programa, na linha 22).
2. Há um **`case`** para cada valor a ser testado, seguido de dois pontos (linhas 6, 8, 10, 12, 14, 16 e 18).
3. Por fim, temos o caso **`default`**, que funciona como o "else" do **`switch..case`**. Ou seja, se a execução não entrar em nenhum **`case`**, cairá ali.

No entanto, ao executar esse programa como apresentado, veremos um resultado estranho. Se o usuário informar o número 4, por exemplo, verá não apenas a mensagem "quarta-feira", mas todas as que se seguem, inclusive a mensagem de erro do **`default`**.

Fique tranquilo(a), você não fez nada de errado. Mas é preciso entender um pouco melhor como funciona a estrutura **`switch..case`**.

Cada **`case`** é um ponto de entrada dentro da estrutura. Quando a execução encontra um **`case`** compatível, ela entra no **`switch..case`** naquele ponto e prossegue executando linha a linha até o término da estrutura. Pode paracer estranho, mas os projetistas da linguagem a conceberam para se comportar exatamente assim. E isso tem suas vantagens, como veremos mais adiante.

Mas... como fazer com que a estrutura execute apenas o código associado ao **`case`** do valor informado?

### **`break`**

O que precisamos fazer é interromper o fluxo da execução uma vez que o código associado ao **`case`** tenha sido processado. Isso é feito colocando-se a palavra-chave **`break`** ao final de cada **`case`**, como mostrado na @lst:switch3.

```{ #lst:switch3 caption="A estrutura 'switch..case', agora com 'breaks'" .js .number-lines}
let diaNum

diaNum = parseInt(prompt('Informe o dia da semana (entre 1 e 7):'))

switch(diaNum) {
    case 1:
        alert('domingo')
        break
    case 2:
        alert('segunda-feira')
        break
    case 3:
        alert('terça-feira')
        break
    case 4:
        alert('quarta-feira')
        break
    case 5:
        alert('quinta-feira')
        break
    case 6:
        alert('sexta-feira')
        break
    case 7:
        alert('sábado')
        break
    default:
        alert('ERRO: dia inválido')
}
```

Note a instrução **`break`** nas linhas 8, 11, 14, 17, 20, 23 e 26. Ela faz com que a execução, uma vez que a encontre, interrompa o processamento do **`switch..case`** e prossiga na primeira linha após a chave de fechamento da estrutura.

O caso **`default`** não precisa de **`break`** porque, estando por último, o processamento da estrutura termina logo após, de qualquer forma.

### **`case`**s vazios

Imaginemos uma situação em que o usuário tenha que escolher entre três alternativas, digamos, A, B e C. Podemos usar `prompt()` para obter a escolha, mas esta pode ser informada tanto em letras maiúsculas quanto em letras minúsculas. Ou seja, tanto `A` quando `a` representam a mesma opção.

Se tivéssemos usando uma sequência **`if..else if..else`**, deveríamos escrever algo como:
```{.js}
// (...)
if(opcao === 'A' || opcao === 'a') {
    // (...)
}
else if(opcao === 'B' || opcao === 'b') {
// (...)
}
// (...)
else {
    // (...)
}
// (...)
```

A estrutura **`switch..case`** traz uma solução mais elegante quando mais de um valor leva à mesma ação. São os chamados **`case`**s vazios. Veja como funciona na @lst:switch4.

```{ #lst:switch4 caption="A estrutura 'switch..case' com 'case's vazios" .js .number-lines}
let opcao

opcao = prompt('Qual sua escolha? (A, B ou C)')

switch(opcao) {
    case 'A':   // case vazio
    case 'a':
        alert('Você escolheu a opção A.')
        break
    case 'B':   // case vazio
    case 'b':
        alert('Você escolheu a opção B.')
        break
    case 'C':   // case vazio
    case 'c':
        alert('Você escolheu a opção C.')
        break
    default:
        alert('ERRO: opção não reconhecida.')
}
```

Observe os **`case`**s das linhas 6, 10 e 14. Não há nenhuma ação (nenhum `alert()`) associada a eles, **nem mesmo possuem um `break`**. Ainda assim, eles constituem pontos de entrada da execução na estrutura **`switch..case`**, prosseguindo a partir daí linha a linha até atingir a próxima instrução **`break`** ou o final da estrutura.

Se o usuário, por exemplo, informar a opção `B` (maiúscula), a execução entrará no **`switch..case`** pela linha 10 e continuará até a linha 13, passando pelo `alert()` da opção B na linha 12.

Enfim, os **`case`**s vazios constituem o motivo pelo qual o projeto da linguagem exige o **`break`** ao final de um **`case`** que contenha, efetivamente, uma ação. Essa é uma característica que JavaScript herdou da linguagem C, estando presente também em outras linguagens da família, como C++, C#, PHP e Java.

### Limitação

A estrutura **`switch..case`** é muito prática quando se trata de comparar o conteúdo de uma única variável contra vários valores diferentes. No entanto, a **única comparação possível** na estrutura **é a de igualdade**. Colocar operadores após a palavra **`case`** nem sempre é erro de sintaxe em JavaScript, mas é erro de lógica, porque o programa não se comportará como esperado. 

Portanto, problemas como o da @lst:ifelif (conversão de nota em conceito) não podem ser resolvidos com **`switch..case`**.

## O operador ternário

Uma ocorrência bastante comum em programação é o resultado de uma condição determinar o valor de uma variável. Por exemplo:

```{.js}
let media, status

// (...)

if(media >= 6) {
    status = 'APROVADO'
}
else {
    status = 'REPROVADO'
}
```

Ou, então, o texto de uma saída depender de uma condição:

```{.js}
let pais

// (...)

if(pais === 'Brasil') {
    document.write('brasileiro(a)')
}
else {
    document.write('estrangeiro(a)')
}
```

Em ambas podemos detectar:

1. **Uma situação com duas saídas**, uma para o caso de a condição ser verdadeira (**`if`**) e outra se ela for falsa (**`else`**).
2. Os blocos associados tanto ao **`if`** quanto ao **`else`** têm, cada qual, **apenas uma linha de código**.

Nessas ocasiões, podemos escrever o programa de forma mais sucinta usando o operador ternário, cuja sintaxe é a seguinte:

```
condição ? ação se verdadeiro : ação se falso
```

> O nome **operador ternário** deve-se ao fato de ser o único operador da linguagem que exige **três** operandos.

Para usá-lo, devemos obedecer à sequência:

1. Primeiramente, escrevemos a condição, a mesma que seria informada no bloco **`if`** (*1º operando*).
2. Em seguida, colocamos o caractere **`?`** (ponto de interrogação), como se, de fato, estivéssemos fazendo uma pergunta baseada na condição.
3. Logo em seguida, vem a ação ou valor que o operador assumirá caso a condição seja verdadeira (*2º operando*).
4. Segue-se o caractere **`:`** (dois pontos), que serve como separador entre a parte "verdadeira" e a parte "falsa" do operador.
5. Por fim, colocamos a ação ou valor assumido se a condição restar falsa (*3º operando*).

Usando o operador ternário, poderíamos escrever os exemplos anteriores conforme mostram a @lst:opter1 e a @lst:opter2.

```{ #lst:opter1 caption="Exemplo (1) de uso do operador ternário" .js .number-lines}
let media, status

// (...)

status = media >= 6 ? 'APROVADO' : 'REPROVADO'
```

```{ #lst:opter2 caption="Exemplo (2) de uso do operador ternário" .js .number-lines}
let media, status

// (...)

document.write(pais === 'Brasil' ? 'brasileiro(a) : 'estrangeiro(a)')
```

Bem menos código, não é mesmo? ;)

____________

Com as estruturas condicionais, temos agora um maior **controle** sobre nossos programas, e conseguimos também fazer coisas bastante úteis. Eu não quero ser **repetitivo**, mas seu controle sobre o código aumentará ainda mais no próximo capítulo. 