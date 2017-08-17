# encoding: utf-8

INFO_TABS       = %w(
                    )

PROCESS_TABS    = %w(
                    )

MODEL_TABS      = %w(
                      goals
                      roles
                      sources
                      users
                      words
                      wordtypes
                      )

HIDDEN_MODELS   = %w(
                    )

DROPDOWN_LISTS  = %w(
                      goals
                      roles
                      sources
                      users
                      wordtypes
                    ).collect{|x|x.to_sym}

DROPDOWN_LISTS_WITH_COUNTRIES  = %w(
                    ).collect{|x|x.to_sym}

ASSOCIATED_RECORDS = %w(
                    ).collect{|x|x.to_sym}





JA_NEE  = { 1 => '--',
            2 => 'nee',
            3 => 'ja'
          }


FORBIDDEN_ROLES_FOR_ADMIN = ["1"]


ATTRIBUTE_LIST= {
  ### ATTRIBUTE LIST FOR NEW AND CREATE
  :attributes_for_new_and_create => [
  ],
}
