package carrito;

import java.util.ArrayList;
import java.util.List;

public class CarritoDeCompras {

	private ArrayList<ArticulosSolicitado> articulosSolicitados;
	public CarritoDeCompras(){
		articulosSolicitados = new ArrayList<ArticulosSolicitado>();
	}
	public List<ArticulosSolicitado> getArticulossolicitados(){
		return articulosSolicitados;
	}
	
	public synchronized void agregarArticulo(String idArticulo){
		ArticulosSolicitado artSolicitado;
		for (int i = 0; i < articulosSolicitados.size(); i++) {
			artSolicitado = articulosSolicitados.get(i);
			if(artSolicitado.getIdArticulo().equals(idArticulo)){
				artSolicitado.incrementaNumArticulos();
				return;
			}
		}
		
		ArticulosSolicitado nuevoArtSolicitado = new ArticulosSolicitado(Catalogo.getArticulo(idArticulo));
		articulosSolicitados.add(nuevoArtSolicitado);
	}
	
	public synchronized void setNumeroDeOrden(String idArticulo,int numOrden){
		ArticulosSolicitado articulosSolicitado;
		for (int i = 0; i < articulosSolicitados.size(); i++) {
			articulosSolicitado = articulosSolicitados.get(i);
			if(articulosSolicitado.getIdArticulo().equals(idArticulo)){
				if(numOrden <= 0){
					articulosSolicitados.remove(i);
				} else {
					articulosSolicitado.setNumArticulo(numOrden);
				}
				return;
			}
		}
		ArticulosSolicitado nuevaOrden = new ArticulosSolicitado(Catalogo.getArticulo(idArticulo));
		articulosSolicitados.add(nuevaOrden);
	}
	
}
