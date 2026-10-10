import example.*
class Plagas {

    method poblacion();
    method nivelDeDanio();
    method transmitenEnfermedades()
}

class Cucarachas inherits Plagas {

    method pesoPromedio() {
        return self.poblacion() * 0.8
    }
    method override nivelDeDanio(){
        return self.poblacion() / 2
    }
    method override transmitenEnfermedades(){
        return self.pesoPromedio() >= 10 and 
        self.poblacion() > 10
    }
}

class Garrapatas inherits Plagas{
    super(Cucarachas.nivelDeDanio() and Cucarachas.transmitenEnfermedades())

}

class Mosquitos inherits Plagas{
    method override nivelDeDanio(){
        return self.poblacion()
    }
    method override transmitenEnfermedades(){
        if(self.poblacion() % 3 == 0 and self.poblacion() >= 10)
            return true 
        else 
            return false    
    }
}