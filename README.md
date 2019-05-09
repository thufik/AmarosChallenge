# AmarosChallenge
Desafio Amaro

# Arquitetura

O aplicativo desenvolvido foi feito em MVP.

Prós : Totalmente testável por conta dos inúmeros protocolos criados em conjunto com a injeção de dependência.

Contras : É necessário criar muitos arquivos e protocolos. A leitura do código fica um pouco mais complicada.

# Testes unitários

Por ter sido feito em MVP, foi possível testar os principais fluxos do App.

Os testes unitários são feitos exclusivamente no presenter, que é o portador das regras de negócios

# Testes de Interface

Foi utilizado o pod Swifter para criação dos testes de interface. Por ser um teste de caixa preta, é necessário ter controle sobre as respostas do servidor. Nada melhor do que poder executar um "mini" servidor durante a execução dos testes.

# Expansão internacional

Como esse é um objetivo da Amaro, achei pertinente que o desafio também contemplasse esse desejo. O app desenvolvido está preparado para as linguagens português e inglês.

# Dificuldades

Perdi um certo tempo para executar o Swifter, pois, aparentemente, não é possível rodá-lo com o novo sistema de build do Xcode.

O app tem um bug, quando existem produtos com tamanho único, infelizmente não foi possível desenvolver a tela para esse cenário.

Também não foi possível desenvolver o filtro para os produtos.

Ambas features não foram desenvolvidas por conta do tempo.
