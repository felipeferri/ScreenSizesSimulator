# ScreenSizesSimulator
Use um único dispositivo iOS para testar seu app em todos os tamanhos de iPhone

Você testa em diferentes tamanhos de tela quando está desenvolvendo seus apps? Você sabe que deveria né?

Rodar o mesmo app em simuladores diferentes demora muito e ter vários dispositivos para teste é inviável para muitos de nós. É por isso que o Screen Sizes Simulator pode ser uma boa idéia para você.

Screen Sizes Simulator é um storyboard de modelo e um painel de controle que te permitem rodar seu app em telas imitando todos os tamanhos de iPhone atuais. Veja nas imagens abaixo o que quero dizer. Todas as imagens foram obtidas rodando no imulador de iPhone 6 o app de demo inclído neste repositório.

iPhone6 regular size             |  iPhone5 size on iPhone6
:-------------------------:|:-------------------------:
![](/../screenshots/screenshots/iPhone6.png)  |  ![](/../screenshots/screenshots/iPhone5_panel.png)

iPhone4 size on iPhone6             |  iPhone4 size landscape
:-------------------------:|:-------------------------:
![](/../screenshots/screenshots/iPhone4_panel.png)  |  ![](/../screenshots/screenshots/iPhone4_landscape.png)

Se você executar o Screen Sizes Simulator em um iPad você pode rodar seu app em todos os tamanhos de iPhone e eles aparecerão no tamanho real do dispositivo. Talvez, como eu, você tenha um iPhone 4S e você gostaria de ver como ficaria o layout do iPhone 6. Neste caso você pode usar a opço "fit" no painel para fazer um zoom out do aplicativo até que ele encaixe na tela, mantendo as proporções dos elementos de UI.

***
## Instalando o Screen Sizes Simulator em seu app
Se tiver dúvidas dá uma olhada no projeto de demo.

1. Copie a pasta "Screen Sizes" em seu projeto no Xcode.
2. Localize o seu Initial View Controller no storyboard de seu projeto e altere o Storyboard ID para "SwipeViewController" no Identity Inspector.
3. Abra o storyboard SizesSimulator e se assegure de que o bloco de Storyboard reference está apontando para o seu storyboard principal. Se você manteve o seu storyboard principal com o nome Main não precisará fazer nada.
4. Abra o target de seu projeto na aba General e mude a Main Interface para "SizesSimulator".
5. Execute seu projeto no simulador ou em um dispositivo e tudo deverá funcionar ok.

Lembre-se de trocar seu Main Interface de volta para seu storyboard principal quando for lançar seu app na AppStore. Se você tiver coragem pode criar um target específico para o Screen Sizes Simulator em vez de alterar o seu target principal. No app de demo tem um exemplo disto.

## Usando o Screen Sizes Simulator
O Screen Sizes Simulator tem um pequeno painel de controle no topo. Se você tocá-lo ele irá desaparecer; se você
 sacudir o seu dispositivo ele irá aparecer de novo.

Você pode selecionar quatro tamanhos de iPhone diferentes: iPhone4S, iPhone5/SE, iPhone6S/7S, iPhone6S+/7S+.

Também pode selecionar quatro níveis de zoom: 1x, 2x, fit and fill.

* 1x mostra o tamanho de tela normal. Você deve usar esta opção quando for executar seu app em um dispositivo maior do que a tela que você quer mostrar (por exemplo, ao selecionar a tela de iPhone5S em um iPhone6S).
* 2x mostra o dobro do tamanho da tela. Isto só é útil se você estiver rodando seu app em um iPad. É semelhante à opção de zoom que aparece quando você roda um app de iPhone (não universal) em um iPad.
* fit vai aplicar um nível de zoom que encaixa a tela do app no tamanho de tela atual, mantendo as proporções. Isto é o ideal quando você quiser selecionar telas maiores do que a de seu telefone. Por exemplo para mostrar o tamanho do iPhone6S em um iPhone4S.
* fill vai aplicat um nível de zoom que enche a tela com o tamanho selecionado.

## A fazer (pull requests são bem vindos)
* Criar um cocoapod
* Fazer uma versão do Simulador em código que não exija ficar configurando targets e info.plists.
* Se você usa classes de tamanhos o simulador não irá responder corretamente em um iPad porque as classes de tamanho para altura e largura do iPad são diferentes daquelas do iPhone. Não sei como resolver este problema.
