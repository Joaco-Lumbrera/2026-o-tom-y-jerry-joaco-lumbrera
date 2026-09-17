object casa{
  
  var cuidador = tom
  var quilombero = [tuffy,jerry]

  var suciedad = 10000

  method cantidadSuciedad() = suciedad
  method hayRuido() {
    cuidador.interrumpirSuenio()
  }

  method reducirSuciedad(cantidadSuciedad) {
    suciedad=suciedad-cantidadSuciedad
  }

  method aumentarSuciedad(cantidadSuciedad) {
    suciedad = suciedad + cantidadSuciedad
  }

  method pasarElDia() {
    cuidador.limpiarCasa()
    if(cuidador.puedeAtraparlo()) cuidador.sacarAlQuilombero()
  }
  method pasarLaNoche() {
    if(quilombero.size()>0) {
      quilombero.hacerQuilombo(self)  
      cuidador.dormir()
    }
  }

}


object robocat {
  method limpiarCasa(hogar) {
    var total = hogar.suciedad()
    hogar.reducirSuciedad(total)
  }

  method puedeAtrapar(quilombero) = true

  method dormir() = true
}

object tom {
  var energia= 100
  method velocidad() = 5 + (energia/10)

  method limpiarCasa(hogar){
    energia = energia-40
    hogar.reducirSuciedad(100)
  }

  method puedeAtrapar(quilombero) = quilombero.velocidad()<self.velocidad()

  method interrumpirSuenio() {

    energia = energia-20

  }
  method dormir() {
    energia = energia + 50
  }
}

object jerry {
  var peso = 1

  method hacerQuilombo(hogar) {
    hogar.aumentarSuciedad(110)
    peso = peso+1
  }

  method velocidad() = 10-peso
}



object tuffy {
  method velocidad() = 10


  method hacerQuilombo(hogar) {
    hogar.hayRuido()
  }
}

object pandilla {

  var pandilla = [tom,tuffy]

  method hacerQuilombo(hogar) {
    pandilla.forEach({quilombero=>quilombero.hacerQuilombo(hogar)})
    if(pandilla.size()>3) hogar.hayRuido()
  }

  method velocidad() {
    pandilla.map({quilombero=>quilombero.velocidad()}).min()
  }
}



//nuevo cuidador y quilombero

object pyke {

  var energia = 100
  var animo = 10
  method velocidad() = animo*1000/energia


  method limpiarCasa(hogar){
    //reduce la suciedad en base a su energia

    hogar.reducirSuciedad(energia)
  }

  method puedeAtrapar(quilombero) = quilombero.velocidad()<self.velocidad()

  method interrumpirSuenio() {

    energia = energia-20

  }
  method dormir() {
    energia = energia + 50
  }
}

object cherie {
  var glamour = 100

  method hacerQuilombo(hogar) {
    hogar.aumentarSuciedad(glamour*5)
    hogar.hayRuido()
  }

  method velocidad() = glamour/20
}