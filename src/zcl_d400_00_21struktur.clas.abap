CLASS zcl_d400_00_21struktur DEFINITION
  PUBLIC
  FINAL.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.




  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_d400_00_21struktur IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    "S4D400 Seite 236.
    DATA ls_demo_01 TYPE /dmo/carrier.
    DATA ls_demo_02 TYPE /DMO/I_connection.
    "Variante 1
    SELECT SINGLE FROM /DMO/I_Connection FIELDS AirlineID,ConnectionID, \_Airline-Name
         WHERE AirlineID = 'LH' AND ConnectionID = '0400'
              INTO @DATA(ls_demo_03).


    out->write( ls_demo_02 ).
    out->write( ls_demo_03 ).

********************************************************************************************
    TYPES: BEGIN OF ls_ty_connection,
             AirlineID    TYPE /DMO/I_Connection-AirlineID,
             ConnectionID TYPE /DMO/I_Connection-ConnectionID,
             name         TYPE /DMO/I_Carrier-Name,
           END OF ls_ty_connection.
    DATA  ls_connection TYPE ls_ty_connection.
    "Variante 1
    SELECT SINGLE FROM /DMO/I_Connection FIELDS AirlineID,ConnectionID, \_Airline-Name
        WHERE AirlineID = 'LH' AND ConnectionID = '0400'
             INTO @ls_connection.

    out->write( ls_connection ).
********************************************************************************************
    DATA BEGIN OF ls_connection1.
    INCLUDE TYPE /DMO/I_Connection.
    DATA   Name         TYPE /DMO/I_Carrier-Name.
    DATA   message TYPE symsg.
    DATA    END OF ls_connection1.

    SELECT SINGLE FROM /DMO/I_Connection FIELDS AirlineID,ConnectionID, \_Airline-Name
        WHERE AirlineID = 'LH' AND ConnectionID = '0400'
             INTO CORRESPONDING FIELDS OF @ls_connection1.

    ls_connection1-Distance = 333.
    ls_connection1-message-msgty = 'I'.
    ls_connection1-message-msgid = 'S4D400_00'.
    ls_connection1-message-msgno = '123'.

    out->write( ls_connection1 ).
*********************************************************************************************
    TYPES: BEGIN OF ls_ty_connection2,
             AirlineID    TYPE /DMO/I_Connection-AirlineID,
             ConnectionID TYPE /DMO/I_Connection-ConnectionID,
             name         TYPE /DMO/I_Carrier-Name,
           END OF ls_ty_connection2.
    DATA  ls_connection2 TYPE ls_ty_connection.

    ls_connection2 = VALUE #( airlineid = 'LH'
                              connectionid = '0400'
                              name = 'Demo-01'
                             ).

    out->write( ls_connection2 ).




*********************************************************************************************
    DATA message TYPE symsg.



  ENDMETHOD.

ENDCLASS.


