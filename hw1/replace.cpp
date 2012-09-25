#include "llvm/Pass.h"
#include "llvm/Function.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Module.h"
#include "llvm/BasicBlock.h"
#include "stdlib.h"
#include "stdio.h"
#include "llvm/Support/CallSite.h"
#include "llvm/Instructions.h"
#include "llvm/ADT/ilist.h"
using namespace llvm;

namespace {
  struct replace : public ModulePass {

    static char ID;
    replace() : ModulePass(ID) {}

    virtual bool runOnModule(Module &m) {
      Module::FunctionListType &functions = m.getFunctionList();
      Function *func;
      for (Module::FunctionListType::iterator it = functions.begin(),
             it_end = functions.end(); it != it_end; ++it) {
        func = it;
        if(func->getName()=="my_printf")
        {
          errs()<<"find my_printf\n";
          break;
        }
      }

      for (Module::FunctionListType::iterator b = functions.begin(), be = functions.end();
           b != be;
           ++b) {
        for (Function::BasicBlockListType::iterator i = b->begin(), ie = b->end(); 
             i != ie; 
             ++i) {
          for(BasicBlock::InstListType::iterator inst = i->begin(),
                inste = i->end();
              inst!=inste;
              inst++)
          {
            //InvokeInst * invokeInst=NULL;
            if (CallInst*  callInst = dyn_cast<CallInst>(inst) ) {
              errs() << "find a call in ";
              errs().write_escaped(b->getName()) << ":";
              errs().write_escaped(callInst->getCalledFunction()->getName()) << "\n";

              if(callInst->getCalledFunction()->getName()=="printf"){}
            }  /* if */
          }  /* for instruction */
        } /* for block */
      }  /* for module */
      return true;

    }//runonmodule
  };//struct
}//namespace
char replace::ID = 0;

static RegisterPass<replace> X("replace", "replacepass", false, false);
