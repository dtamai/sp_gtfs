# sp_gtfs

Utilitários para ajudar com o arquivo GTFS da SPTrans.

## Ferramentas necessárias

* [R](http://www.r-project.org/)
* [TopoJSON](https://github.com/mbostock/topojson/wiki)
* [jq](http://stedolan.github.io/jq/)

Os dados do GTFS podem ser encontrados na [área de desenvolvedores da SPTrans](http://sptrans.com.br/desenvolvedores/).

## Modificações

### Redução no arquivo shapes.txt

* descartar colunas não-essenciais
    As colunas *shape_pt_sequence* e *shape_dist_traveled* não são necessárias para identificar o traçado, depois de ordenadas por *shape_pt_sequence*.
* simplificar dados dos pontos
    Ao invés de guardar todos os pontos com precisão absoluta, os pontos são convertidos em números inteiros de um outro sistema de coordenadas, que é apenas uma transformação do original: escala + translação. Isso é feito com ajuda do TopoJSON.

Resultados:

| Método | Tamanho dos dados |
|:------ | -----------------:|
| Arquivo original |    8,9M |
| Descartar colunas |   4,7M |
| Simplificar pontos |  3,5M |

