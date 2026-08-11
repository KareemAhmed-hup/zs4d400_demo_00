CLASS lcl_house DEFINITION CREATE PRIVATE.

  PUBLIC SECTION.
    TYPES: tab TYPE STANDARD TABLE OF REF TO lcl_house WITH DEFAULT KEY.

    CLASS-METHODS set_addresses.
    CLASS-METHODS get_addresses RETURNING VALUE(rt_result) TYPE string_table.
  PROTECTED SECTION.
  PRIVATE SECTION.
    CLASS-DATA gt_collection TYPE tab.
    DATA house_id TYPE z00house-house_id.
    DATA street TYPE z00house-street.
    DATA post_code TYPE z00house-post_code.
    DATA city TYPE z00house-city.
*    CLASS-DATA gv_object TYPE REF TO lcl_house.

METHODS constructor
      IMPORTING
        i_house_id  TYPE z00house-house_id
        i_street    TYPE z00house-street
        i_post_code TYPE z00house-post_code
        i_city      TYPE z00house-city.

ENDCLASS.

CLASS lcl_house IMPLEMENTATION.

  METHOD constructor.

    me->house_id = i_house_id.
    me->street = i_street.
    me->post_code = i_post_code.
    me->city = i_city.

  ENDMETHOD.

  METHOD set_addresses.
    SELECT FROM z00house  FIELDS * INTO @DATA(ls_house).
*      "Variante 1
*      gv_object = NEW lcl_house(
*        i_house_id  =  ls_house-house_id
*        i_street    =  ls_house-street
*        i_post_code =  ls_house-post_code
*        i_city      =   ls_house-city ).
*      APPEND  gv_object TO gt_collection.

*      "Variante 2
      APPEND NEW lcl_house(
        i_house_id  =  ls_house-house_id
        i_street    =  ls_house-street
        i_post_code =  ls_house-post_code
        i_city      =   ls_house-city ) TO gt_collection.



    ENDSELECT.

  ENDMETHOD.


  METHOD get_addresses.
    LOOP AT gt_collection INTO DATA(lo_collection).
      APPEND |House Id { lo_collection->house_id   } | TO rt_result.
      APPEND |Street { lo_collection->street   } | TO rt_result.
      APPEND |Postcode { lo_collection->post_code   } | TO rt_result.
      APPEND |City { lo_collection->city   } | TO rt_result.
      APPEND |{ cl_abap_char_utilities=>newline } | TO rt_result.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
