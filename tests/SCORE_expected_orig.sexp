����  3�  >  %  ^�� , �*topdec.res@@�3bad_iso_example.res�
  �INCORRECT:diff token: ( VS x
File "tests/bad_iso_example.c", line 2, column 6,  charpos = 19
    around = '(', whole content =   if ((x = 3)) return;
File "tests/bad_iso_example.res", line 2, column 6,  charpos = 19
    around = 'x', whole content =   if (x) return;

    diff (result(<) vs expected_result(>)) = 
    @@ -1,4 +1,4 @@
     int main() {
    -  if ((x = 3)) return;
    +  if (x) return;
     }
     
@@@@�6const_implicit_iso.res@@�(nest.res@@@�)ifzer.res@@�(tern.res@@�(rets.res@�(post.res@�+expnest.res@@�)decl2.res@�-decl_star.res@@@�-iterprint.res@@�*strid2.res@@�)param.res@@�/test11_ver1.res@�/test10_ver1.res@�,after_if.res@�'dbg.res�
  �INCORRECT:diff token: else VS (
File <COCCIOUTPUTFILE>, line 8, column 2,  charpos = 133
    around = 'else', whole content = 		else pr = NULL;("PCI");
File "tests/dbg.res", line 7, column 5,  charpos = 130
    around = '(', whole content = 		DBG("PCI");

    diff (result(<) vs expected_result(>)) = 
    @@ -4,6 +4,6 @@
     	struct resource *pr, *r = &dev->resource[idx];
     
     	if (pr)
    -		DBG
    -		else pr = NULL;("PCI");
    +		DBG("PCI");
    +	else pr = NULL;
     }
@�*string.res@�*signed.res@�,oddifdef.res�
  �INCORRECT:diff token: #else
 VS x
File <COCCIOUTPUTFILE>, line 10, column 0,  charpos = 114
    around = '#else
', whole content = #else
File "tests/oddifdef.res", line 10, column 2,  charpos = 116
    around = 'x', whole content =   x = 0;

    diff (result(<) vs expected_result(>)) = 
    @@ -7,8 +7,9 @@
         a = 5;
     
     #ifdef FOO
    +  x = 0;
     #else
    -
    +  x = 0;
     #endif
     }
     
    @@ -21,8 +22,9 @@
         a = 3;
     
     #ifdef FOO
    +  x = 0;
     #else
    -
    +  x = 0;
     #endif
     }
     
    @@ -35,7 +37,8 @@
     #endif
     
     #ifdef FOO
    +  x = 0;
     #else
    -
    +  x = 0;
     #endif
     }
�,isotest2.res@�)exitc.res�?PROBLEM
   exn = Failure("hd")
�)deref.res@@@�-inherited.res@�6incompatible_value.res@@�.match_init.res@@�*memory.res@�'inc.res@�+badzero.res@@�'tup.res@�1double_assign.res@�/longlongint.res@@�5metastatement_for.res@�-addbefore.res@�8labels_metastatement.res@@�2wierd_argument.res@�*return.res@�*double.res@@�&kr.res@@�4pb_parsing_macro.res@�6pb_distribute_type.res�	�INCORRECT:PB parsing only in generated-file
    diff (result(<) vs expected_result(>)) = 
    @@ -10,6 +10,6 @@
     }
     
     int foo() {
    -  int[45] *x;
    +  int (*x)[45];
       return 0;
     }
�,dc_close.res@�(befS.res@�+include.res@�-doublepos.res@@�(delp.res@�+badwhen.res@@�.test5_ver1.res@�&na.res@�,argument.res@@�+smallfn.res@@�&y2.res@�3delete_function.res@�*lvalue.res@@@@@�'not.res@�0metaruleelem.res@�*fields.res@@�+compare.res@@�*jloop1.res�	�PROBLEM
   exn = Failure("minus: parse error: \n = File \"tests/jloop1.cocci\", line 10, column 3,  charpos = 129\n    around = '...>', whole content =    ...>\n")
@�*inhpos.res@�/bad_typedef.res@@�*typeof.res@@�2pb_tag_symbols.res@@�&ab.res@@�+incpos1.res�	&PROBLEM
   exn = Failure("no python")
@�+regexp3.res@�/protoassert.res@�,iterator.res@�+arparam.res@�)edots.res@�,constrem.res@@�*struct.res@�*nocast.res@�+julia10.res@�(defe.res@�(ifbr.res@�.array_size.res@�*insdef.res@@�0print_return.res@�-overshoot.res@�0multitypedef.res@@@@�-type_ver2.res�	�INCORRECT:PB parsing only in generated-file
    diff (result(<) vs expected_result(>)) = 
    @@ -1,5 +1,5 @@
     int foo() {
    -  int[10] *x;
    +  int *x[10];
       return 0;
     }
     
�+sizeptr.res@�*retval.res@�+regexp2.res@�(bug1.res@�'fun.res@�)addif.res@@�1mini_null_ref.res@@�-bad_kfree.res@@�*protox.res@�&km.res@�,cs_check.res@@�*incpos.res�	&PROBLEM
   exn = Failure("no python")
@�-type_ver1.res@�&td.res@�&sw.res@@�*tydisj.res@�+spacing.res@�)extra.res�?PROBLEM
   exn = Failure("hd")
@�4optional_storage.res@�'arg.res@@�1bad_ptr_print.res@@�)fnptr.res@@�(stm8.res@�*posiso.res@@�'ben.res@@�2metastatement2.res@@�+nestseq.res@�-list_test.res@@�(four.res@@�(stm7.res�	&PROBLEM
   exn = Failure("no python")
�*disjid.res@@�)type1.res@�*symbol.res@@�2struct_metavar.res@�-const1bis.res@�'fsh.res@@@�0useless_cast.res@�/multi_func1.res�	�PROBLEM
   exn = Failure("minus: parse error: \n = File \"tests/multi_func1.cocci\", line 12, column 2,  charpos = 102\n    around = 'fn2', whole content =   fn2(...) {\n")
�,metaline.res@@�(stm6.res@�*ifdef6.res@@@�.proto_ver2.res@�.param_ver1.res@@�)endif.res@@@�.whitespace.res@�(stm5.res@�0sizeof_julia.res@�*ifdef5.res@�&if.res@@�*retest.res@@�+typedef.res@�.proto_ver1.res@@�6test_unsigned_meta.res@@�*notest.res@@�(stm4.res@�*ifdef4.res@@@�(skip.res@@�+condexp.res@@@�(stm3.res@�*ifdef3.res@�*addaft.res@@�6optional_qualifier.res@@@�(zero.res@@@�(stm2.res@�&sp.res@�*ifdef2.res@�)debug.res@@�+metahex.res�
  VINCORRECT:diff token: f VS }
File "tests/metahex.c", line 2, column 2,  charpos = 15
    around = 'f', whole content =   f(3);
File "tests/metahex.res", line 2, column 0,  charpos = 13
    around = '}', whole content = }

    diff (result(<) vs expected_result(>)) = 
    @@ -1,4 +1,2 @@
     int main() {
    -  f(3);
    -  g(0x03);
     }
@�3toplevel_struct.res@�'spl.res@�3gilles-question.res@@�*comadd.res@�(decl.res@@�)macro.res@@�(vpos.res@�(stm1.res�	&PROBLEM
   exn = Failure("no python")
�,reserved.res@�*ifdef1.res@@�(tyex.res@@�)fnret.res@@�)dropf.res@@�(cptr.res@@�.array_init.res@�+ifields.res@@�,longlong.res@@�)ifend.res@�(fnty.res@@�3replace_typedef.res@�+partial.res@�-multitype.res@�.edots_ver1.res@�+kmalloc.res@@�,sizestar.res@@�6toplevel_macrostmt.res@�-fieldsmin.res@@�-substruct.res@�1disjexpr_ver2.res@�/constructor.res@@�'max.res@�&fp.res@�+devlink.res@�*inhmet.res@@�2type_annotated.res@�1scope_problem.res�
  �INCORRECT:diff token: } VS a
File <COCCIOUTPUTFILE>, line 4, column 2,  charpos = 42
    around = '}', whole content =   }
File "tests/scope_problem.res", line 4, column 4,  charpos = 44
    around = 'a', whole content =     a = 2;

    diff (result(<) vs expected_result(>)) = 
    @@ -1,7 +1,6 @@
     void main(int i) {
       if(1) {
         int a;
    +    a = 2;
       }
    -
    -
     }
�-remstruct.res@�'eb1.res@@�(void.res@�(noty.res@�1fix_flow_need.res@�-inclifdef.res@@�.neststruct.res@�-multiplus.res@@�1disjexpr_ver1.res@@�)proto.res@�+nestone.res@�2minusdots_ver1.res@@�'sis.res@�0shared_brace.res@@�-video1bis.res@�&of.res@�)local.res@@�+arraysz.res@�.end_commas.res@@�(loop.res@@�,nameless.res@@@�*julia7.res@�+attradd.res@@@@@�*xfield.res@�'unl.res@�*switch.res@�*dropbr.res@@�,bitfield.res@�,disjexpr.res@@�+oneline.res@@�1pb_params_iso.res@@�*braces.res@@�)ptrar.res@�)minfn.res@�%a.res@@�-same_expr.res@�'csw.res@@�-starprint.res@�-null_type.res@�-dropparam.res@@�/topdec_ver2.res@�.switchdecl.res@�/initializer.res@@�*sizeof.res@@�,twoproto.res@�-null_bool.res�
  $INCORRECT:diff token: ) VS !=
File <COCCIOUTPUTFILE>, line 2, column 8,  charpos = 22
    around = ')', whole content =   if (12) return;
File "tests/null_bool.res", line 2, column 9,  charpos = 23
    around = '!=', whole content =   if (12 != NULL) return;

    diff (result(<) vs expected_result(>)) = 
    @@ -1,6 +1,6 @@
     int main () {
    -  if (12) return;
    -  if (a && 12 && b) return;
    +  if (12 != NULL) return;
    +  if (a && 12 != NULL && b) return;
       if (12) return;
       if (a && 12 && b) return;
       x = x + 20;
�+fn_todo.res@�)foura.res@@�.decl_space.res@@�-positionc.res@@�/topdec_ver1.res@@�.decl_split.res�
  jINCORRECT:diff token: int VS }
File "tests/decl_split.c", line 2, column 8,  charpos = 27
    around = 'int', whole content =         int x, y;
File "tests/decl_split.res", line 2, column 0,  charpos = 19
    around = '}', whole content = }

    diff (result(<) vs expected_result(>)) = 
    @@ -1,3 +1,2 @@
     int func(int i) { 
    -        int x, y;
     }
@�2addbeforeafter.res@�+deftodo.res@�*badpos.res�	�PROBLEM
   exn = Failure("rule starting on line 1: already tagged token:\nC code context\nFile \"tests/badpos.c\", line 5, column 30,  charpos = 139\n    around = 'reg_ptr', whole content = \t (int) -(((struct pt_regs *) reg_ptr)->orig_eax + 2));")
@�'exp.res@@�(pmac.res@�4metastatement_if.res@@�,cast_iso.res@@�,ty_tyexp.res@�=labels_metastatement_ver1.res@@�'hex.res@@�)test9.res@�.keep_comma.res@�2inherited_ver1.res@�)cards.res@�'cst.res@�0doubleswitch.res@@�(dbg1.res�
  �INCORRECT:diff token: E VS (
File <COCCIOUTPUTFILE>, line 5, column 2,  charpos = 75
    around = 'E', whole content = 		E = NULL;("PCI");
File "tests/dbg1.res", line 4, column 5,  charpos = 72
    around = '(', whole content = 		DBG("PCI");

    diff (result(<) vs expected_result(>)) = 
    @@ -1,6 +1,6 @@
     
     static inline void alloc_resource(struct pci_dev *dev, int idx)
     {
    -		DBG
    -		E = NULL;("PCI");
    +		DBG("PCI");
    +		E = NULL;
     }
�+headers.res@�*inline.res@@�0expopt3_ver2.res@@�2struct_typedef.res@�/const_array.res@@�-param_end.res@�.ifdefmeta4.res�	GPROBLEM
   exn = Unix.Unix_error(20, "stat", "tests/ifdefmeta4.cocci")
@�*test_s.res@�)test8.res@@�-minusdots.res@@�-multivars.res@�0expopt3_ver1.res@@�3return_implicit.res@�)ifadd.res@�,isococci.res@@�&ty.res@�)serio.res�
  INCORRECT:diff token: init_MUTEX VS mutex_init
File "tests/serio.c", line 7, column 1,  charpos = 130
    around = 'init_MUTEX', whole content = 	init_MUTEX(&serio->drv_sem);
File "tests/serio.res", line 7, column 1,  charpos = 130
    around = 'mutex_init', whole content = 	mutex_init(&serio->new_lock);

    diff (result(<) vs expected_result(>)) = 
    @@ -4,5 +4,5 @@
     
     static void serio_init_port(struct serio *serio)
     {
    -	init_MUTEX(&serio->drv_sem);
    +	mutex_init(&serio->new_lock);
     }
�/remove_call.res@�.multichars.res@�.ifdefmeta3.res@�0a_and_e_ver1.res@�'com.res@@�)test7.res@�'lid.res@�;initializer_many_fields.res@@�)stm10.res@@@�+retval2.res@�(incl.res@�(anon.res@�)ktype.res@@�+varargs.res@�)exitp.res�	&PROBLEM
   exn = Failure("no python")
�.ifdefmeta2.res@�+fortype.res@@�)test6.res@�+addelse.res@@�0const_adding.res@�+localid.res@�'dec.res@@�(type.res@@�(ifzz.res@�*incdir.res�
  �INCORRECT:diff token: x VS 12
File "tests/incdir.c", line 4, column 6,  charpos = 46
    around = 'x', whole content =   foo(x);
File "tests/incdir.res", line 4, column 6,  charpos = 46
    around = '12', whole content =   foo(12);

    diff (result(<) vs expected_result(>)) = 
    @@ -1,5 +1,5 @@
     #include "sub/incdir2.c"
     
     int main () {
    -  foo(x);
    +  foo(12);
     }
�*addtoo.res@@�'ty1.res@�,addfield.res@�'kmc.res@�.ifdefmeta1.res@@�)test5.res@@�,cst_null.res@�1double_switch.res@@�)strid.res@�(stmt.res@�-longconst.res@�&ar.res@@�'opt.res@@�-wierdinit.res�
  Xseems incorrect, but only because of code that was not parsablediff token: dev_link_t VS struct
File "tests/wierdinit.c", line 4, column 1,  charpos = 27
    around = 'dev_link_t', whole content = 	dev_link_t *link;
File "tests/wierdinit.res", line 4, column 1,  charpos = 27
    around = 'struct', whole content = 	struct pcmcia_device *link;
�,retmacro.res@@�)test4.res@�.define_exp.res@@�.stm10_ver1.res@�'a3d.res@�'ifd.res@�,comments.res@@@�+declinv.res�	DPROBLEM
   exn = Unix.Unix_error(20, "stat", "tests/declinv.cocci")
@@�)test3.res@�+expopt3.res@�+dowhile.res@�0double_lines.res@�+a_and_e.res@@�*threea.res@�/three_types.res@�*test12.res@�(enum.res@@�*regexp.res@@�(tdnl.res@�3parameters_dots.res@�(cast.res@@@�)test2.res@�&nl.res@�+expopt2.res@@�*test11.res@�+constty.res@�&hd.res@@@�7pb_distribute_type4.res@�+ifdef6a.res@�*constx.res@@�-minstruct.res@@�)test1.res@�)orexp.res@@�'ws2.res@�*test10.res@�*addif2.res@@�.distribute.res@@�0strangeorder.res@�7pb_distribute_type3.res�	?PROBLEM
   exn = Failure("line 7: index 53 53 already used\n")
@�+isotest.res@�&b2.res@@�'top.res@�)test0.res@�+bugloop.res@�*doundo.res@@�2typedef_double.res@�*addif1.res@�-gotobreak.res@@�*badexp.res@@�7pb_distribute_type2.res�
  /INCORRECT:PB parsing only in generated-file
    diff (result(<) vs expected_result(>)) = 
    @@ -1,5 +1,5 @@
     int foo() {
    -  int* x;
    +  int *x;
       return 0;
     }
     
    @@ -10,6 +10,6 @@
     }
     
     int foo() {
    -  int x[45]*;
    +  int (*x)[45];
       return 0;
     }
�-find_long.res@�*expopt.res@@�&b1.res@�.badtypedef.res@@�,typedef3.res�
  rINCORRECT:diff token: link VS p_dev
File <COCCIOUTPUTFILE>, line 7, column 29,  charpos = 137
    around = 'link', whole content = 	unsigned int iobase = info->link.io.BasePort1;
File "tests/typedef3.res", line 7, column 29,  charpos = 137
    around = 'p_dev', whole content = 	unsigned int iobase = info->p_dev->io.BasePort1;

    diff (result(<) vs expected_result(>)) = 
    @@ -4,7 +4,7 @@
     
     static void should_work(foo *info)
     {
    -	unsigned int iobase = info->link.io.BasePort1;
    +	unsigned int iobase = info->p_dev->io.BasePort1;
     }
     
     static void does_work(struct bluecard_info_t *info)
�(rcu3.res@@�1match_no_meta.res@�)bugon.res@@�,str_init.res@�)const.res@�0define_param.res@�)break.res@@�4line_before_last.res@@�*spaces.res@@@�*proto2.res@�)empty.res@@�+minenum.res@@�-structfoo.res@@�*static.res@@�-ifdefmeta.res@�(hil1.res@@�,twomatch.res@�.justremove.res@�/macro_int16.res@@