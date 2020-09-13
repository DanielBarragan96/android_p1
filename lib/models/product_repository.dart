import 'package:estructura_practica_1/models/product_dessert.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:estructura_practica_1/models/product_grains.dart';

enum ProductType { BEBIDAS, GRANO, POSTRES }

class ProductRepository {
  static List<dynamic> loadProducts(ProductType prodType) {
    // ----------------------              ----------------------------//
    // ----------------------       Tazas      ------------------------//
    // ----------------------              ----------------------------//

    // ----------------------              ----------------------------//
    // ----------------------       Postres      ----------------------//
    // ----------------------              ----------------------------//
    if (prodType == ProductType.POSTRES) {
      return <ProductDessert>[
        ProductDessert(
          productTitle: "Brownie",
          productDescription:
              "Es un bizcocho de chocolate pequeño, típico de la gastronomía de Estados Unidos. Se llama así por su color marrón oscuro, o brown en inglés.",
          productImage:
              "https://thesweetmolcajete.com/wp-content/uploads/2014/02/Receta-de-Brownies-Faciles-y-Rapidos-3-500x500.jpg",
          productSlice: ProductSlice.SINGLE,
          productAmount: 0,
        ),
        ProductDessert(
          productTitle: "Rollo de canela",
          productDescription:
              "El rollo de canela (también llamado pan de canela o espiral de canela) es un pan dulce creado en la década de 1920 en Suecia y Dinamarca. ",
          productImage:
              "https://t1.rg.ltmcdn.com/es/images/6/5/6/img_rollos_de_canela_faciles_23656_orig.jpg",
          productSlice: ProductSlice.SINGLE,
          productAmount: 0,
        ),
        ProductDessert(
          productTitle: "Flan",
          productDescription:
              "El flan es un postre que se prepara con huevos enteros, leche y azúcar.",
          productImage:
              "https://cdn2.cocinadelirante.com/sites/default/files/styles/gallerie/public/images/2019/11/porque-no-me-sale-bien-el-flan-casero.jpg",
          productSlice: ProductSlice.SINGLE,
          productAmount: 0,
        ),
        ProductDessert(
          productTitle: "Cheesecake",
          productDescription:
              "Popular en todo el mundo, su principal ingrediente es el queso crema. Su fondo es crujiente.",
          productImage:
              "https://t2.rg.ltmcdn.com/es/images/7/4/0/tarta_de_queso_y_limon_74047_600_square.jpg",
          productSlice: ProductSlice.SINGLE,
          productAmount: 0,
        ),
        ProductDessert(
          productTitle: "Pastel de limón",
          productDescription:
              "Es una tarta formada por una base de masa quebrada u hojaldre que se rellena con crema de limón.",
          productImage:
              "https://cdn2.cocinadelirante.com/sites/default/files/images/2017/07/paydelimoncontequilahelado1.jpg",
          productSlice: ProductSlice.SINGLE,
          productAmount: 0,
        ),
      ];
    }

    // ----------------------              ----------------------------//
    // ----------------------       Granos      -----------------------//
    // ----------------------              ----------------------------//
    if (prodType == ProductType.GRANO)
      return <ProductGrains>[
        ProductGrains(
          productTitle: "Lavazza",
          productDescription: "Endulzado con aromas florales.",
          productImage:
              "https://www.lavazza.it/content/dam/lavazza/products/caffe/macinato/moka/qualitaoro/new_render/tin_250_en/Tin-oro-en-250-thumb.png",
          productWeight: ProductWeight.KILO,
          productAmount: 0,
        ),
        ProductGrains(
          productTitle: "Guilis",
          productDescription: "La mezcla de cinco orígenes diferentes.",
          productImage:
              "https://www.cafesguilis.com/wp-content/uploads/2018/08/mezcla_especial_1Kg.jpg",
          productWeight: ProductWeight.KILO,
          productAmount: 0,
        ),
        ProductGrains(
          productTitle: "Illy",
          productDescription:
              "Con toque de chocolate, miel, caramelo y un cierto amargor. ",
          productImage:
              "https://http2.mlstatic.com/illy-cafe-en-grano-etiopia-arabica-seleccion-de-un-solo-or-D_NQ_NP_987783-MLM31233980209_062019-F.jpg",
          productWeight: ProductWeight.KILO,
          productAmount: 0,
        ),
        ProductGrains(
          productTitle: "Sanani",
          productDescription:
              "Tiene un muy buen sabor intenso y con fuerte acidez.",
          productImage:
              "https://http2.mlstatic.com/cafe-tostado-en-granos-1kg-origen-colombia-maquinas-express-D_NQ_NP_947249-MLA31115265526_062019-Q.jpg",
          productWeight: ProductWeight.KILO,
          productAmount: 0,
        ),
        ProductGrains(
          productTitle: "La Mexicana",
          productDescription:
              "Es un café único por la manera en la que están tostados sus granos.",
          productImage:
              "https://www.lamexicana.es/404-large_default/cafe-1890-mezcla-suave.jpg",
          productWeight: ProductWeight.KILO,
          productAmount: 0,
        ),
      ];
    // ----------------------                   -----------------------//
    // ----------------------       Bebida caliente      --------------//
    // ----------------------                   -----------------------//
    if (prodType == ProductType.BEBIDAS)
      return <ProductHotDrinks>[
        ProductHotDrinks(
          productTitle: "Ristretto",
          productDescription: "Expresso con una proporción menor de agua.",
          productImage:
              "https://ineedcoffee.com/wp-content/uploads/2007/09/IMG_9259.jpg",
          productSize: ProductSize.M,
          productAmount: 0,
        ),
        ProductHotDrinks(
          productTitle: "Americano",
          productDescription:
              "Derivado del espresso, con mayor cantidad de agua.",
          productImage:
              "https://cafe.omcns.com/wp-content/uploads/2018/08/Americano-2.jpg",
          productSize: ProductSize.M,
          productAmount: 0,
        ),
        ProductHotDrinks(
          productTitle: "Expresso",
          productDescription:
              "Uno de los tipos de café más básicos y sencillos.",
          productImage:
              "https://cdn.cnn.com/cnnnext/dam/assets/200120171537-espresso-machine-stock-large-169.jpg",
          productSize: ProductSize.M,
          productAmount: 0,
        ),
        ProductHotDrinks(
          productTitle: "Lungo",
          productDescription:
              "Aquí es directamente la infusión la que se produce en mayor cantidad.",
          productImage:
              "https://coffeegearx.com/wp-content/uploads/2019/08/What-Does-a-Lungo-Taste-Like.jpg",
          productSize: ProductSize.M,
          productAmount: 0,
        ),
        ProductHotDrinks(
          productTitle: "Café bombón",
          productDescription:
              "Se sustituye la leche normal por la leche condensada.",
          productImage: "https://ua.all.biz/img/ua/catalog/4944889.jpg",
          productSize: ProductSize.M,
          productAmount: 0,
        ),
        ProductHotDrinks(
          productTitle: "Mocca",
          productDescription:
              "Además de leche y café se emplea Mocolate o cacao.",
          productImage:
              "https://www.juanvaldezcafe.com/sites/default/files/mocca_grande.png",
          productSize: ProductSize.M,
          productAmount: 0,
        ),
        ProductHotDrinks(
          productTitle: "Café con leche",
          productDescription: "Incorporación de leche al café.",
          productImage:
              "https://www.goodfood.com.au/content/dam/images/3/f/6/p/i/image.related.articleLeadwide.620x349.3f2ru.png/1411331099390.jpg",
          productSize: ProductSize.M,
          productAmount: 0,
        ),
        ProductHotDrinks(
          productTitle: "Café vienés",
          productDescription: "Se acompaña en vez de leche con crema o nata.",
          productImage:
              "https://www.hogarmania.com/archivos/201105/vienes-xl-668x400x80xX.jpg",
          productSize: ProductSize.M,
          productAmount: 0,
        ),
        ProductHotDrinks(
          productTitle: "Macchiato",
          productDescription: "Expresso con una ligera cantidad de leche.",
          productImage:
              "https://www.nespresso.com/ncp/res/uploads/recipes/nespresso-recipes-Macchiato.jpg",
          productSize: ProductSize.M,
          productAmount: 0,
        ),
        ProductHotDrinks(
          productTitle: "Cappuccino",
          productDescription: "Un tercio de café y el resto leche.",
          productImage:
              "https://www.perfectdailygrind.com/wp-content/uploads/2019/02/cappuccino-1.png",
          productSize: ProductSize.M,
          productAmount: 0,
        ),
        ProductHotDrinks(
          productTitle: "Azteca",
          productDescription:
              "Además de café, hielo y leche una o más bolas de helado.",
          productImage:
              "https://www.gastronomiavasca.net/uploads/image/file/6838/w700_caf__azteca.jpg",
          productSize: ProductSize.M,
          productAmount: 0,
        ),
      ];
    return List(); // otherwise empty list
  }
}
