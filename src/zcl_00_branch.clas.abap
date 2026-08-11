CLASS zcl_00_branch DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_00_branch IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA number1 TYPE i.
    DATA number2 TYPE i.
    DATA result TYPE p LENGTH 8 DECIMALS 2.
    DATA op TYPE c LENGTH 1.
    DATA output TYPE string.
    number1 = -8.
    number2 = 0.
    op = '/'. "-*/
    CASE op.
      WHEN '+'.
        result = number1 + number2.
      WHEN '-'.
        result = number1 - number2.
      WHEN '*'.
        result = number1 * number2.
      WHEN '/'.
        TRY.
            result = number1 / number2.
*          CATCH cx_sy_zerodivide.                      "Variante 1
*            output = |Division durch Null ist nicht erlaubt!|.
          CATCH cx_sy_zerodivide INTO DATA(lx_excp).    "Variante 2
            output = lx_excp->get_text(  ).
        ENDTRY.
      WHEN OTHERS.
        output = | '{ op  }' ist kein gültiger Operator! |.
    ENDCASE.
    IF output IS INITIAL.
      output = | { number1  } { op } { number2 }  = { result NUMBER = ENVIRONMENT }  |.
    ENDIF.
    out->write(  output ).
    out->write(  'Ausgabe-1' ).



  ENDMETHOD.
ENDCLASS.
