(* 

See example.v for an example of use.

*)

Set Implicit Arguments.
Unset Strict Implicit.
Unset Printing Implicit Defensive.
Require Import ssreflect.
Generalizable All Variables.

Declare Scope yade_verbatim.

Declare Custom Entry yade_ob.
Declare Custom Entry yade_mor.

Class preCategory (ob : Type)(hom : ob -> ob -> Type)
    :=
{
compose : forall {a b c}, hom a b -> hom b c -> hom a c;
assoc : forall a b c d (f : hom a b)(g : hom b c)(h : hom c d),
        compose f (compose g h) = compose (compose f g) h;
} as C.

Arguments preCategory : clear implicits.

Definition marker {ob hom}{C : preCategory ob hom} `(x : hom a b) := x.
Definition toplevel_morphism {ob : Type}{hom : ob -> ob -> Type} 
        {a b : ob}(f : hom a b) := f.

(* This will be given the notation compose_infix *)
Definition compose_infix := @compose.

Definition eq_mor {A : Type} (a a' : A):= a = a'.


(* This is the notation for the morphisms *)

Module PreNotations.
  Notation "f · g" := (compose_infix _ f g)  (in custom yade_mor at level 40, left associativity).
  Notation "<YADE> t = u </YADE>" := (eq_mor t u) (t custom yade_mor, u custom yade_mor).
  Notation "<YADE_EXPLICIT> a -- t -> b = c -- u -> d </YADE_EXPLICIT>" := 
    (eq (toplevel_morphism (a := a) (b := b) t) 
            (toplevel_morphism  (a := c) (b := d) u)) 
    (t custom yade_mor, u custom yade_mor, 
    a custom yade_ob, b custom yade_ob,
    c custom yade_ob, d custom yade_ob
    ).
  Notation "<YADE_EXPLICIT_VERB> a -- t -> b = c -- u -> d </YADE_EXPLICIT_VERB>" := 
    (eq (toplevel_morphism (a := a) (b := b) t) 
            (toplevel_morphism  (a := c) (b := d) u)) 
    (t custom yade_mor, u custom yade_mor, 
    a custom yade_ob, b custom yade_ob,
    c custom yade_ob, d custom yade_ob
    ) : yade_verbatim.

  (* Declare Scope yade_latex_identifier. *)

  Notation "x" := x (in custom yade_ob at level 0, x global).
  Notation "x" := x (in custom yade_mor at level 0, x global).
  Notation "{ x }" := x (in custom yade_ob, x constr).
  Notation "{ x }" := x (in custom yade_mor, x constr).
  Notation "( x )" := (x) (in custom yade_mor).
  Notation "( x )" := (x) (in custom yade_ob).
  Notation "f -> z -- g" := (@compose _ _ _ _ z _ f g )  (z custom yade_ob, in custom yade_mor at level 40, left associativity).
 

End PreNotations.

Section WithNotations.
Import PreNotations.
Lemma cancel_postcomposition `{C : preCategory ob hom} {a b c : ob}
    (f f' : hom a b)(g : hom b c) :
     <YADE> f = f' </YADE> -> 
     <YADE> f · g =
f' · g </YADE>.
Proof.
congruence.
Qed.
Lemma cancel_precomposition `{C : preCategory ob hom}{a b c : ob}(f : hom a b)(g g' : hom b c) :
     <YADE> g = g' </YADE> -> <YADE> f · g =
f · g' </YADE>.
congruence.
Qed.

Section NoEqMor.
(* Notation only used in this section.
rewrite assoc'/assoc'' is faster when we unfold eq_mor.
*)
Notation "<YADE_EQ> t = u </YADE_EQ>" := ( t = u) (t custom yade_mor, u custom yade_mor).
(* associativity with the YADE notation *)
Lemma assoc'' `{C : preCategory ob hom}: forall a b c d 
        (f : hom a b)(g : hom b c)(h : hom c d),
       <YADE_EQ> f · (g · h) = f · g · h</YADE_EQ>.
        apply assoc.
Qed.

(* associativity in the other direction *)
Lemma assoc' `{C : preCategory ob hom}: forall a b c d 
        (f : hom a b)(g : hom b c)(h : hom c d),
       <YADE_EQ> f · g · h = f · (g · h) </YADE_EQ>.
        symmetry.
        apply assoc.
Qed.

End NoEqMor.

Lemma transitivity : forall {A : Type} (a b c : A),
  <YADE> a = b </YADE> -> <YADE> b = c </YADE> -> <YADE> a = c </YADE>.
  Proof.
  congruence.
  Qed.
End WithNotations.

Module notations.
Include PreNotations.

(* 
If the goal is f_1 ⋅ .. ⋅  f_p = _
yade_strip n m makes the goal f_n ⋅  .. ⋅ f_(p-m).
 *)
Tactic Notation "yade_strip" int_or_var(n) int_or_var(m) :=
(do m apply cancel_postcomposition);
repeat (eapply transitivity;[apply assoc'|]);
(do n apply cancel_precomposition);
repeat (eapply transitivity;[apply assoc''|]).
End notations.

(* 
an auxiliary marker
 *)
Ltac propagate_marker :=
   match goal with 
   |- context G [ marker (C := ?C') ?x ] => 
     rewrite -[yade.marker x]/(compose (C := C') 
     (marker (C := C') _) (marker (C := C') _))
     end.

(* tries to detect a precategory using typeclass inference  *)
Ltac to_notation_with_explicit_objects := 
 refine (_ :>
   (toplevel_morphism 
    (marker _) =
     toplevel_morphism
    (marker _)))
 ;
repeat propagate_marker; rewrite /marker  ;
rewrite ?assoc .

(* a tactic to simplify the object labels (you can 
redefine it with Ltac yade.normalise_object ::= ...
) *)
Ltac normalise_objects := cbn.




(* Turn the goal into the infix mode., after norm_graph *)
Ltac to_notation_with_implicit_objects :=
  to_notation_with_explicit_objects;
  match goal with 
    |- toplevel_morphism ?x = 
      toplevel_morphism ?y =>
    change (eq_mor x y)
    end;
   fold compose_infix.
