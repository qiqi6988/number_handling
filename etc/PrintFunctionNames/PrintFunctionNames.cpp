//===- PrintFunctionNames.cpp ---------------------------------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// Example clang plugin which simply prints the names of all the top-level decls
// in the input file.
//
//===----------------------------------------------------------------------===//
//
#include "clang/Frontend/FrontendPluginRegistry.h"
#include "clang/AST/ASTConsumer.h"
#include "clang/AST/AST.h"
#include "clang/Frontend/CompilerInstance.h"
#include "llvm/Support/raw_ostream.h"
using namespace clang;

namespace {

class PrintFunctionsConsumer : public ASTConsumer {
public:
  virtual bool HandleTopLevelDecl(DeclGroupRef DG) {
    for (DeclGroupRef::iterator i = DG.begin(), e = DG.end(); i != e; ++i) {
      const Decl *D = *i;
        if(const NamedDecl *ND = dyn_cast<NamedDecl>(D))
	{
        llvm::errs() << "top-level declaration:\n" << ND->getNameAsString() << "\"\n";
	IdentifierInfo * IdInfo=ND->getIdentifier();
	tok::TokenKind tk= IdInfo->getTokenID();
	const char * tname=tok::getTokenName(tk);
	llvm::errs()<<"token name is:";
	llvm::errs().write_escaped(tname);
	llvm::errs()<<"\n";
	 if( const FunctionDecl * FD=dyn_cast<FunctionDecl>(D))
        {
		llvm::errs()<<"function declaration:\n";
                QualType qt=FD->getResultType();
                SplitQualType sqt=qt.split();
                llvm::errs().write_escaped(QualType::getAsString(sqt));
       		llvm::errs()<<"\n";
	 }

	bool isadd=IdInfo->isStr("add");
        if(isadd)
	{
	llvm::errs()<<"This is add declaration\n";
	}
	 if(const VarDecl *VD=dyn_cast<VarDecl>(D))
        {
                llvm::errs()<<"Variable-declaration:\n";
                QualType qt=VD->getType();
                SplitQualType sqt=qt.split();
                llvm::errs().write_escaped(QualType::getAsString(sqt));
       		llvm::errs()<<"\n";
	 }
	llvm::errs()<<"\n";
	}//if
    }//for

    return true;
  }//HandleTopLevelDecl
};//namespace

class PrintFunctionNamesAction : public PluginASTAction {
protected:
  ASTConsumer *CreateASTConsumer(CompilerInstance &CI, llvm::StringRef) {
    return new PrintFunctionsConsumer();
  }

  bool ParseArgs(const CompilerInstance &CI,
                 const std::vector<std::string>& args) {
    for (unsigned i = 0, e = args.size(); i != e; ++i) {
      llvm::errs() << "PrintFunctionNames arg = " << args[i] << "\n";

      // Example error handling.
      if (args[i] == "-an-error") {
        DiagnosticsEngine &D = CI.getDiagnostics();
        unsigned DiagID = D.getCustomDiagID(
          DiagnosticsEngine::Error, "invalid argument '" + args[i] + "'");
        D.Report(DiagID);
        return false;
      }
    }
    if (args.size() && args[0] == "help")
      PrintHelp(llvm::errs());

    return true;
  }
  void PrintHelp(llvm::raw_ostream& ros) {
    ros << "Help for PrintFunctionNames plugin goes here\n";
  }

};

}

static FrontendPluginRegistry::Add<PrintFunctionNamesAction>
X("print-fns", "print function names");
