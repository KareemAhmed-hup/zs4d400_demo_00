CLASS lcl_connection DEFINITION CREATE PUBLIC.

  PUBLIC SECTION.

    CLASS-DATA conn_counter TYPE i READ-ONLY.
    CLASS-METHODS class_constructor.
    METHODS get_output RETURNING VALUE(r_output) TYPE string_table.
    METHODS constructor IMPORTING i_carrier_id    TYPE /dmo/carrier_id
                                  i_connection_id TYPE /dmo/connection_id
                        RAISING   cx_abap_invalid_value. .
  PROTECTED SECTION.
  PRIVATE SECTION.
    TYPES: BEGIN OF st_details,
             DepartureAirport   TYPE /dmo/airport_from_id,
             DestinationAirport TYPE /dmo/airport_to_id,
             AirlineName        TYPE /dmo/carrier_name,
           END OF st_details.
    TYPES: BEGIN OF st_airport,
             AirportID TYPE /dmo/airport_id,
             Name      TYPE /dmo/airport_name,
           END OF st_airport.
    TYPES tt_airports TYPE STANDARD TABLE OF st_airport WITH NON-UNIQUE DEFAULT KEY.
    DATA carrier_id TYPE  /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.
    DATA details TYPE st_details.
    CLASS-DATA airports TYPE tt_airports.
ENDCLASS.

CLASS lcl_connection IMPLEMENTATION.
  METHOD class_constructor.
    SELECT FROM /DMO/I_Airport FIELDS AirportID, Name INTO TABLE @airports.
  ENDMETHOD.
  METHOD get_output.
    APPEND |-----------------------------------------| TO r_output.
    APPEND |Carrier:     { carrier_id  } { details-airlinename }  | TO r_output.
    APPEND |Connection:  { connection_id  }  | TO r_output.
    APPEND |Departure:   { details-departureairport  } { airports[ airportid = details-departureairport ]-name   } | TO r_output.
    APPEND |Destination: { details-destinationairport  } { airports[ airportid = details-destinationairport ]-name }   | TO r_output.

  ENDMETHOD.

  METHOD constructor.
    IF i_carrier_id IS INITIAL OR i_connection_id IS INITIAL..
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.

    "Per View /dmo/i_connection Übung 14
    SELECT SINGLE FROM /dmo/i_connection FIELDS DepartureAirport, DestinationAirport, \_Airline-Name AS AirlineName
       WHERE AirlineID = @i_carrier_id AND ConnectionID = @i_connection_id
          INTO CORRESPONDING FIELDS OF @details.



*    "Per View /dmo/i_connection Übung 13
*    SELECT SINGLE FROM /dmo/i_connection FIELDS DepartureAirport, DestinationAirport, \_Airline-Name
*       WHERE AirlineID = @i_carrier_id AND ConnectionID = @i_connection_id
*          INTO ( @airport_from_id, @airport_to_id, @carrier_name  ).


    "Per Tabelle /dmo/connection
*    SELECT SINGLE FROM /dmo/connection FIELDS airport_from_id, airport_to_id
*       WHERE carrier_id = @i_carrier_id AND connection_id = @i_connection_id
*          INTO ( @airport_from_id, @airport_to_id  ).
*


    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.

    carrier_id = i_carrier_id.
    connection_id = i_connection_id.
    conn_counter += 1.  "conn_counter = conn_counter + 1.
  ENDMETHOD.
ENDCLASS.


