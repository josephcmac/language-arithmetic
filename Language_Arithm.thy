theory Language_Arithm

imports
Complex_Main

begin

text\<open>
l-arithmetic representation
\<close>


definition ell_rep::\<open>(nat \<Rightarrow> 'a list) \<Rightarrow> (nat \<Rightarrow> 'b) \<Rightarrow>  ('a list \<Rightarrow> 'b)\<close> where
\<open>ell_rep l F = (SOME f. f \<circ> l = F)\<close>

end
