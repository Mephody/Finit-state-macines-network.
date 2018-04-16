//---------------------------------------------------------------------------
#include<iostream.h>
#include<conio.h>
#include<stdlib.h>
#include <stdio.h>
#include <io.h>
#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
struct Tstimul{
        char sost;
        int nomer;

        } stimul, *masstimul;

FILE *in_b,*in_t,*in_t01, *out_b, *out_t, *out_t01;

char File_in_t[] = "in_t.txt";
char File_in_b[] = "in_b.dat";
char File_in_t01[] = "in_t01.dat";

char File_out_t[] = "out_t.txt";
char File_out_b[] = "out_b.dat";
char File_out_t01[] = "out_t01.dat";

int size = sizeof(Tstimul);

int zd=0;

TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TForm1::FormCreate(TObject *Sender)
{
 Memo1->Lines->Clear();
 Edit1->Text="r1";
 Edit2->Text="4";
 Edit3->Text="10";
}
//---------------------------------------------------------------------------


void __fastcall TForm1::Button2Click(TObject *Sender)
{
 in_t=fopen(File_in_t, "at");

 fprintf(in_t,"%s\n", Edit1->Text);

 Memo1->Lines->Add(Edit1->Text+"\n");
 fclose(in_t);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button3Click(TObject *Sender)
{


 in_t=fopen(File_in_t, "wt");
 in_t01=fopen(File_in_t01, "wt");
 in_b=fopen(File_in_b, "wb");

 int n=StrToInt(Edit2->Text);
 int k=StrToInt(Edit3->Text);

 masstimul=new Tstimul[k];


 randomize();
 for(int i=0; i<k;i++)
        {
         switch(random(3))
                {
                 case 0: stimul.sost='r';
                        fprintf(in_t01,"00");
                        break;
                 case 1: stimul.sost='w';
                        fprintf(in_t01,"01");
                        break;
                 case 2: stimul.sost='e';
                        fprintf(in_t01,"10");
                        break;
                }

         stimul.nomer=random(n)+1;

         switch(stimul.nomer)
                {
                 case 1: fprintf(in_t01,"00\n"); break;
                 case 2: fprintf(in_t01,"01\n"); break;
                 case 3: fprintf(in_t01,"10\n"); break;
                 case 4: fprintf(in_t01,"11\n"); break;

                }

         

         masstimul[i]=stimul;


         Memo1->Lines->Add(String(stimul.sost)+IntToStr(stimul.nomer)+"\n");
         fprintf(in_t,"%c%i\n", stimul.sost, stimul.nomer);

         fwrite(&stimul, size, 1, in_b);
        }

 zd=1;


 fclose(in_t);
 fclose(in_t01);
 fclose(in_b);


}
//---------------------------------------------------------------------------

void __fastcall TForm1::Edit2KeyPress(TObject *Sender, char &Key)
{
 if (Key!=8 && Key!='-' && Key!=',') if ((Key < '0') || (Key > '9')) Key = NULL;        
}
//---------------------------------------------------------------------------


void __fastcall TForm1::Edit3KeyPress(TObject *Sender, char &Key)
{
 if (Key!=8 && Key!='-' && Key!=',') if ((Key < '0') || (Key > '9')) Key = NULL;         
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button1Click(TObject *Sender)
{
 char *avtomat;
 int n=StrToInt(Edit2->Text);
 int k=StrToInt(Edit3->Text);
 String s;
 Memo1->Lines->Clear();
 if (zd==0)
        {
         in_b=fopen(File_in_b, "rb");

         int len = filelength(fileno(in_b));
         double kol = len/size;

         if (kol==0)
                {
                Memo1->Lines->Add("��� ��������! ������� �� ������ <���������>");
                return;
                }
         masstimul=new Tstimul[kol];

         for (int i=0; i < kol; i++)
                {
                 fread((masstimul+i), size, 1, in_b);
                 Memo1->Lines->Add(String(masstimul[i].sost)+IntToStr(masstimul[i].nomer)+"\n");
                }

        }


 out_t=fopen(File_out_t, "wt");
 out_b=fopen(File_out_b, "wb");
 out_t01=fopen(File_out_t01, "wt");

 avtomat = new char [n+1];
 
 avtomat[0]=' ';
 for(int i=1;i<=n;i++)
        {
         avtomat[i]='i';
         
        }
 int size_avtomat = sizeof(avtomat);
 Memo1->Lines->Add(String(avtomat));
 Memo1->Lines->Add("\n");
 for(int j=0;j<k; j++)
        {

         for (int i=1;i<=n;i++)
                {
                 switch (masstimul[j].sost)
                        {
                        case 'r':
                                if (avtomat[i]=='i' && masstimul[j].nomer==i) avtomat[i]='s';
                                if (avtomat[i]=='m' && masstimul[j].nomer!=i) avtomat[i]='s';
                                break;
                        case 'w':
                                if (masstimul[j].nomer==i) avtomat[i]='m';
                                        else avtomat[i]='i';
                                break;
                        case 'e':
                                if (masstimul[j].nomer==i) avtomat[i]='i';
                                break;
                        }
                 switch(avtomat[i])
                        {
                         case 'm': fprintf(out_t01,"00"); break;
                         case 's': fprintf(out_t01,"01"); break;
                         case 'i': fprintf(out_t01,"10"); break;
                        }
                 //m-00 s-01 i-10
                 fprintf(out_t, "%c", avtomat[i]);

                }
         fwrite(&avtomat, size_avtomat, 1, out_b );
         fprintf(out_t, "\n");
         fprintf(out_t01,"\n");
         s=AnsiString(avtomat);
         Memo1->Lines->Add(IntToStr(j)+":"+s);

        }
 fclose(out_t);
 fclose(out_b);
}
//---------------------------------------------------------------------------


void __fastcall TForm1::Button4Click(TObject *Sender)
{
 Memo1->Lines->Clear();
}
//---------------------------------------------------------------------------

