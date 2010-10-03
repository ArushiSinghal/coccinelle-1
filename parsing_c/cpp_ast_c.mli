type cpp_option = 
  | I of Common.dirname
  | D of string * string option

val cpp_option_of_cmdline: 
  Common.dirname list (* -I *) * string list (* -D *) -> cpp_option list
val show_cpp_i_opts: string list -> unit
val show_cpp_d_opts: string list -> unit


(* ---------------------------------------------------------------------- *)
(* cpp_expand_include below internally use cache of header file to
 * speedup as reinclude very often the same basic header file. But that
 * means that the asts of those headers are then shared so take
 * care. 
*)
val _headers_hash: 
  (Common.filename, Parse_c.program2 * Parsing_stat.parsing_stat) Hashtbl.t
val threshold_cache_nb_files: int ref

(* It can also try to find header files in nested directories if the 
 * caller use the function below first.
 *)
val init_adjust_candidate_header_files: Common.dirname -> unit

(* ---------------------------------------------------------------------- *)

(* include *)
val cpp_expand_include: 
  ?depth_limit:int option -> cpp_option list -> 
  Common.dirname (* start point for relative paths *) -> 
  Ast_c.program -> Ast_c.program

(* ifdef *)
val cpp_ifdef_statementize: Ast_c.program -> Ast_c.program

(* define *)
val cpp_expand_macro_expr: 
  Ast_c.define_kind -> Ast_c.argument Ast_c.wrap2 list -> 
  Ast_c.expression option

