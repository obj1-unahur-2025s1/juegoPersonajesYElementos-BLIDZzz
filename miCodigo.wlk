object luisa {
  var personajeActivo = floki
  var personaje1 = floki
  var personaje2 = mario
  
  method personajeActivo() = personajeActivo
  
  method personajeActivo(unPersonaje) {
    personajeActivo = unPersonaje
  }
  
  method aparece(elemento) {
    personajeActivo.encontrar(elemento)
  }
  
  method personaje1() = personaje1
  
  method personaje2() = personaje2
  
  method personaje1(unPersonaje) {
    personaje1 = unPersonaje
  }
  
  method personaje2(unPersonaje) {
    personaje2 = unPersonaje
  }
}

object floki {
  //method tipoPersonaje() = "Guerrero"
  var arma = ballesta
  
  method arma() = arma
  
  method arma(nuevaArma) {
    arma = nuevaArma
  }
  
  method encontrar(elemento) {
    elemento.nivelDefensa(elemento.nivelDefensa() - arma.dañoSiguienteAtaque())
    arma.disparo()
  }
}

object mario {
  //method tipoPersonaje() = "Trabajador"
  var valorRecolectado = 0
  var alturaUltimoElemento = 0
  
  method alturaUltimoElemento() = alturaUltimoElemento
  
  method alturaUltimoElemento(nuevaAltura) {
    alturaUltimoElemento = nuevaAltura
  }
  
  method valorRecolectado() = valorRecolectado
  
  method valorRecolectado(unValorRecolectado) {
    valorRecolectado = unValorRecolectado
  }
  
  method encontrar(elemento) {
    elemento.recibeTrabajo()
    self.alturaUltimoElemento(elemento.altura())
  }
  
  method esFeliz() {
    (valorRecolectado > 50) || (self.alturaUltimoElemento() >= 10)
  }
}

object ballesta {
  var flechas = 10
  
  method potencia() = 4
  
  method estaCargada() = flechas > 0
  
  method dañoSiguienteAtaque() {
    if (self.estaCargada()) {
      return 4
    } else {
      return 0
    }
  }
  
  method disparo() {
    flechas -= 1
  }
}

object jabalina {
  var cargada = true
  
  method potencia() = 30
  
  method estaCargada() = cargada
  
  method dañoSiguienteAtaque() {
    if (self.estaCargada()) {
      return 30
    } else {
      return 0
    }
  }
  
  method disparo() {
    cargada = false
  }
}

object castillo {
  var nivelDefensa = 150
  
  method altura() = 20
  
  method nivelDefensa() = nivelDefensa
  
  method nivelDefensa(nuevoNivelDefensa) {
    nivelDefensa = nuevoNivelDefensa.min(200)
  }
  
  method recibeTrabajo() {
    mario.valorRecolectado(nivelDefensa * 0.2)
    
    self.nivelDefensa(nivelDefensa + 20)
  }
}

object aurora {
  var nivelDefensa = 10
  var estaViva = true
  
  method altura() = 1
  
  method estaViva() = estaViva
  
  method nivelDefensa(nuevoNivelDefensa) {
    if (nuevoNivelDefensa <= 0) {
      nivelDefensa = 0
      estaViva = false
    }
  }
  
  method recibeTrabajo() {
    mario.valorRecolectado(15)
  }
}

object tipa {
  var altura = 8
  
  method altura() = altura
  
  method altura(unaAltura) {
    altura = unaAltura
  }
  
  method nivelDefensa(nuevoNivelDefensa) {
    
  }
  
  method recibeTrabajo() {
    mario.valorRecolectado(altura * 2)
    self.altura(altura + 1)
  }
}