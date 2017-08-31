
object regionSpringfield{
	var ciudadesEnRegion = [springfield,albuquerque]
	method agregarCiudad(unaCiudad){
		ciudadesEnRegion.add(unaCiudad)
	}
	method centralMasProductoraPorCiudad(){
		return ciudadesEnRegion.map({unaCiudad=>unaCiudad.centralMasProductora()})
	}
}
//CIUDADES
object springfield {
	var velocidadViento = 10
	var riquezaSuelo = 0.9
	var necesidadSuministro = 0
	var centrales = [centralAtomica,centralCarbon,centralEolica]
	method produccionEnergetica(unaCentral){
		return unaCentral.produccionEnergetica()
	}
	method sonContaminantes(){
		return centrales.filter({unaCentral=> unaCentral.estaContaminando()})
	}

	method riquezaSuelo(){
		return riquezaSuelo
	}
	method velocidadViento(){
		return velocidadViento
	}
	method necesidadSuministro(suministro){
		necesidadSuministro = suministro
	}
	method estaEnElHorno(){
		return self.sonTodasContaminantes() || self.aportanMasDel50()
	}
	method cumpleNecesidad(){
		return necesidadSuministro == centrales.map({unaCentral=>unaCentral.produccionEnergetica()}).sum()
	}
	method aportanMasDel50(){
		return necesidadSuministro == (self.sonContaminantes().map({unaCentral=>unaCentral.produccionEnergetica()}).sum())*0.5
	
	}
	method sonTodasContaminantes(){
		return centrales.all({unaCentral=>unaCentral.estaContaminando()})
	}
	method centralMasProductora(){
		return centrales.max({unaCentral=>unaCentral.produccionEnergetica()})
	}
	method produceMas(unaCentral,otraCentral){
		if(unaCentral.produccionEnergetica() > otraCentral.produccionEnergetica() ){
			return unaCentral
		}else{
			return otraCentral
		}
	}
}
object albuquerque{
	var caudalDeRio = 150
	var central = centralHidroelectrica
	
		method caudalDeRio(){
		return caudalDeRio
	}
	method central(unaCentral){
		central = unaCentral
	}
	method centralMasProductora(){
		return central
	}
}
//CENTRALES
object centralAtomica {
	var cantVarillas = 0
	var produccionEnergetica = 0
	method producirEnergia(){
		produccionEnergetica += cantVarillas * 0.1
	}
	method cantVarillas(unasVarillas){
		cantVarillas = unasVarillas
	}
	method estaContaminando(){
		return cantVarillas > 20
	}
	method produccionEnergetica(){
		return produccionEnergetica
	}
}
object centralCarbon{
	var capacidad = 0
	var produccionEnergetica = 0
	
	method capacidad(unaCapacidad){
		capacidad = unaCapacidad
	}
	method producirEnergia(){
		produccionEnergetica += (capacidad * springfield.riquezaSuelo()) + 0.5
	}
	method estaContaminando(){
		return true
	}
	method produccionEnergetica(){
		return produccionEnergetica
	}
}
object centralEolica{
	var turbinas = [turbina1]
	var produccionEnergetica = 0
	method agregarTurbina(unaTurbina){
		turbinas.add(unaTurbina)
	}
	method estaContaminando(){
		return false
	}
	method producirEnergia(){
		produccionEnergetica += turbinas.sum({unaTurbina=>unaTurbina.produccionTurbina()})
		
	}
	method produccionEnergetica(){
		return produccionEnergetica
	}
}
object turbina1{
	method produccionTurbina(){
		 return 0.2 * springfield.velocidadViento()
	}		 
}
object centralHidroelectrica{
	var produccionEnergetica = 0
	method producirEnergia(){
		produccionEnergetica += 2 * albuquerque.caudalDeRio()
	}
	method produccionEnergetica(){
		return produccionEnergetica
	}
}