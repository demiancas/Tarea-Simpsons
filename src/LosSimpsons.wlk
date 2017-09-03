
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
		return necesidadSuministro <= self.produccionTotal(centrales)
	}
	method aportanMasDel50(){
		return necesidadSuministro*0.5 <= self.produccionTotal(self.sonContaminantes())
	
	}
	method sonTodasContaminantes(){
		return centrales.all({unaCentral=>unaCentral.estaContaminando()})
	}
	method centralMasProductora(){
		return centrales.max({unaCentral=>unaCentral.produccionEnergetica()})
	}
	method produccionTotal(listaDeCentrales){
		return listaDeCentrales.sum({unaCentral=>unaCentral.produccionEnergetica()})
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
	method producirEnergia(ciudadQueSeEncuentra){
		produccionEnergetica += (capacidad * ciudadQueSeEncuentra.riquezaSuelo()) + 0.5
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
	method producirEnergia(ciudadQueSeEncuentra){
		produccionEnergetica += turbinas.sum({unaTurbina=>unaTurbina.produccionTurbina(ciudadQueSeEncuentra)})
		
	}
	method produccionEnergetica(){
		return produccionEnergetica
	}
}
object turbina1{
	method produccionTurbina(ciudadQueSeEncuentra){
		 return 0.2 * ciudadQueSeEncuentra.velocidadViento()
	}		 
}
object centralHidroelectrica{
	var produccionEnergetica = 0
	method producirEnergia(ciudadQueSeEncuentra){
		produccionEnergetica += 2 * ciudadQueSeEncuentra.caudalDeRio()
	}
	method produccionEnergetica(){
		return produccionEnergetica
	}
}