theory Language_Arithm

imports Complex_Main  

begin

section \<open>Definition of the l-aritmetic\<close>

text\<open>To any natural number we associate a Dyck path.\<close>

definition Schroeder_sgn :: \<open>nat \<Rightarrow> nat \<Rightarrow> int\<close> where
  \<open>Schroeder_sgn n k =  (if odd k  then 1 else 
             if odd ((2*n) div k)  then -1 
             else 0)\<close>

fun Schroeder' :: \<open>nat \<Rightarrow> nat \<Rightarrow> int list\<close> where
  \<open>Schroeder' n 0 = []\<close> |
  \<open>Schroeder' n (Suc k) = (if (Suc k) dvd (2*n)
                           then (Schroeder' n k) @ [Schroeder_sgn n (Suc k)]
                           else Schroeder' n k)\<close>

definition Schroeder  :: \<open>nat  \<Rightarrow> int list\<close> where
  \<open>Schroeder n = Schroeder' n (2*n)\<close> 

definition Dyck :: \<open>nat  \<Rightarrow> int list\<close> where
  \<open>Dyck n = removeAll 0 (Schroeder n)\<close> 

value \<open>Schroeder 1236\<close>

value \<open>Dyck 1236\<close>

section \<open>Experiment with language 1\<close>

text\<open>
We define the language L1 of Dyck paths with height at least 2.
\<close>

fun height_list :: \<open>int list \<Rightarrow> int list\<close> where
  \<open>height_list [] = []\<close>  |
  \<open>height_list [x] = []\<close> | 
  \<open>height_list (x#y#w) = x#(height_list ((x+y)#w))\<close>

value \<open>Dyck 1236\<close>
value \<open>height_list (Dyck 1236)\<close>

definition L1 :: \<open>int list \<Rightarrow> bool\<close> where
\<open>L1 x = (filter (\<lambda>h. h \<ge> 2) (height_list x) \<noteq> [])\<close>


value \<open>filter (L1\<circ>Dyck\<circ>nat) [1..100]\<close>

end
