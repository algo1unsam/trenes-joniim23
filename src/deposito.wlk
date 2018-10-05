/*

En cada depósito hay: formaciones ya armadas, y locomotoras sueltas que pueden ser agregadas a una formación.
 
*/
class Deposito
{
	var formaciones = []
	var locomotoras = []
	
	method agregarFormaciones(formacion)
	{
		formaciones.add(formacion)
	}
	
	method agregarLocomotoras(locomotora)
	{
		locomotoras.add(locomotora)
	}
	
	/*
	 * 7. Dado un depósito, obtener el conjunto formado por el vagón más pesado de cada formación; se espera un conjunto de vagones.
	 */
	
	method vagonMasPesadoPorFormacion()
	{
		formaciones.map
		{
			formacion => formacion.vagonMasPesado()
		}
	}
	
	method seRequiereUnConductorExperimentado()
}

 
 /*
  * 8. Si un depósito necesita un conductor experimentado. 
   * Un depósito necesita un conductor experimentado si alguna de sus formaciones es compleja. 
   * Una formación es compleja si: tiene más de 20 unidades (sumando locomotoras y vagones), o el peso total (sumando locomotoras y vagones) es de más de 10000 kg.
  */