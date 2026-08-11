CLASS zcl_d400_00_20association DEFINITION
  PUBLIC
  FINAL.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.




  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_d400_00_20association IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    "S4D400 Seite 217

    DATA ls_I_Connection TYPE /DMO/I_Connection.

    SELECT SINGLE FROM /DMO/I_Connection FIELDS *
         WHERE AirlineID = 'LH' AND  ConnectionID = '0400'
          INTO @ls_i_connection.

    out->write( ls_i_connection  ).

    out->write( '--------------------------------------------------------------' ).




    SELECT SINGLE FROM /DMO/I_Connection FIELDS AirlineID,ConnectionID,DepartureAirport,
    DestinationAirport, \_Airline-Name
             WHERE AirlineID = 'LH' AND  ConnectionID = '0400'
              INTO @DATA(ls_i_connection1).

    out->write( ls_i_connection1  ).













  ENDMETHOD.

ENDCLASS.


