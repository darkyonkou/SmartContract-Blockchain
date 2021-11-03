pragma solidity > 0.6.1 < 0.7.0;



contract AdivinaNumero {
    
   address private jugador;
   uint premio;
   uint randomnumber;
   uint private constant costoJuego = 200000000000000000; /// 0.2 ether
   address private owner;
   bool private jugando = false;
   
   /// Posteriormente, Desplegaremos un mensaje al jugador una vez que hagamos una interfaz de usuario.
   event Numeros(string, uint randomnumber, string, uint numeroAdivinado, string ,uint premio);
   
   /// Constructor
   constructor() public payable{
       require(msg.value == 1000000000000000000, "El costo del juego es de 1 ether." );
       owner = msg.sender;
       
       
   }
   
   function adivina() public payable {
       
       require(msg.value == 2000000000000000000, "El costo del juego es de 2 ether." );
       require(!jugando, "Actualmente hay otro jugador, espero un momento para jugar.");
       
       /// El O corrsponde al QUERY_EXECUTION_DELAY, y siempre sera 0 pues queremos el número ASAP
       /// 1 es la cantidad de bytes que pedimos, en este caso es 1 pues solo queremos un número
       /// 200000 el Gas necesario para ejecutar la función callback
       
  
   }
    
    
    
    
    /// Tenemos esta otra función que guarda la lógica del juego pues el número aleatorio se genera de manera asíncrona.
   function jugar( uint numeroAdivinado) public payable {
       
       /// Gas para generar los números aleatorios
       require((msg.value == 200000), "Para jugar envíe 200000 wei." );
       
       if(numeroAdivinado == randomnumber){
            jugador = msg.sender;
            premio = 1000000000000000000;
        }
        else{
            premio = 0;
        }
        /// Desplegamos el mensaje
        emit Numeros("El numero generado fue:",randomnumber,"Tu escogiste:",numeroAdivinado,"Ganaste:", premio);
   }
}