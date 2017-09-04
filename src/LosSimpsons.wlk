
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
		return necesidadSuministro <= self.produccionParcial(centrales)
	}
	method aportanMasDel50(){
		return necesidadSuministro*0.5 <= self.produccionParcial(self.sonContaminantes())
	
	}
	method sonTodasContaminantes(){
		return centrales.all({unaCentral=>unaCentral.estaContaminando()})
	}
	method centralMasProductora(){
		return centrales.max({unaCentral=>unaCentral.produccionEnergetica()})
	}
	method produccionParcial(listaDeCentrales){
		return listaDeCentrales.sum({unaCentral=>unaCentral.produccionEnergetica(self)})
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
	method cantVarillas(unasVarillas){
		cantVarillas = unasVarillas
	}
	method estaContaminando(){
		return cantVarillas > 20
	}
	method produccionEnergetica(ciudadQueSeEncuentra){
		return cantVarillas * 0.1
	}
}
object centralCarbon{
	var capacidad = 0
	
	method capacidad(unaCapacidad){
		capacidad = unaCapacidad
	}
	method estaContaminando(){
		return true
	}
	method produccionEnergetica(ciudadQueSeEncuentra){
		return (capacidad * ciudadQueSeEncuentra.riquezaSuelo()) + 0.5
	}
}
object centralEolica{
	var turbinas = [turbina1]
	method agregarTurbina(unaTurbina){
		turbinas.add(unaTurbina)
	}
	method estaContaminando(){
		return false
	}
	method produccionEnergetica(ciudadQueSeEncuentra){
		return turbinas.sum({unaTurbina=>unaTurbina.produccionTurbina(ciudadQueSeEncuentra)})
	}
}
object turbina1{
	method produccionTurbina(ciudadQueSeEncuentra){
		 return 0.2 * ciudadQueSeEncuentra.velocidadViento()
	}		 
}
object centralHidroelectrica{
	method produccionEnergetica(ciudadQueSeEncuentra){
		return 2 * ciudadQueSeEncuentra.caudalDeRio()
	}
}