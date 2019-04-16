//---------------------------------------------------------------------------

#ifndef Unit1H
#define Unit1H
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
        TButton *test;
        TButton *lvl2;
        TButton *lvl3;
        TButton *manual;
        TTimer *test1;
        TTimer *test2;
        TTimer *test3;
        TPaintBox *pb1;
        TImage *img1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall testClick(TObject *Sender);
        void __fastcall test1Timer(TObject *Sender);
        void __fastcall testKeyPress(TObject *Sender, char &Key);
        void __fastcall lvl2Click(TObject *Sender);
        void __fastcall lvl2KeyPress(TObject *Sender, char &Key);
        void __fastcall test2Timer(TObject *Sender);
        void __fastcall lvl3Click(TObject *Sender);
        void __fastcall lvl3KeyPress(TObject *Sender, char &Key);
        void __fastcall test3Timer(TObject *Sender);
        void __fastcall manualClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
