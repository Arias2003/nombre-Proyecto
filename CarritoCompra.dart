class Producto{
  String _nombre;
  double _precio;

  Producto(this._nombre, this._precio);

  String get nombre => this._nombre;
  set nombre(String nombProducto){
    if(nombProducto.length >= 3){
      this._nombre = nombProducto;
    }else{
      print('Nuevo nombre de producto es muy corto');
    }
  }

  double get precio => this._precio;
  void descuentoPrecio(double monto){
    this._precio -= monto;
  }

  void mostrarInformacion(){
    print('Nombre del Producto: $_nombre, Precio: ${_precio.toStringAsFixed(2)}');
  }
}

class ProductoDescuento extends Producto{
  double _porcentajeDescuento;

  ProductoDescuento(String nombre, double precio, this._porcentajeDescuento) : super(nombre, precio);

  
  void aplicarDescuento(){
    if(this._porcentajeDescuento > 0){
      double descuento = precio * this._porcentajeDescuento;
      descuentoPrecio(descuento);
      print('Se aplicó un descuento del ${(this._porcentajeDescuento * 100).toStringAsFixed(0)}%: \$${descuento.toStringAsFixed(2)}');
print('Total: \$${precio.toStringAsFixed(2)}');      
    }else{
      print('El descuento no se pude aplicar');
    }
  }

  @override
  void mostrarInformacion(){
    print('Nombre del Producto con descuento: $nombre');
  print('Precio final: \$${precio.toStringAsFixed(2)}');
  }
}

void main(){
  var iphone = ProductoDescuento('APPLE', 2000, 0.05);
  iphone.mostrarInformacion();
  iphone.aplicarDescuento();
  var samsung = Producto('Samsung',290123);
  samsung.mostrarInformacion();
}