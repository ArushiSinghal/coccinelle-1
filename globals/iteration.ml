(*
 * Copyright 2010, INRIA, University of Copenhagen
 * Julia Lawall, Rene Rydhof Hansen, Gilles Muller, Nicolas Palix
 * Copyright 2005-2009, Ecole des Mines de Nantes, University of Copenhagen
 * Yoann Padioleau, Julia Lawall, Rene Rydhof Hansen, Henrik Stuart, Gilles Muller, Nicolas Palix
 * This file is part of Coccinelle.
 *
 * Coccinelle is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, according to version 2 of the License.
 *
 * Coccinelle is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Coccinelle.  If not, see <http://www.gnu.org/licenses/>.
 *
 * The authors reserve the right to distribute this or future versions of
 * Coccinelle under other licenses.
 *)


type init_info = (string (* language *) * string (* rule name *)) *
      string list (* defined virtual rules *)

let initialization_stack = ref ([] : init_info list)

(* ----------------------------------------------------------------------- *)

let base_file_list = ref ([] : string list)
let parsed_virtual_rules = ref ([] : string list)
let parsed_virtual_identifiers = ref ([] : string list)

(* ----------------------------------------------------------------------- *)

type pending_info = string list (* files to treat *) *
      string list * (* defined virtual rules *)
      (string * string) list (* virtual identifiers *)

let pending_instances_file = ref ([] : pending_info list)
let pending_instances_dir = ref ([] : pending_info list)

let add_pending_instance (files,a,b) =
  match files with
    None ->
      pending_instances_dir := (!base_file_list,a,b) :: !pending_instances_dir
  | Some f ->
      (* if one specifies a file, it is assumed to be the current one *)
      pending_instances_file := (f,a,b) :: !pending_instances_file
					      
let get_pending_instance _ =
  (if (List.length !pending_instances_file) > 0 or
    (List.length !pending_instances_dir) > 0
  then
    Common.pr2
      (Printf.sprintf
	 "%d pending new file instances\n%d pending original file instances\n"
	 (List.length !pending_instances_file)
	 (List.length !pending_instances_dir)));
  match !pending_instances_file with
    [] ->
      (match !pending_instances_dir with
	[] -> None
      | x::xs ->
	  pending_instances_dir := xs;
	  Some x)
  | x::xs ->
      pending_instances_file := xs;
      Some x

(* ----------------------------------------------------------------------- *)

let check_virtual_rule r =
  if not (List.mem r !parsed_virtual_rules)
  then failwith ("unknown virtual rule "^r)

let check_virtual_ident i =
  if not (List.mem i !parsed_virtual_identifiers)
  then failwith ("unknown virtual rule "^i)