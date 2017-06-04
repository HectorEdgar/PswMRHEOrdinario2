package carrito;

public class Catalogo {
	private static Articulo[] articulos = {
			new Articulo("hall001", "Pizza mediana italiana de peperoni con queso",
					"pizza mediana. Ingedientes: harina, queso, peperoni, salami, tomate, cebolla, oregano, aceite de oliva , etc.",
					50.0,""),
			new Articulo("hall002", "Pizza grande italiana de peperoni con queso",
					"pizza grande. Ingedientes: harina, queso, peperoni, salami, tomate, cebolla, oregano, aceite de oliva , etc.",
					100.0,""),
			new Articulo("lewis001", "Pasta mediana italiana a la bolognesa",
					"pasta mediana. Ingedientes: harina, queso, salami, tomate, cebolla, oregano, aceite de oliva , etc.",
					80.0,""),
			new Articulo("alexander001", "Pasta grande italiana a la bolognesa",
					"pizza grande. Ingedientes: harina, queso, peperoni, salami, tomate, cebolla, oregano, aceite de oliva , etc.",
					30.0,""),
			new Articulo("rowling001", "Pizza chica italiana de peperoni con queso",
					"pizza chica. Ingedientes: harina, queso, peperoni, salami, tomate, cebolla, oregano, aceite de oliva , etc.",
					20.0,""),
			new Articulo("pepsi", "Bebida gaseosa sabor Cola",
					"Pepsi, antes conocida como Pepsi-Cola, es una bebida carbonatada de cola originaria de Estados Unidos y producida por la compañía PepsiCo. Su mayor competidora es la también estadounidense Coca-Cola.",
					10.0,""),
			new Articulo("cocaCola", "Bebida gaseosa sabor Cola",
					"Coca-Cola es una bebida gaseosa y refrescante, vendida a nivel mundial, en tiendas, restaurantes y máquinas expendedoras en más de doscientos países o territorios.",
					10.0,"")

	};

	public static Articulo getArticulo(String idArticulo) {
		if (idArticulo != null) {
			for (int i = 0; i < articulos.length; i++) {
				if (articulos[i].getIdArticulo().equals(idArticulo)) {
					return Catalogo.articulos[i];
				}

			}
		}
		return null;
	}

}
