import plagas.*
object hogar {
  var nivelMugreActual 
  var confortActual

  method esBueno() {
    return nivelMugreActual <= confortActual / 2
  }
  method aumentoDeMugre(plaga) {
    nivelMugreActual = nivelMugreActual + plaga.nivelDeDanio()
}
}

object huerta {
  var produccionComun
  const produccionMensual

  method produccion(){
    return produccionMensual
  }
  method esBueno(){
    return produccionMensual > produccionComun
  }
  method bajaProduccion() {
    produccionMensual = produccionMensual - Plagas.nivelDeDanio() * 0.1
    if (Plagas.transmitenEnfermedades()) {
      produccionMensual -= 10
    }
  } 
}

object mascota {
  var nivelDeSaludActual

  method esSaludable(unNumero){
    return nivelDeSaludActual > unNumero
  }
  method esBueno(){
    return nivelDeSaludActual > 250
  }
  method ataqueDePlaga(plaga) {
    if (plaga.transmitenEnfermedades()) {
      nivelDeSaludActual = nivelDeSaludActual - plaga.nivelDeDanio()
    }
  }
}

object barrio {
  var elementos = []
  var cantBuenos = 0

  method esCopado() {
    elementos.forEach({e => if (e.esBueno()) {cantBuenos += 1}})
    return cantBuenos > elementos.size() - cantBuenos
  }

}  