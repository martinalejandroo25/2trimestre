package EjerciciosPropuestos.Tienda;

public class TestTienda {
    public static void main(String[] args) {
        Producto peluchepulpo = new Producto("PulpitoBipolar", 15);
        Producto ssd255gb = new Producto("SSD255", 34);
        Producto Pico4VR = new Producto("GafasPico4", 399);

        Tienda mediaMark = new Tienda("MediaMark");

        mediaMark.addProducto(peluchepulpo);
        mediaMark.addProducto(ssd255gb);
        mediaMark.addProducto(Pico4VR);

        System.out.println(mediaMark);

        for(Producto pr : mediaMark.getProductos()){
            System.out.println(pr.getNombre() + " : " + pr.getPrecio() + "$");
        }
    }


}
