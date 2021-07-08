# Sobre

Apostila de JavaScript (EcmaScript 6+), nível básico, escrita e mantida pelo Prof. Fausto G. Cintra (<professor@faustocintra.com.br>).

O documento é disponibilizado sob a licença [Creative Commons BY-NC 4.0](https://creativecommons.org/licenses/by-nc/4.0/deed.pt_BR).

# Desenvolvimento

O texto é escrito em [Markdown](https://daringfireball.net/projects/markdown/) com algumas personalizações em [LaTeX](https://www.latex-project.org/) e convertido para PDF usando [Pandoc](https://pandoc.org/) associado ao mecanismo [LuaLaTeX](http://www.luatex.org/).

# Construção

O processo de construção é executado em uma instalação da distribuição [ManjaroWSL](https://github.com/sileshn/ManjaroWSL) rodando sob Windows [WSL2](https://docs.microsoft.com/pt-br/windows/wsl/install-win10).

## Dependências

São necessários os seguintes pacotes para a construção da apostila:

* `pandoc`
* `texlive-most`
* `pandoc`
* `pandoc-crossref`

São utilizadas duas fontes:

* **Rambla**, fonte principal, que pode ser obtida via [Google Fonts](https://fonts.google.com/specimen/Rambla).
* **Iosevka Booklet**, monoespaçada, que constitui um *build* customizado da fonte [Iosevka](https://github.com/be5invis/Iosevka) e está disponível na pasta `.fonts`.

## Comando de construção

O PDF da pasta `dist/` pode ser gerado a partir do código-fonte executando o comando

`bash -c ./build.sh`

# Colaboração

Colaborações via *issues* e *pull requests* são bem-vindas!