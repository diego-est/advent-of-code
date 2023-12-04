input ←  •file.Chars "day4.txt"
ToDec ←  +´×⟜(⌽·(10⊸⋆∘↕ ∘≠⊢)⊢)
Partition ←  (¬-˜⊢×·+`»⊸>)⊸⊔
Solution ←  {a‿b‿c‿d ←  ToDec¨'0'-˜𝕩Partition˜(¬"-,"∊˜⊢)𝕩 ⋄ 0≥(a-b) × (c-d)}
Solution2 ←  {a‿b‿c‿d ←  ToDec¨'0'-˜𝕩Partition˜(¬"-,"∊˜⊢)𝕩 ⋄ ∨´(1+(a-1)↓ ↕ b)∊(1+(c-1)↓ ↕ d)}
