
object club{
	var patova = rochensen
	
	method patova(unPatova){
		patova = unPatova
	}
	method patovaDeTurno(){
		return patova
	}
	method dejaEntrarA(unaPersona){
		return patova.dejaPasarA(unaPersona)
	}

}

// PERSONAS
object vonLukaz{
	var energia = 150
	var diversion = 70
	const remera = "blanca"
	method edad(){
		return 17
	}
	method energia(unaEnergia){
		energia = unaEnergia
	}
	method esMayorDeEdad(){
		return self.edad() > 21
	}
	method tieneRemera(color){
		return color == remera
	}
	method irAlClub(){
		return club.dejaEntrarA(self)
	}
	method irABailar(unaPista){
		if(club.dejaEntrarA(self)){
			unaPista.vieneALaPista(self)
		}
	}
	method disminuirEnergia(cantidad){
		energia -= cantidad
	}
	method aumentarDiversion(cantidad){
		diversion += cantidad
	}
}
object bianker{
	var energia = 140
	var diversion = 80
	const remera = "negra"
	method edad(){
		return 22
	}
	method energia(unaEnergia){
		energia = unaEnergia
	}
	method esMayorDeEdad(){
		return self.edad() > 21
	}
	method tieneRemera(color){
		return color == remera
	}
	method irAlClub(){
		return club.dejaEntrarA(self)
	}
	method disminuirEnergia(cantidad){
		energia -= cantidad
	}
	method aumentarDiversion(cantidad){
		diversion += cantidad
	}
}
object gonzen{
	var energia = 90
	var diversion = 15
	const remera = "negra"
	method edad(){
		return 33
	}
	method energia(unaEnergia){
		energia = unaEnergia
	}
	method esMayorDeEdad(){
		return self.edad() > 21
	}
	method tieneRemera(color){
		return color == remera
	}
	method irAlClub(){
		return club.dejaEntrarA(self)
	}
	method disminuirEnergia(cantidad){
		energia -= cantidad
	}
	method aumentarDiversion(cantidad){
		diversion += cantidad
	}
}

//PATOVAS
object rochensen{
	method dejarPasarA(persona){
		return persona.esMayorDeEdad()
	}
}
object gushtavotruccensen{
	method dejarPasarA(persona){
		return false
	}
}
object rodrigsen{
	method dejarPasarA(persona){
		return persona.tieneRemera("negra")
	}
}

//PISTAS
object mainRoom{
	var genteEnPista = []
	method vieneALaPista(unaPersona){
		genteEnPista.add(unaPersona)
	}
	method hacerBailar(){
		genteEnPista.forEach({unaPersona=> unaPersona.disminuirEnergia(40)})
		genteEnPista.forEach({unaPersona=> unaPersona.aumentarDiversion(30)})
	}
	method cuantasBailan(){
		return genteEnPista.size()
	}
	method estaGonzenBailando(){
		return genteEnPista.contains(gonzen)
	}
}
object panoramaBar{
	var dj = dixon
	var genteEnPista = []
	method dj(unDj){
		dj = unDj
	}
	method hacerBailar(){
		genteEnPista.forEach({unaPersona=>dj.bailaConDj(unaPersona)})
	}
	method vieneALaPista(unaPersona){
		genteEnPista.add(unaPersona)
	}
	method cuantasBailan(){
		return genteEnPista.size()
	}
	method estaGonzenBailando(){
		return genteEnPista.contains(gonzen)
	}
}

//DJs

object dixon {
method bailaConDj(unaPersona){
		unaPersona.disminuirEnergia(60)
		unaPersona.aumentarDiversion(120)
	}
}
object marcelDettmann {
method bailaConDj(unaPersona){
		unaPersona.energia(0)
		unaPersona.aumentarDiversion(1000)
	}
}
object tommyMunoz {
method bailaConDj(unaPersona){
		unaPersona.disminuirEnergia(80)
	}
}

