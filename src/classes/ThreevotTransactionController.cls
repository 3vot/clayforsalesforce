/*

{
  1:   verb, url, fields
  a:   "id", 1, "externalId", 2
  b:   "id", 1, "externalId", 3
  c:   "id", 1, "externalId", 4
  2:   verb, url, fields
  3:   verb, url, fields
  4:   verb, url, fields
}


transaction.start()
.then( Documento.create({cliente: "a"}) )
.then( Movimiento.create({ producto: b, cantidad:1 }) )
.then( Movimiento.create({ producto: b, cantidad:1 }) )
.then( Movimiento.create({ producto: b, cantidad:1 }) )
.then( Movimiento.create({ producto: b, cantidad:1 }) )
.then( set( 1 ,"id",[2,3,4], "externalId") )
.then( transaction.end )


function set( afterIndex, fieldName, onIndex/es, destinationField )

*/





global class ThreevotTransactionController {

}