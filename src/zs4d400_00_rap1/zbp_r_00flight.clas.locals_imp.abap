CLASS lhc_zr_00flight DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR Flight
        RESULT result,
      validatePrice FOR VALIDATE ON SAVE
        IMPORTING keys FOR Flight~validatePrice,
      validateCurrencyCode FOR VALIDATE ON SAVE
        IMPORTING keys FOR Flight~validateCurrencyCode.
ENDCLASS.

CLASS lhc_zr_00flight IMPLEMENTATION.
  METHOD get_global_authorizations.
  ENDMETHOD.
  METHOD validatePrice.
    DATA reported_record LIKE LINE OF reported-flight.
    DATA failed_record LIKE LINE OF failed-flight.

    READ  ENTITIES OF zr_00flight IN LOCAL MODE
       ENTITY Flight FIELDS ( Price )
         WITH CORRESPONDING #( keys )
           RESULT DATA(flights).


    LOOP AT flights INTO DATA(flight).
      IF flight-Price <= 0.
        reported_record-%tky = flight-%tky.      "ID
        reported_record-%msg = new_message(
                                 id       = '/LRN/S4D400'
                                 number   = '101'
                                 severity = if_abap_behv_message=>severity-error ). "Message
        reported_record-%element-price = if_abap_behv=>mk-on.
        APPEND reported_record TO reported-flight.


        failed_record-%tky = flight-%tky.
        APPEND  failed_record TO failed-flight.


      ENDIF.
    ENDLOOP.

  ENDMETHOD.

  METHOD validateCurrencyCode.
    DATA reported_record LIKE LINE OF reported-flight.
    DATA failed_record LIKE LINE OF failed-flight.
    DATA exists TYPE abap_bool.

    READ  ENTITIES OF zr_00flight IN LOCAL MODE
       ENTITY Flight FIELDS ( CurrencyCode )
         WITH CORRESPONDING #( keys )
           RESULT DATA(flights).

    LOOP AT flights INTO DATA(flight).
      SELECT SINGLE FROM I_Currency FIELDS @abap_true
           WHERE Currency = @flight-CurrencyCode INTO @exists.
      IF exists = abap_false.
        reported_record-%tky = flight-%tky.      "ID
        reported_record-%msg = new_message(      "Messageobjekt
                                 id       = 'Z00MESSAGE_CLASS'
                                 number   = '002'
                                 severity = if_abap_behv_message=>severity-error
                                 v1       =   flight-CurrencyCode ).
        reported_record-%element-currencycode = if_abap_behv=>mk-on.

        APPEND reported_record TO reported-flight.


        failed_record-%tky = flight-%tky.
        APPEND  failed_record TO failed-flight.

      ENDIF.



    ENDLOOP.


  ENDMETHOD.

ENDCLASS.
