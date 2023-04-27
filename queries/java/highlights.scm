;; extends
(interface_declaration
  name: (identifier) @interface_name)
(class_declaration
  name: (identifier) @class_name)
(record_declaration
  name: (identifier) @record_name)
(enum_declaration
  name: (identifier) @enum_name)

; spell check
(comment) @spell
