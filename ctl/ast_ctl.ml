
(* ---------------------------------------------------------------------- *)
(* Types                                                                  *)
(* ---------------------------------------------------------------------- *)

type strict = STRICT | NONSTRICT

type keep_binding = bool (* true = put in witness tree *)

(* CTL parameterised on basic predicates and metavar's*)
type ('pred,'mvar,'anno) generic_ctl =
    ('pred,'mvar,'anno) generic_ctl_bis * 'anno
 and ('pred,'mvar,'anno) generic_ctl_bis = 
  | False
  | True
  | Pred of 'pred
  | Not of (('pred,'mvar,'anno) generic_ctl)
  | Exists of 'mvar * (('pred,'mvar,'anno) generic_ctl) * keep_binding
  | And of strict * (('pred,'mvar,'anno) generic_ctl) * 
      (('pred,'mvar,'anno) generic_ctl)
  | AndAny of direction * strict * (('pred,'mvar,'anno) generic_ctl) * 
      (('pred,'mvar,'anno) generic_ctl)
  | Or  of (('pred,'mvar,'anno) generic_ctl) * 
      (('pred,'mvar,'anno) generic_ctl)
  | Implies of (('pred,'mvar,'anno) generic_ctl) * 
      (('pred,'mvar,'anno) generic_ctl)
  | AF of direction * strict * (('pred,'mvar,'anno) generic_ctl)
  | AX of direction * strict * (('pred,'mvar,'anno) generic_ctl)
  | AG of direction * strict * (('pred,'mvar,'anno) generic_ctl)
  | AW of direction * strict *
	(* versions with exists v *)
	(('pred,'mvar,'anno) generic_ctl) * (('pred,'mvar,'anno) generic_ctl)
  | AU of direction * strict *
	(* versions with exists v *)
	(('pred,'mvar,'anno) generic_ctl) * (('pred,'mvar,'anno) generic_ctl)
  | EF of direction * (('pred,'mvar,'anno) generic_ctl)
  | EX of direction * (('pred,'mvar,'anno) generic_ctl)
  | EG of direction * (('pred,'mvar,'anno) generic_ctl)
  | EU of direction * (('pred,'mvar,'anno) generic_ctl) * 
      (('pred,'mvar,'anno) generic_ctl)
  | Let of string * 
      (('pred,'mvar,'anno) generic_ctl) * 
      (('pred,'mvar,'anno) generic_ctl)
  | LetR of direction * string * (* evals phi1 wrt reachable states *)
      (('pred,'mvar,'anno) generic_ctl) * 
      (('pred,'mvar,'anno) generic_ctl)
  | Ref of string
  | SeqOr of (('pred,'mvar,'anno) generic_ctl) * 
      (('pred,'mvar,'anno) generic_ctl)
  | Dots of
      (* dir * (before_after * before_after_guard) * nest * whennots * when *
	 rest * aftret * truepred * gotopred * goto_match_anywhere *)
      direction * strict *
	((('pred,'mvar,'anno) generic_ctl) *
	   (('pred,'mvar,'anno) generic_ctl)) list *
	(('pred,'mvar,'anno) generic_ctl) option *
	(('pred,'mvar,'anno) generic_ctl) option *
	(('pred,'mvar,'anno) generic_ctl) option *
	(('pred,'mvar,'anno) generic_ctl) option *
	(('pred,'mvar,'anno) generic_ctl) *
	(((string option -> (('pred,'mvar,'anno) generic_ctl)) ->
	  (('pred,'mvar,'anno) generic_ctl)) ->
	    (('pred,'mvar,'anno) generic_ctl)) *
	(('pred,'mvar,'anno) generic_ctl) *
	(('pred,'mvar,'anno) generic_ctl) *
	(('pred,'mvar,'anno) generic_ctl)
  | PDots of (* for \+ code *)
      (* dir * (before_after * before_after_guard) * nest * whennots * when *
	 rest * aftret * truepred * gotopred * goto_match_anywhere *)
      direction * strict *
	((('pred,'mvar,'anno) generic_ctl) *
	   (('pred,'mvar,'anno) generic_ctl)) list *
	(('pred,'mvar,'anno) generic_ctl) option *
	(('pred,'mvar,'anno) generic_ctl) option *
	(('pred,'mvar,'anno) generic_ctl) option *
	(('pred,'mvar,'anno) generic_ctl) option *
	(('pred,'mvar,'anno) generic_ctl) *
	(((string option -> (('pred,'mvar,'anno) generic_ctl)) ->
	  (('pred,'mvar,'anno) generic_ctl)) ->
	    (('pred,'mvar,'anno) generic_ctl)) *
	(('pred,'mvar,'anno) generic_ctl) *
	(('pred,'mvar,'anno) generic_ctl) *
	(('pred,'mvar,'anno) generic_ctl)
  | Uncheck of (('pred,'mvar,'anno) generic_ctl)

and direction = FORWARD (* the normal way *) | BACKWARD (* toward the start *)

let unwrap (ctl,_) = ctl
let rewrap (_,model) ctl = (ctl,model)
let get_line (_,l) = l


(* NOTE: No explicit representation of the bottom subst., i.e., FALSE *)
type ('mvar,'value) generic_subst = 
  | Subst of 'mvar * 'value
  | NegSubst of 'mvar * 'value
type ('mvar,'value) generic_substitution = ('mvar,'value) generic_subst list

type ('state,'subst,'anno) generic_witnesstree =
    Wit of
      'state * 'subst * 'anno * ('state,'subst,'anno) generic_witnesstree list
  | NegWit of ('state,'subst,'anno) generic_witnesstree

(* ---------------------------------------------------------------------- *)

type 'a modif = Modif of 'a | UnModif of 'a | Control

(* ---------------------------------------------------------------------- *)
