/*
De cada vagón de carga se conoce la carga máxima que puede llevar, en kilos. 
Un vagón de carga no puede llevar ningún pasajero. No hay vagones mixtos.
 
El peso máximo de un vagón, medido en kilos, se calcula así: 
* Para un vagón de pasajeros: cantidad de pasajeros que puede llevar * 80. 
* Para un vagón de carga: la carga máxima que puede llevar + 160 (en cada vagón de carga van dos guardas).

 */
class Formaciones 
{
	var locomotoras = []
	var vagones = []
	
	method agregarVagones(vagon)
	{
		vagones.add(vagon)
	}
	
	method agregarLocomotoras(locomotora)
	{
		locomotoras.add(locomotora)
	}
	
	method cantVagones() { return vagones.size() }
	
	method vagonMasPesado() { return vagones.max { vagon => vagon.peso() } }
	
	method vagonesPeso() { return vagones.sum { vagon => vagon.peso() } }
	
	method locomotorasPeso() { return locomotoras.sum { locomotora => locomotora.peso() } }
	
	method formacionPeso() { return self.vagonesPeso() + self.locomotorasPeso()	}
	
	method vagonesLivianos()
	{
//		YO LO HICE ASÍ
//		vagones.forEach
//		{
//			vagon => vagon.peso() < pesoLiviano cantidad ++
//			
//		}

//Dario lo resolvió con un filter -> devuelve coleccion pasada por cierto criterio y luego hace un size de esa coleccion
		return vagones.filter{ vagon => vagon.peso() < 2500 }.size()		
	}
	
	/*
	* El total de pasajeros que puede transportar una formación. 
	*/
	method pasajerosATransportar()
	{
		var cantidad = 0
		vagones.forEach
		{
			vagon => cantidad += vagon.cantPasajeros()	
		}
		
		return cantidad
	}
	
	/*
	 * una formación es eficiente:
	 * es eficiente si cada una de sus locomotoras arrastra, 
	 * al menos, 5 veces su peso (el de la locomotora misma).
	 */
	 
	 method locomotoraEficiente()
	 {
	 	return locomotoras.all
	 	{
	 		locomotora => locomotora.arrastreUtil() > locomotora.peso() * 5
	 	}
	 }
	 
	 /* 
	  * Si una formación puede moverse: 
	   * Una formación puede moverse si el arrastre útil total de sus locomotoras 
	   * es mayor o igual al peso máximo total de los vagones.
	 */
	 
	 method arrastreTotalDeLocomotora()	 { return locomotoras.sum { locomotora => locomotora.arrastreUtil() } }
	 
	 method sePuedeMover() { return self.arrastreTotalDeLocomotora() >= self.formacionPeso() }
	 
	 /*
	  * Cuántos kilos de empuje le faltan a una formación para poder moverse, que es: 
	   * 0 si ya se puede mover, y (peso máximo total de los vagones – arrastre útil total de las locomotoras) en caso contrario.
	   * FALTA TEST
	  */
	  
	 method cuantoKilosFaltanParaMoverse()
	 {
		if( self.sePuedeMover() ) { return 0 }
		
		else { return self.formacionPeso() - self.arrastreTotalDeLocomotora() }
	 }
}

/* Clase de vagones de carga */
class VagonesDeCarga
{
	var cargaMaxima = 2000
	var carga = 0
	
	method agregarCarga(cantidad)
	{
		if (cargaMaxima >= carga + cantidad)
		{
			carga += cantidad
		}
		else
		error.throwWithMessage("Si agregas " + cantidad + " sobrepasas el maximo de " + cargaMaxima )
	}
	
	method peso() { return carga + 160	}
	
	method cantPasajeros() { return 0 }
}

/* Clase de vagones de pasajeros */
class VagonesDePasajeros
{
	var property ancho = 2
	var property largo = 10
	var cantPasajeros = 0
	
	method agregarPasajeros(cantidad)
	{
		if (self.maxPasajeros() >= cantPasajeros + cantidad)
		{
			cantPasajeros += cantidad
		}
		else
		error.throwWithMessage("Si agregas " + cantidad + " sobrepasas el maximo de " + self.maxPasajeros() )
	}
	
	method cantPasajeros() { return cantPasajeros}

	method maxPasajeros() 
	{
		return
		if( ancho < 2.5 )
		{
			largo * 8
		}
		else
		{
			largo * 10
		}
	}
	
	method peso() { return cantPasajeros * 80 }
}

/*
* De cada locomotora se sabe: su peso, el peso máximo que puede arrastrar, y su velocidad máxima. 
* P.ej. puedo tener una locomotora que pesa 1000 kg, puede arrastrar hasta 12000 kg, 
* y su velocidad máxima es de 80 km/h. 
* Obviamente se tiene que arrastrar a ella misma, entonces no le puedo cargar 12000 kg de vagones, solamente 11000; 
* diremos que este es su “arrastre útil”.
 
 */
class Locomotora
{
	var property peso = 1000
	var pesoArrastra = 12000
	var velocidadMax = 80
	
	/*
	 * No le resto el peso, ya que al calcular si se puede mover
	 * En las formaciones cuento el peso de los vagones y la locomotora 
	 */
	  
	method arrastreUtil()
	{
		return pesoArrastra
	}
	
	method peso()
	{
		return peso
	}
	
	method pesoArrastra(otroPeso)
	{
		pesoArrastra = otroPeso
	}
	 
	method velocidadMax(velocidad)
	{
		velocidadMax = velocidad
	}
}
