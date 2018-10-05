/*
De cada vagón de carga se conoce la carga máxima que puede llevar, en kilos. 
Un vagón de carga no puede llevar ningún pasajero. No hay vagones mixtos.
 
El peso máximo de un vagón, medido en kilos, se calcula así: 
* Para un vagón de pasajeros: cantidad de pasajeros que puede llevar * 80. 
* Para un vagón de carga: la carga máxima que puede llevar + 160 (en cada vagón de carga van dos guardas).

 */
import formaciones.*
 
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
