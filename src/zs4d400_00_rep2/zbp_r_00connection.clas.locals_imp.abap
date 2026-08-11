CLASS lhc_zr_00connection DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR zconnection
        RESULT result,
      CheckSematicKey FOR VALIDATE ON SAVE
        IMPORTING keys FOR zconnection~CheckSematicKey,
      GetCity FOR DETERMINE ON save
        IMPORTING keys FOR zconnection~GetCity.

ENDCLASS.

CLASS lhc_zr_00connection IMPLEMENTATION.
  METHOD get_global_authorizations.
  ENDMETHOD.
  METHOD CheckSematicKey.
    DATA reported_record LIKE LINE OF reported-zconnection.
    DATA failed_record LIKE LINE OF failed-zconnection.


    READ ENTITIES OF zr_00connection IN LOCAL MODE
       ENTITY zconnection FIELDS ( uuid CarrierID ConnectionID )
         WITH CORRESPONDING #( keys )
           RESULT DATA(connections).
    LOOP AT connections INTO DATA(connection).

      SELECT FROM z00connection FIELDS uuid
         WHERE carrier_id = @connection-CarrierID AND
               connection_id = @connection-ConnectionID AND
               uuid <> @connection-uuid
              INTO TABLE @DATA(check_result).

      SELECT FROM z00connection_d FIELDS uuid
          WHERE carrierid = @connection-CarrierID AND
                connectionid = @connection-ConnectionID AND
                uuid <> @connection-uuid
               APPENDING TABLE @check_result.

      CHECK check_result IS NOT INITIAL.

      DATA(message) = me->new_message(
                        id       = '/LRN/S4D400'
                        number   = '001'
                        severity = if_abap_behv_message=>severity-error
                        v1       = connection-CarrierID
                        v2       = connection-ConnectionID ).

      reported_record-%tky = connection-%tky.
      reported_record-%msg = message.
      reported_record-%element-connectionid = if_abap_behv=>mk-on.
      reported_record-%element-carrierid = if_abap_behv=>mk-on.
      APPEND reported_record TO reported-zconnection.




      failed_record-%tky = connection-%tky.
      APPEND failed_record TO failed-zconnection.





    ENDLOOP.



  ENDMETHOD.


  METHOD GetCity.
    DATA connections_upd TYPE TABLE FOR UPDATE zr_00connection.
    READ ENTITIES OF zr_00connection IN LOCAL MODE
        ENTITY zconnection FIELDS ( AirportFromID AirportToID )
          WITH CORRESPONDING #( keys )
           RESULT DATA(connections).

    LOOP AT connections INTO DATA(connection).
      SELECT SINGLE FROM /lrn/airport FIELDS city, country
         WHERE airport_id = @connection-AirportFromID
           INTO ( @connection-CityFrom,  @connection-CountryFrom ).
      SELECT SINGLE FROM /lrn/airport FIELDS city, country
          WHERE airport_id = @connection-AirportToID
            INTO ( @connection-CityTo,  @connection-CountryTo ).

      MODIFY connections FROM connection.


      connections_upd = CORRESPONDING #( connections ).

      MODIFY ENTITIES OF zr_00connection IN LOCAL MODE
         ENTITY zconnection UPDATE FIELDS ( CityFrom CountryFrom CityTo CountryTo )
          WITH connections_upd.



    ENDLOOP.










  ENDMETHOD.

ENDCLASS.
