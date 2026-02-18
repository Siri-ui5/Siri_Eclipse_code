CLASS lhc_Student DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Student RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Student RESULT result.
    METHODS setAdmitted FOR MODIFY
      IMPORTING keys FOR ACTION Student~setAdmitted RESULT result.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Student RESULT result.

ENDCLASS.

CLASS lhc_Student IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD setAdmitted.

    MODIFY ENTITIES OF ypi_prct_2 IN LOCAL MODE
    ENTITY Student
    UPDATE
    FIELDS ( Status )
    WITH VALUE #( FOR key IN keys ( %tky = key-%tky Status = abap_true ) )
    FAILED failed
    REPORTED reported.

    READ ENTITIES OF ypi_prct_2 IN LOCAL MODE
    ENTITY Student
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(studentdata).
    result = VALUE #( FOR studentrec IN studentdata
    ( %tky = studentrec-%tky %param = studentrec )  ).

  ENDMETHOD.

  METHOD get_instance_features.

    READ ENTITIES OF ypi_prct_2
    IN LOCAL MODE
    ENTITY Student
    FIELDS ( Status )  WITH CORRESPONDING #( keys )
    RESULT DATA(Studentinstance) FAILED failed.

    result = VALUE #( FOR studnt IN Studentinstance
              LET Statusvalue = COND #( WHEN studnt-Status = abap_true
                                        THEN if_abap_behv=>fc-o-disabled
                                        ELSE if_abap_behv=>fc-o-enabled )

                                   IN ( %tky = studnt-%tky
                                   %action-setAdmitted = Statusvalue )
    ).
    ENDMETHOD.

ENDCLASS.
