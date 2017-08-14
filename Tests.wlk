import Tarea.*

test "Horacio Pagani comienza con 100 de nivel de enojo" {
assert.equals(100,horacioPagani.nivelDeEnojo())
}

test "Horacio Pagani eleva la voz y su nivel de enojo es 110" {
horacioPagani.elevarVoz()
assert.equals(110,horacioPagani.nivelDeEnojo())
}

test "Horacio Pagani toma agua 1 vez, y su nivel de enojo queda en 90"{
horacioPagani.tomarAgua()
assert.equals(90,horacioPagani.nivelDeEnojo())
}

test "Horacio Pagani esta caliente ya que su nivel de enojo (100) es mayor a 20"{
assert.that(horacioPagani.estaCaliente())
}