Require Import ssreflect.
Unset Universe Checking.

From Yade Require Import cat yade.
Locate Fob.

Open Scope cat.

Section Distributive.
Context
 {C : cat} (S T : C ~> C)
   (μS : comp S S ~> S).



  Context 
   (μT : < T · T > ~> T)
   (ηS : <| C |> ~> S)
   (ηT : <| C |> ~> T).

   Context 
   (δ : < T · S > ~> < S · T >).

Notation "μ^S x" := (μS x) (x custom obj, in custom mor at level 1).
Notation "μ^T x" := (μT x) (x custom obj, in custom mor at level 1).
Notation "η^S x" := (ηS x) (x custom obj, in custom mor at level 1).
Notation "η^T x" := (ηT x) (x custom obj, in custom mor at level 1).
Notation "'δ' x" := (δ x) (x custom obj, in custom mor at level 1).

Context (muS_assoc : forall x, { μ^S S x  · μ^S x = S μ^S x · μ^S x}).
Context (muT_assoc : forall x, { μ^T T x  · μ^T x = T μ^T x · μ^T x}).

(*
 YADE DIAGRAM {"fileName":"graph.json","graph":{"latexPreamble":"\\newcommand{\\coqproof}[1]{\\checkmark{}}","tabs":[{"active":true,"edges":[{"from":0,"id":20,"label":{"isPullshout":false,"label":"η^S T x","style":{"alignment":"left","bend":0,"color":"black","dashed":false,"double":false,"head":"default","position":0.5,"tail":"none"},"zindex":0},"to":2},{"from":0,"id":21,"label":{"isPullshout":false,"label":"T η^S x","style":{"alignment":"right","bend":0,"color":"black","dashed":false,"double":false,"head":"default","position":0.5,"tail":"none"},"zindex":0},"to":1},{"from":2,"id":22,"label":{"isPullshout":false,"label":"δ x","style":{"alignment":"left","bend":0,"color":"black","dashed":false,"double":false,"head":"default","position":0.5,"tail":"none"},"zindex":0},"to":1},{"from":3,"id":23,"label":{"isPullshout":false,"label":"S η^T x","style":{"alignment":"left","bend":0,"color":"black","dashed":false,"double":false,"head":"default","position":0.5,"tail":"none"},"zindex":0},"to":5},{"from":3,"id":24,"label":{"isPullshout":false,"label":"η^T S x","style":{"alignment":"right","bend":0,"color":"black","dashed":false,"double":false,"head":"default","position":0.5,"tail":"none"},"zindex":0},"to":4},{"from":5,"id":25,"label":{"isPullshout":false,"label":"δ x","style":{"alignment":"left","bend":0,"color":"black","dashed":false,"double":false,"head":"default","position":0.5,"tail":"none"},"zindex":0},"to":4},{"from":6,"id":26,"label":{"isPullshout":false,"label":"δ T x","style":{"alignment":"left","bend":0,"color":"black","dashed":false,"double":false,"head":"default","position":0.5,"tail":"none"},"zindex":0},"to":10},{"from":10,"id":27,"label":{"isPullshout":false,"label":"T δ x","style":{"alignment":"left","bend":0,"color":"black","dashed":false,"double":false,"head":"default","position":0.5,"tail":"none"},"zindex":0},"to":8},{"from":6,"id":28,"label":{"isPullshout":false,"label":"S μ^T x","style":{"alignment":"right","bend":0,"color":"black","dashed":false,"double":false,"head":"default","position":0.5,"tail":"none"},"zindex":0},"to":9},{"from":8,"id":29,"label":{"isPullshout":false,"label":"μ^T S x","style":{"alignment":"left","bend":0,"color":"black","dashed":false,"double":false,"head":"default","position":0.5,"tail":"none"},"zindex":0},"to":7},{"from":9,"id":30,"label":{"isPullshout":false,"label":"δ x","style":{"alignment":"right","bend":0,"color":"black","dashed":false,"double":false,"head":"default","position":0.5,"tail":"none"},"zindex":0},"to":7},{"from":11,"id":31,"label":{"isPullshout":false,"label":"S δ x","style":{"alignment":"left","bend":0,"color":"black","dashed":false,"double":false,"head":"default","position":0.5,"tail":"none"},"zindex":0},"to":15},{"from":15,"id":32,"label":{"isPullshout":false,"label":"δ S x","style":{"alignment":"left","bend":0,"color":"black","dashed":false,"double":false,"head":"default","position":0.5,"tail":"none"},"zindex":0},"to":13},{"from":11,"id":33,"label":{"isPullshout":false,"label":"μ^S T x","style":{"alignment":"right","bend":0,"color":"black","dashed":false,"double":false,"head":"default","position":0.5,"tail":"none"},"zindex":0},"to":14},{"from":13,"id":34,"label":{"isPullshout":false,"label":"T μ^S x","style":{"alignment":"left","bend":0,"color":"black","dashed":false,"double":false,"head":"default","position":0.5,"tail":"none"},"zindex":0},"to":12},{"from":14,"id":35,"label":{"isPullshout":false,"label":"δ x","style":{"alignment":"right","bend":0,"color":"black","dashed":false,"double":false,"head":"default","position":0.5,"tail":"none"},"zindex":0},"to":12}],"nodes":[{"id":0,"label":{"isMath":true,"label":"T x","pos":[700,100],"zindex":1}},{"id":1,"label":{"isMath":true,"label":"T S x","pos":[900,300],"zindex":1}},{"id":2,"label":{"isMath":true,"label":"S T x","pos":[900,100],"zindex":1}},{"id":3,"label":{"isMath":true,"label":"S x","pos":[700,500],"zindex":1}},{"id":4,"label":{"isMath":true,"label":"T S x","pos":[900,700],"zindex":1}},{"id":5,"label":{"isMath":true,"label":"S T x","pos":[900,500],"zindex":1}},{"id":6,"label":{"isMath":true,"label":"S T T x","pos":[100,500],"zindex":1}},{"id":7,"label":{"isMath":true,"label":"T S x","pos":[500,700],"zindex":1}},{"id":8,"label":{"isMath":true,"label":"T T S x","pos":[500,500],"zindex":1}},{"id":9,"label":{"isMath":true,"label":"S T x","pos":[100,700],"zindex":1}},{"id":10,"label":{"isMath":true,"label":"T S T x","pos":[300,500],"zindex":1}},{"id":11,"label":{"isMath":true,"label":"S S T x","pos":[100,100],"zindex":1}},{"id":12,"label":{"isMath":true,"label":"T S x","pos":[500,300],"zindex":1}},{"id":13,"label":{"isMath":true,"label":"T S S x","pos":[500,100],"zindex":1}},{"id":14,"label":{"isMath":true,"label":"S T x","pos":[100,300],"zindex":1}},{"id":15,"label":{"isMath":true,"label":"S T S x","pos":[300,100],"zindex":1}},{"id":16,"label":{"isMath":true,"label":"\\coqproof{applyeq muS_delta.}","pos":[281.00303840637207,200.54818725585938],"zindex":0}},{"id":17,"label":{"isMath":true,"label":"\\coqproof{applyeq muT_delta.}","pos":[278.00303840637207,590.4231719970703],"zindex":0}},{"id":18,"label":{"isMath":true,"label":"\\coqproof{applyeq unit1.}","pos":[805.6974792480469,161.97873306274414],"zindex":0}},{"id":19,"label":{"isMath":true,"label":"\\coqproof{applyeq unit2.}","pos":[830.6974792480469,564.9787330627441],"zindex":0}}],"sizeGrid":200,"title":"1"}]},"version":11}
 *)
Context (unit1 : forall (x : C), { η^S T x · δ x = T η^S x }).
Context (unit2 : forall (x : C), { S η^T x · δ x = η^T S x }).
Context (muS_delta : forall (x : C), { δ T x · T δ x · μ^T S x = S μ^T x · δ x }).
Context (muT_delta : forall (x : C), { S δ x · δ S x · T μ^S x = μ^S T x · δ x }).

Definition μ' (x : C) : |T S T S x| --> |T S x| .
exact <  T δ S x · μ^T S S x · T μ^S x >.
Defined.



Lemma μ'_assoc (x : C) :
  { T S {μ'  x} · {μ' x} = {μ' |T S x|} · {μ' x}
   }.

unfold μ'.
normalise.

   (*
The proof:
    YADE DIAGRAM {"fileName":"graph.json","graph":{"latexPreamble":"\\newcommand{\\coqproof}[1]{\\checkmark{}}","tabs":[{"active":true,"edges":[{"from":0,"id":29,"label":{"isPullshout":false,"label":"T S T δ S x","style":{"alignment":"left","bend":0,"color":"black","dashed":false,"double":false,"head":"default","position":0.5,"tail":"none"},"zindex":0},"to":4},{"from":4,"id":30,"label":{"isPullshout":false,"label":"T S μ^T S S x","style":{"alignment":"left","bend":0,"color":"black","dashed":false,"double":false,"head":"default","position":0.5,"tail":"none"},"zindex":0},"to":5},{"from":5,"id":31,"label":{"isPullshout":false,"label":"T S T μ^S x","style":{"alignment":"left","bend":0,"color":"black","dashed":false,"double":false,"head":"default","position":0.5,"tail":"none"},"zindex":0},"to":2},{"from":0,"id":32,"label":{"isPullshout":false,"label":"T δ S T S x","style":{"alignment":"right","bend":0,"color":"black","dashed":false,"double":false,"head":"default","position":0.5,"tail":"none"},"zindex":0},"to":6},{"from":6,"id":33,"label":{"isPullshout":false,"label":"μ^T S S T S x","style":{"alignment":"right","bend":0,"color":"black","dashed":false,"double":false,"head":"default","position":0.5,"tail":"none"},"zindex":0},"to":7},{"from":7,"id":34,"label":{"isPullshout":false,"label":"T μ^S T S x","style":{"alignment":"right","bend":0,"color":"black","dashed":false,"double":false,"head":"default","position":0.5,"tail":"none"},"zindex":0},"to":3},{"from":2,"id":35,"label":{"isPullshout":false,"label":"T δ S x","style":{"alignment":"left","bend":0,"color":"black","dashed":false,"double":false,"head":"default","position":0.5,"tail":"none"},"zindex":0},"to":8},{"from":8,"id":36,"label":{"isPullshout":false,"label":"μ^T S S x","style":{"alignment":"left","bend":0,"color":"black","dashed":false,"double":false,"head":"default","position":0.5,"tail":"none"},"zindex":0},"to":9},{"from":9,"id":37,"label":{"isPullshout":false,"label":"T μ^S x","style":{"alignment":"left","bend":0,"color":"black","dashed":false,"double":false,"head":"default","position":0.5,"tail":"none"},"zindex":0},"to":1},{"from":3,"id":38,"label":{"isPullshout":false,"label":"T δ S x","style":{"alignment":"right","bend":0,"color":"black","dashed":false,"double":false,"head":"default","position":0.5,"tail":"none"},"zindex":0},"to":10},{"from":10,"id":39,"label":{"isPullshout":false,"label":"μ^T \nS S x","style":{"alignment":"right","bend":0,"color":"black","dashed":false,"double":false,"head":"default","position":0.5,"tail":"none"},"zindex":0},"to":11},{"from":11,"id":40,"label":{"isPullshout":false,"label":"T μ^S x","style":{"alignment":"right","bend":0,"color":"black","dashed":false,"double":false,"head":"default","position":0.5,"tail":"none"},"zindex":0},"to":1},{"from":7,"id":41,"label":{"isPullshout":false,"label":"T S δ S x","style":{"alignment":"left","bend":0,"color":"black","dashed":false,"double":false,"head":"default","position":0.5,"tail":"none"},"zindex":0},"to":13},{"from":13,"id":42,"label":{"isPullshout":false,"label":"T δ S S x","style":{"alignment":"left","bend":0,"color":"black","dashed":false,"double":false,"head":"default","position":0.5,"tail":"none"},"zindex":0},"to":14},{"from":14,"id":43,"label":{"isPullshout":false,"label":"T T μ^S S x","style":{"alignment":"left","bend":0,"color":"black","dashed":false,"double":false,"head":"default","position":0.5,"tail":"none"},"zindex":0},"to":10},{"from":14,"id":44,"label":{"isPullshout":false,"label":"μ^T S S S x","style":{"alignment":"left","bend":0,"color":"black","dashed":false,"double":false,"head":"default","position":0.5,"tail":"none"},"zindex":0},"to":16},{"from":16,"id":45,"label":{"isPullshout":false,"label":"T μ^S S x","style":{"alignment":"left","bend":0,"color":"black","dashed":false,"double":false,"head":"default","position":0.5,"tail":"none"},"zindex":0},"to":11},{"from":16,"id":46,"label":{"isPullshout":false,"label":"T S μ^S x","style":{"alignment":"left","bend":0,"color":"black","dashed":false,"double":false,"head":"default","position":0.5,"tail":"none"},"zindex":0},"to":9},{"from":18,"id":47,"label":{"isPullshout":false,"label":"T T S μ^S x","style":{"alignment":"left","bend":0,"color":"black","dashed":false,"double":false,"head":"default","position":0.5,"tail":"none"},"zindex":0},"to":8},{"from":18,"id":48,"label":{"isPullshout":false,"label":"μ^T S S S x","style":{"alignment":"left","bend":0,"color":"black","dashed":false,"double":false,"head":"default","position":0.5,"tail":"none"},"zindex":0},"to":16},{"from":6,"id":49,"label":{"isPullshout":false,"label":"T T S δ S x","style":{"alignment":"left","bend":0,"color":"black","dashed":false,"double":false,"head":"default","position":0.5,"tail":"none"},"zindex":0},"to":20},{"from":20,"id":50,"label":{"isPullshout":false,"label":"μ^T S T S S x","style":{"alignment":"right","bend":0,"color":"black","dashed":false,"double":false,"head":"default","position":0.5,"tail":"none"},"zindex":0},"to":13},{"from":4,"id":51,"label":{"isPullshout":false,"label":"T δ T S S x","style":{"alignment":"left","bend":0,"color":"black","dashed":false,"double":false,"head":"default","position":0.5,"tail":"none"},"zindex":0},"to":20},{"from":20,"id":52,"label":{"isPullshout":false,"label":"T T δ S S x","style":{"alignment":"left","bend":0,"color":"black","dashed":false,"double":false,"head":"default","position":0.5,"tail":"none"},"zindex":0},"to":24},{"from":24,"id":53,"label":{"isPullshout":false,"label":"μ^T \n T S S S x","style":{"alignment":"left","bend":0,"color":"black","dashed":false,"double":false,"head":"default","position":0.5,"tail":"none"},"zindex":0},"to":14},{"from":24,"id":54,"label":{"isPullshout":false,"label":"T μ^T S S S x","style":{"alignment":"left","bend":0,"color":"black","dashed":false,"double":false,"head":"default","position":0.5,"tail":"none"},"zindex":0},"to":18},{"from":5,"id":55,"label":{"isPullshout":false,"label":"T δ S S x","style":{"alignment":"left","bend":0,"color":"black","dashed":false,"double":false,"head":"default","position":0.5,"tail":"none"},"zindex":0},"to":18}],"nodes":[{"id":0,"label":{"isMath":true,"label":"T S T S T S x","pos":[98,98],"zindex":0}},{"id":1,"label":{"isMath":true,"label":"T S x","pos":[686,686],"zindex":0}},{"id":2,"label":{"isMath":true,"label":"T S T S x","pos":[686,98],"zindex":0}},{"id":3,"label":{"isMath":true,"label":"T S T S x","pos":[98,686],"zindex":0}},{"id":4,"label":{"isMath":true,"label":"T S T T S S x","pos":[294,98],"zindex":0}},{"id":5,"label":{"isMath":true,"label":"T S T S S x","pos":[490,98],"zindex":0}},{"id":6,"label":{"isMath":true,"label":"T T S S T S x","pos":[98,294],"zindex":0}},{"id":7,"label":{"isMath":true,"label":"T S S T S x","pos":[98,490],"zindex":0}},{"id":8,"label":{"isMath":true,"label":"T T S S x","pos":[686,294],"zindex":0}},{"id":9,"label":{"isMath":true,"label":"T S S x","pos":[686,490],"zindex":0}},{"id":10,"label":{"isMath":true,"label":"T T S S x","pos":[294,686],"zindex":0}},{"id":11,"label":{"isMath":true,"label":"T S S x","pos":[490,686],"zindex":0}},{"id":12,"label":{"isMath":true,"label":"\\coqproof{applyeq muT_delta. }","pos":[134.51692724227905,623.2842712402344],"zindex":0}},{"id":13,"label":{"isMath":true,"label":"T S T S S x","pos":[163.33333333333331,555.3333333333334],"zindex":0}},{"id":14,"label":{"isMath":true,"label":"T T S S S x","pos":[323.0066738128662,574.0304260253906],"zindex":0}},{"id":15,"label":{"isMath":true,"label":"\\coqproof{naturality. }","pos":[390.0066738128662,652.9024658203125],"zindex":0}},{"id":16,"label":{"isMath":true,"label":"T S S S x","pos":[487.0066738128662,563.9024658203125],"zindex":0}},{"id":17,"label":{"isMath":true,"label":"\\coqproof{applyeq muS_assoc. }","pos":[591.0066738128662,621.138916015625],"zindex":0}},{"id":18,"label":{"isMath":true,"label":"T T S S S x","pos":[532.0066738128662,365.6550626754761],"zindex":0}},{"id":19,"label":{"isMath":true,"label":"\\coqproof{naturality.}","pos":[594.0066738128662,427.91324615478516],"zindex":0}},{"id":20,"label":{"isMath":true,"label":"T T S T S S x","pos":[263.0066738128662,295.91324615478516],"zindex":0}},{"id":21,"label":{"isMath":true,"label":"\\coqproof{naturality.}","pos":[165.0066738128662,405.0260772705078],"zindex":0}},{"id":22,"label":{"isMath":true,"label":"\\coqproof{naturality.}","pos":[191.0066738128662,187.6376724243164],"zindex":0}},{"id":23,"label":{"isMath":true,"label":"\\coqproof{apply (natural μT).}","pos":[256.0066738128662,464.91324615478516],"zindex":0}},{"id":24,"label":{"isMath":true,"label":"T T T S S S x","pos":[385.0066738128662,388.91324615478516],"zindex":0}},{"id":25,"label":{"isMath":true,"label":"\\coqproof{applyeq muT_assoc.}","pos":[420.0066738128662,472.8894348144531],"zindex":0}},{"id":26,"label":{"isMath":true,"label":"\\coqproof{applyeq muS_delta.}","pos":[426.0066738128662,243.84595301747322],"zindex":0}},{"id":27,"label":{"isMath":true,"label":"\\coqproof{naturality.}","pos":[598.0066738128662,212.79605674743652],"zindex":0}},{"id":28,"label":{"isMath":false,"label":"ici","pos":[283.0066738128662,420.91324615478516],"zindex":0}}],"sizeGrid":196,"title":"2"}]},"version":11}
   *)

Qed.
   

End Distributive.