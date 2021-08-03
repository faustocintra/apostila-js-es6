# FUNÇÕES (básico)

Usualmente, *scripts* JavaScript (ou programas escritos na maioria das linguagens de programação) são executados em sequência, linha a linha. Vimos que essa sequência pode ser quebrada por meio das estruturas de controle condicionais, que permitem executar ou não determinado trecho de código caso uma condição seja verdadeira ou falsa. As estruturas de repetição, por seu turno, passam reiteradas vezes pelo mesmo bloco de código também dependendo da avaliação de uma condição.

Uma outra estrutura da linguagem que também "quebra" a execução sequencial são as funções. Trata-se de trechos de código, aos quais normalmente se dá um nome, que são escritos uma vez e podem ser invocados posteriormente uma ou mais vezes. A própria linguagem JavaScript já tem definidas várias funções, algumas das quais já usamos, como `alert()`, `prompt()` e `isNaN()`. De fato, como você irá aprender ao se aprofundar no conhecimento da linguagem, funções são o coração e a alma do JavaScript.

Além das funções prontas fornecidas pela linguagem, podemos também criar nossas próprias funções. É que vamos aprender a partir de agora.

## Declaração e chamada de função

O trabalho com funções, em geral, divide-se em duas partes: **declaração** e **chamada** de função. Observe a @lst:func1.

```{ #lst:func1 caption="Exemplo simples de declaração e chamadas de função" .js .number-lines}
// Declaração de função
function elevarAoCubo(n) {
    return n * n * n
}

// Chamada de função (1)
let res = elevarAoCubo(3)

console.log(res)                // Mostrará 27

// Chamada de função (2)
console.log(elevarAoCubo(5))    // Mostrará 125
```
> **OBSERVAÇÃO**: lembre-se de que, para ver a saída da função `console.log()`, você precisa pressionar a tecla `F12` e ativar a aba Console no navegador.

Vamos analisar o código por partes.

1. A **declaração** de uma função inicia-se pela palavra reservada **`function`** (linha 2), seguida do nome que queremos atribuir à função. A nomeação de funções segue as mesmas regras usadas para nomear variáveis.
2. Após o nome da variável, segue-se um par de parênteses, **que são obrigatórios**. Dentro dos parênteses pode haver os chamados **parâmetros**, também chamados **atributos**, que constituem **informações de entrada** para a função, ou seja, informações que a função recebe e que são necessárias para que ela execute o seu trabalho. Dentro da função, os parâmetros são usados como se fossem variáveis.
3. Aos parênteses, segue-se um bloco de código, delimitado por chaves (`{ }`). Esse bloco pode ter uma ou mais linhas de instruções. Uma função pode, também, produzir uma **informação de saída**, que é indicada pelo uso da palavra-chave **`return`** (linha 3).

Ou seja, entre as linhas 2 e 4 da listagem, temos declarada uma função, à qual demos o nome de `elevarAoCubo` e que recebe uma informação de entrada (o parâmetro `n`). No bloco de código da função, é calculado o valor do parâmetro `n` elevado ao cubo, o qual constitui a informação de saída da função, indicada por **`return`**. 

É importante notar que uma função **não é executada** no ponto onde foi declarada. Em outras palavras, é como se o JavaScript ignorasse o trecho das linhas 2 a 4, iniciando a execução desse *script* somente na linha 7. Mesmo porque, no momento da declaração da função, não sabemos ainda o valor do parâmetro `n` e, portanto, não seria efetuar o cálculo de elevação ao cubo.

1. Uma função é acionada efetivamente quando é feita uma **chamada** a ela, o que, no exemplo da @lst:func1, ocorreu duas vezes, nas linhas 7 e 12. Para fazer a chamada a uma função, usamos seu nome e, nos parênteses que se seguem, o valor dos parâmetros, caso esses tenham sido previstos na declaração.
2. No caso da chamada feita na linha 7, a informação passada para a função e que será recebida no parâmetro `n` é o valor `3`. Logo, a função irá calcular 3 elevado ao cubo e o valor resultante (`27`), a informação de saída, pode ser capturada em uma variável (`res`).
3. Já na chamada efetuada na linha 12, o valor passado para o parâmetro `n` foi `5` que, elevado ao cubo, resulta em `125`. Agora, em vez de capturar o resultado em uma variável para só então exibi-lo com `console.log()`, fizemos a chamada da função diretamente dentro de `console.log()`. Em suma, a **saída** da função `elevarAoCubo()` tornou-se a **entrada** de `console.log()`, e essa é apenas uma das muitas possibilidades de uso de funções.

Neste momento, talvez você esteja se perguntando: não seria mais simples escrever algo como `let res = 3 * 3 * 3` na linha 7 ou `console.log(5 * 5 * 5)` na linha 12, eliminando a necessidade de declarar e chamar uma função? De fato, esse é um exemplo simples, e, em uma situação prática, o uso de uma função não se justificaria.

Todavia, precisamos ter em mente que funções podem fazer tarefas mais complexas, e é nesses casos que elas se mostram mais úteis. Veja agora o exemplo da @lst:func2.

```{ #lst:func2 caption="Função para o cálculo do fatorial de um número inteiro" .js .number-lines}
// Declaração de função
function fatorial(x) {
    let resultado = x
    for(let i = x - 1; i > 1; i--) {
        resultado *= i
    }
    return resultado
}

// Chamadas de função
console.log(fatorial(5))    // 120
console.log(fatorial(7))    // 5040
```

Caso você não se lembre, o fatorial de um número inteiro `n` (representado por `n!`) é igual a ele mesmo multiplicado por seus antecessores até o número `1`. Ou seja, `5! = 5 * 4 * 3 * 2 * 1` e `7! = 7 * 6 * 5 * 4 * 3 * 2 * 1`. Repare que, no corpo da função (bloco de código), foram necessárias 5 linhas de código (de 3 a 7) para chegar ao resultado. Sem a função, para calcular o fatorial dos números 5 e 7, como foi feito nas linhas 10 e 11, precisaríamos escrever essas 5 linhas duas vezes, com pequenas modificações de valores, resultado em um *script* consideravelmente maior. Em situações assim, podemos constatar outra vantagem da utilização de funções, que é **evitar repetição de código**.

### Múltiplos parâmetros

Até agora, os exemplos que vimos mostraram funções que recebem apenas um parâmetro. No entanto, funções podem receber mais de um parâmetro, como mostra a @lst:func3.

```{ #lst:func3 caption="Função com dois parâmetros" .js .number-lines}
/* Declaração de uma função que gera um traço composto pelo
   caractere indicado, repetido quantas vezes for a quantidade
   especificada
*/
function gerarTraco(caract, quant) {
    let resultado = ''
    for(let i = 1; i <= quant; i++) {
        resultado += caract     // += aqui é concatenação
    }
    resultado += '<br>' // Adiciona quebra de linha
    return resultado
}

// Chamada de função que gera um traço com 20 asteriscos
document.write(gerarTraco('*', 20))

// Chamada de função que gera um traço com 50 sublinhados
document.write(gerarTraco('_', 50))
```

O exemplo da @lst:func3 serve também para ilustrar que funções não se aplicam apenas a tarefas de cálculos matemáticos. Nela, usamos uma função para gerar uma *string* de acordo com um padrão predeterminado pelos dois parâmetros. Note, na chamada de função da linha 15, que o valor `'*'` está sendo passado na primeira posição e, portanto, será recebido pela função no parâmetro `caract`. De forma semelhante, o valor `20`, passado na segunda posição, será recebido pela função no parâmetro `quant`. A conclusão a que chegamos é que **valores são passados a funções e recebidos nos parâmetros POR ORDEM**. Guarde essa informação, ela é importante.

Veja, agora, uma função com três parâmetros (@lst:func4).

```{ #lst:func4 caption="Função com três parâmetros" .js .number-lines}
/* Declaração de função que calcula a área de uma forma
   geométrica: retângulo (tipo 'R') ou triângulo (tipo 'T') */
function areaForma(base, altura, tipo) {
    let area
    switch(tipo) {
        case 'R':   // Retângulo
            area = base * altura
            break
        case 'T':   // Triângulo
            area = base * altura / 2
            break
        default:    // Forma inválida
            area = 0
    }
    return area
}

// O usuário informará a base, a altura e o tipo
let infoBase = parseFloat(prompt('Informe a base:'))
let infoAltura = parseFloat(prompt('Informe a altura:'))
let infoTipo = prompt('Informe o tipo (R ou T):')

// Chamada da função
let resArea = areaForma(infoBase, infoAltura, infoTipo)

alert('A área da forma é ' + resArea)
```

Nesse novo exemplo, não sabemos as informações que iremos passar à função no momento que escrevemos o código, pois é o usuário quem irá fornecê-las. Para tanto, temos primeiramente a declaração de três variáveis e seu respectivo preenchimento pelo usuário (linhas 19 a 21) e, depois, a chamada à função (linha 24) usando essas variáveis para passar os valores informados. Não é necessário que as variáveis tenham o mesmo nome dos parâmetros da função; afinal, já aprendemos que, na passagem de parâmetros, o que importa é a **ordem** dos valores.

### Funções sem parâmetros

É possível a existência de funções sem parâmetro, ou seja, funções que não necessitam de informações externas para fazer seu trabalho. Quando isso acontece, os parênteses que delimitam os parâmetros ficam vazios, mas não podem ser omitidos, seja na declaração, seja na chamada da função.

Aliás, **os parênteses são a marca registrada das funções**, tanto que é comum fazer referência a elas pelo nome seguido de parênteses, como já fizemos várias vezes nesta apostila. Dessa forma, em vez de escrever "função `alert`" em um texto, escrevemos "função `alert()`", com os parênteses, para melhor diferenciá-la do nome de uma variável.

Observe, na @lst:func5, a declaração de uma função sem parâmetros que retorna a hora atual do computador em formato de *string*. Para produzir o resultado, essa função faz chamadas a outras funções da linguagem JavaScript, que igualmente não levam parâmetros.

```{ #lst:func5 caption="Exemplos de funções sem parâmetros" .js .number-lines}
// Declaração de função: os parênteses dos parâmetros ficam vazios
function agora() {    // Retorna a hora atual do computador
    let hoje = new Date()
    // Veja, na linha abaixo, outras três funções que também não recebem parâmetros
    return hoje.getHours() + ':' + hoje.getMinutes() + ':' + hoje.getSeconds()
}

// Chamada à função: os parênteses da função se mantêm, mesmo vazios
alert('A hora atual é ' + agora())
```

### Funções sem valor de retorno

Funções também podem ser usadas para isolar trechos de códigos que desempenham uma tarefa mas não retornam valor algum. Veja como isso ocorre nos exemplos da @lst:func6.

```{ #lst:func6 caption="Exemplos de funções sem valor de retorno" .js .number-lines}
// Desenha na página um traço do tamanho especificado
function desenharTraco(tamanho) {
    for(let i = 1; i <= tamanho; i++) {
        document.write('-')
    }
    document.write('<br>')  // Quebra de linha
}

desenharTraco(30)  // Desenha um traço com 30 hífens

function exibirSaudacao(horaDia) {
    if(horaDia < 12) {
        alert('Bom dia!')
    }
    else if(horaDia < 18) {
        alert('Boa tarde!')
    }
    else if(horaDia <= 23) {
        alert('Boa noite!')
    }
    else {
        alert('ERRO: hora do dia inválida!)
    }
}

exibirSaudacao(14)  // Exibirá 'Boa tarde!'
```

## Expressão de função

## Onde declarar ou expressar funções no código

## Variáveis e funções