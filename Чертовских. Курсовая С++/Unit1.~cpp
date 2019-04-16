//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;

   int x1,y1,x2,y2,x3,y3,x4,y4,xg1,yg1,xg2,yg2;//Координаты турели и пушки
   bool alive;//Проврка на живость персонажа
   int xw1,yw1,xw2,yw2,xw3,yw3,xw4,yw4,xwg;//координаты первого противника и его оружия
   bool pr1;//Проверка на живость первого противника
   int xe1,ye1,xe2,ye2,xe3,ye3,xe4,ye4,xeg;//координаты второго противника и его оружия
   int xr1,yr1,xr2,yr2,xr3,yr3,xr4,yr4,xrg;//координаты третьего противника и его оружия
   int xt1,yt1,xt2,yt2,xt3,yt3,xt4,yt4;//координаты четвёртого противника
   bool pr2;//Проверка на живость второго противника
   bool pr3;//Проверка на живость третьего противника
   bool pr4;//Проверка на живость третьего противника
   bool shot;//Выстрел
   int i;//Вспомогательный элемент выстрела
   bool there1,there2;//Направление движения противников
   bool dest;//Переменная, необходимая для корректной работы программы

//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TForm1::FormCreate(TObject *Sender)
{
  shot=false;
  test1->Enabled=false;
  test2->Enabled=false;
  test3->Enabled=false;
  img1->Picture->LoadFromFile("img1.bmp");
  dest=false;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::testClick(TObject *Sender)
{
   if (dest==false){
         img1->Picture->LoadFromFile("img2.bmp");
         dest=true;
   }
   shot=false;
   i=0;
   alive=true;
   test1->Enabled=true;
   test2->Enabled=false;
   test3->Enabled=false;
   pr1=true;
   pr2=true;
   there1=true;
   there2=true;
   pb1->Canvas->Pen->Color = clBlack;  //Начало игры!
   x1=pb1->Width / 2; //Задаём координаты турели
   y1=pb1->Height / 2;
   x2=x1+10;
   y2=y1;
   x3=x2;
   y3=y2+10;
   x4=x3-10;
   y4=y3;
   xg1=x1+5; //Задаём координаты пушки
   yg1=y1;
   xg2=xg1;
   yg2=yg1-5;
   xw1=111; //Задаём координаты первого противника
   yw1=96;
   xw2=xw1+10;
   yw2=yw1;
   xw3=xw2;
   yw3=yw2+10;
   xw4=xw3-10;
   yw4=yw3;
   xwg=xw4+5;
   xe1=415; //Задаём координаты второго противника
   ye1=397;
   xe2=xe1+10;
   ye2=ye1;
   xe3=xe2;
   ye3=ye2+10;
   xe4=xe3-10;
   ye4=ye3;
   xeg=ye4-5;
   pb1->Canvas->MoveTo(x1,y1); //Отрисовываем турель
   pb1->Canvas->LineTo(x2,y2);
   pb1->Canvas->LineTo(x3,y3);
   pb1->Canvas->LineTo(x4,y4);
   pb1->Canvas->LineTo(x1,y1);
   pb1->Canvas->MoveTo(0,pb1->Height-1); //Отрисовываем края карты
   pb1->Canvas->LineTo(pb1->Width-1,pb1->Height-1);
   pb1->Canvas->LineTo(pb1->Width-1,0);
   pb1->Canvas->LineTo(0,0);
   pb1->Canvas->LineTo(0,pb1->Height-1);
   pb1->Canvas->MoveTo(xw1,yw1); //Отрисовываем противников
   pb1->Canvas->LineTo(xw2,yw2);
   pb1->Canvas->LineTo(xw3,yw3);
   pb1->Canvas->LineTo(xw4,yw4);
   pb1->Canvas->LineTo(xw1,yw1);
   pb1->Canvas->MoveTo(xe1,ye1);
   pb1->Canvas->LineTo(xe2,ye2);
   pb1->Canvas->LineTo(xe3,ye3);
   pb1->Canvas->LineTo(xe4,ye4);
   pb1->Canvas->LineTo(xe1,ye1);
   pb1->Canvas->Pen->Color = clRed;
   pb1->Canvas->MoveTo(xwg,yw3); //Отрисовываем выстрел первого противников
   pb1->Canvas->LineTo(xwg,pb1->Height);
   pb1->Canvas->MoveTo(0,xeg); //Отрисовываем выстрел второго противников
   pb1->Canvas->LineTo(xe1,xeg);
   pb1->Canvas->Pen->Color = clRed; //Отрисовываем пушку
   pb1->Canvas->MoveTo(xg1,yg1);
   pb1->Canvas->LineTo(xg2,yg2);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::test1Timer(TObject *Sender)
{
   int a,b,c;
   if (alive==true){
   pb1->Refresh();
   pb1->Canvas->Pen->Color = clBlack;  //Отрисовываем турель
   pb1->Canvas->MoveTo(x1,y1);
   pb1->Canvas->LineTo(x2,y2);
   pb1->Canvas->LineTo(x3,y3);
   pb1->Canvas->LineTo(x4,y4);
   pb1->Canvas->LineTo(x1,y1);
   pb1->Canvas->MoveTo(0,pb1->Height-1); //Отрисовываем края карты
   pb1->Canvas->LineTo(pb1->Width-1,pb1->Height-1);
   pb1->Canvas->LineTo(pb1->Width-1,0);
   pb1->Canvas->LineTo(0,0);
   pb1->Canvas->LineTo(0,pb1->Height-1);
   pb1->Canvas->Pen->Color = clRed;   //Отрисовываем пушку
   pb1->Canvas->MoveTo(xg1,yg1);
   pb1->Canvas->LineTo(xg2,yg2);
   if (shot==true){ //Стреляем из лазера
    if (i!=5){
     if (yg2 == y1-5){  //Если смотрим вверх
      pb1->Canvas->LineTo(xg2,0);  //Ресуем лазер
      for (a=0;a<=yg1;a++){  //смерть первого противника
       for (c=xw1;c<=xw2;c++){
        if ((a==yw3)&&(xg2==c)){
         pr1=false;
        }
       }
      }
      for (a=y1;a>=0;a--){  //смерть второго противника
       for (b=ye1;b<=ye3;b++){
        for (c=xe1;c<=xe2;c++){
         if ((a==b)&&(xg2==c)){
          pr2=false;
         }
        }
       }
      }
     }
     if (yg2 == y3+5){//Если смотрим вниз
      pb1->Canvas->LineTo(xg2,pb1->Height);  //Ресуем лазер
      for (a=y3;a<=pb1->Height;a++){ //Смерть первого противника
       for (b=yw1;b<=yw3;b++){
        for (c=xw1;c<=xw2;c++){
         if ((a==b)&&(xg2==c)){
          pr1=false;
         }
        }
       }
      }
      for (a=y3;a<=pb1->Height;a++){  //Смерть второго противника
       for (b=ye1;b<=ye3;b++){
        for (c=xe1;c<=xe2;c++){
         if ((a==b)&&(xg2==c)){
          pr2=false;
         }
        }
       }
      }
     }
     if (xg2 == x1-5){ //Если смотрим влево
      pb1->Canvas->LineTo(0,yg2);
      for (a=x1;a>=0;a--){//Смерть первого противника
       for (b=yw1;b<=yw3;b++){
        for (c=xw1;c<=xw2;c++){
         if ((a==c)&&(yg2==b)){
          pr1=false;
         }
        }
       }
      }
      for (a=x1;a>=0;a--){//Смерть второго противника
       for (b=ye1;b<=ye3;b++){
        for (c=xe1;c<=xe2;c++){
         if ((a==c)&&(yg2==b)){
          pr2=false;
         }
        }
       }
      }
     }
     if (xg2 == x2+5){ //Если смотрим вправо
      pb1->Canvas->LineTo(pb1->Width,yg2);
      for (a=x1;a<=pb1->Width;a++){//Смерть первого противника
       for (b=yw1;b<=yw3;b++){
        for (c=xw1;c<=xw2;c++){
         if ((a==c)&&(yg2==b)){
          pr1=false;
         }
        }
       }
      }
      for (a=x1;a<=pb1->Width;a++){//Смерть второго противника
       for (b=ye1;b<=ye3;b++){
        for (c=xe1;c<=xe2;c++){
         if ((a==c)&&(yg2==b)){
          pr2=false;
         }
        }
       }
      }
     }
     i=i+1;
    }
    else{
    i=0;
    shot=false;
    }
   }
   if (pr1==true){ //Если первый противник жив
    if (there1==true){
     xw1=xw1+1;//Движение противника
     xw2=xw2+1;
     xw3=xw3+1;
     xw4=xw4+1;
     xwg=xwg+1;
     if (xw2==pb1->Width){
      there1=false;
     }
    }
    else{
     xw1=xw1-1;//Движение противника
     xw2=xw2-1;
     xw3=xw3-1;
     xw4=xw4-1;
     xwg=xwg-1;
     if (xw1==0){
      there1=true;
     }
    }
    pb1->Canvas->Pen->Color = clBlack;
    pb1->Canvas->MoveTo(xw1,yw1); //Отрисовываем противника
    pb1->Canvas->LineTo(xw2,yw2);
    pb1->Canvas->LineTo(xw3,yw3);
    pb1->Canvas->LineTo(xw4,yw4);
    pb1->Canvas->LineTo(xw1,yw1);
    pb1->Canvas->Pen->Color = clRed;
    pb1->Canvas->MoveTo(xwg,yw3); //Отрисовываем выстрел противника
    pb1->Canvas->LineTo(xwg,pb1->Height);
   }
   else{ //Если первый противник мёртв
    xw1=-5;
    xw2=-5;
    xw3=-5;
    xw4=-5;
    yw1=-5;
    yw2=-5;
    yw3=-5;
    yw4=-5;
    xwg=-5;
   }
   if (pr2==true){ //Если второй противник жив
    if (there2==true){
     ye1=ye1-1;//Движение противника
     ye2=ye2-1;
     ye3=ye3-1;
     ye4=ye4-1;
     xeg=xeg-1;
     if (ye2==0){
      there2=false;
     }
    }
    else{
     ye1=ye1+1;//Движение противника
     ye2=ye2+1;
     ye3=ye3+1;
     ye4=ye4+1;
     xeg=xeg+1;
     if (ye3==pb1->Height){
      there2=true;
     }
    }
    pb1->Canvas->Pen->Color = clBlack;
    pb1->Canvas->MoveTo(xe1,ye1);
    pb1->Canvas->LineTo(xe2,ye2);
    pb1->Canvas->LineTo(xe3,ye3);
    pb1->Canvas->LineTo(xe4,ye4);
    pb1->Canvas->LineTo(xe1,ye1);
    pb1->Canvas->Pen->Color = clRed;
    pb1->Canvas->MoveTo(0,xeg); //Отрисовываем выстрелы противников
    pb1->Canvas->LineTo(xe1,xeg);
   }
   else{ //Если второй противник мёртв
    xe1=-5;
    xe2=-5;
    xe3=-5;
    xe4=-5;
    ye1=-5;
    ye2=-5;
    ye3=-5;
    ye4=-5;
    xeg=-5;
   }                   //СМЕРТИ ОТ ПЕРВОГО ПРОТИВНИКА!!!
   for (a=xw4;a<=xw3;a++){  //Смерть от противника
    if (((x1==a) && (y1==yw3)) || ((x2==a) && (y1==yw3))){
      alive=false;
    }
   }
    for (a=xw1;a<=xw2;a++){//Смерть от противника
     if (((x3==a) && (y3==yw1)) || ((x4==a) && (y3==yw1))){
      alive=false;
     }
    }
   for (a=yw2;a<=yw3;a++){  //Смерть от противника
    if (((y1==a) && (x1==xw2)) || ((y4==a) && (x1==xw2))){
     alive=false;
    }
   }
   for (a=yw1;a<=yw4;a++){  //Смерть от противника
    if (((y2==a) && (x2==xw1)) || ((y3==a) && (x2==xw1))){
      alive=false;
     }
   }
   for (a=yw3;a<=pb1->Height;a++){ //Смерть от лазера
    if ((y1==a) && (x1==xwg)){
      alive=false;
    }
   }
   for (a=yw3;a<=pb1->Height;a++){ //Смерть от лазера
    if ((y3==a) && (x2==xwg)){
     alive=false;
    }
   }
   //СМЕРТИ ОТ ВТОРОГО ПРОТИВНИКА!!!
   for (a=xe4;a<=xe3;a++){  //Смерть от противника (вверх)
    if (((x1==a) && (y1==ye3)) || ((x2==a) && (y1==ye3))){
     alive=false;
    }
   }
   for (a=xe1;a<=xe2;a++){//Смерть от противника (Вниз)
    if (((x3==a) && (y3==ye1)) || ((x4==a) && (y3==ye1))){
     alive=false;
    }
   }
   for (a=ye2;a<=ye3;a++){  //Смерть от противника (влево)
    if (((y1==a) && (x1==xe2)) || ((y4==a) && (x1==xe2))){
     alive=false;
    }
   }
   for (a==ye1;a<=ye4;a++){  //Смерть от противника (впрао)
    if (((y2==a) && (x2==xe1)) || ((y3==a) && (x2==xe1))){
     alive=false;
    }
   }
   for (a=0;a<=xe1;a++){ //Смерть от лазера
    if ((x1==a) && (y1==xeg)){
     alive=false;
    }
   }
   for (a=0;a<=xe1;a++){ //Смерть от лазера
    if ((x3==a) && (y3==xeg)){
     alive=false;
    }
   }
   if ((pr1==false) && (pr2==false)){
    pb1->Refresh();
    pb1->Canvas->TextOut((pb1->Width / 2)-70,pb1->Height / 2,"YOU WIN! Для повтора уровня нажми пробел");
    test1->Enabled=false;
   }
  }
  else{
   pb1->Refresh();
   pb1->Canvas->TextOut((pb1->Width / 2)-70,pb1->Height / 2,"GAME OVER! Для повтора уровня нажми пробел");
   test1->Enabled=false;
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::testKeyPress(TObject *Sender, char &Key)
{
   int a;
   if ((Key == 'w') || (Key == 'ц') || (Key == 'Ц') || (Key == 'W')){  //Движение вверх
    if (y1>0){ //Если не край карты
     y1=y1-1;   //Задаём новые координаты турели
     y2=y2-1;
     y3=y3-1;
     y4=y4-1;
     xg1=x1+5;  //Задаём новые координаты пушки
     yg1=y1;
     xg2=xg1;
     yg2=yg1-5;
     for (a=xw4;a<=xw3;a++){  //Смерть от первого противника
      if (((x1==a) && (y1==yw3)) || ((x2==a) && (y1==yw3))){
       alive=false;
      }
     }
     for (a=xe4;a<=xe3;a++){  //Смерть от второго противника
      if (((x1==a) && (y1==ye3)) || ((x2==a) && (y1==ye3))){
       alive=false;
      }
     }
     for (a=0;a<=xe1;a++){ //Смерть от лазера
      if ((x1==a) && (y1==xeg)){
       alive=false;
      }
     }
    }
   }
   if ((Key == 's') || (Key == 'ы') || (Key == 'S') || (Key == 'Ы')){ //Движение вниз
    if (y3<pb1->Height){ //Если не край карты
     y1=y1+1; //Новые координаты турели
     y2=y2+1;
     y3=y3+1;
     y4=y4+1;
     xg1=x3-5;  //Задаём новые координаты пушки
     yg1=y3;
     xg2=xg1;
     yg2=yg1+5;
     for (a=xw1;a<=xw2;a++){//Смерть от первого противника
      if (((x3==a) && (y3==yw1)) || ((x4==a) && (y3==yw1))){
       alive=false;
      }
     }
     for (a=xe1;a<=xe2;a++){//Смерть от второго противника (Вниз)
      if (((x3==a) && (y3==ye1)) || ((x4==a) && (y3==ye1))){
       alive=false;
      }
     }
     for (a=0;a<=xe1;a++){ //Смерть от лазера
      if ((x3==a) && (y3==xeg)){
       alive=false;
      }
     }
    }
   }
   if ((Key == 'a') || (Key == 'ф') || (Key == 'Ф') || (Key == 'A')){//Движение влево
    if (x1>0){ //Если не край карты
     x1=x1-1; //Координаты турели
     x2=x2-1;
     x3=x3-1;
     x4=x4-1;
     xg1=x1;  //Задаём новые координаты пушки
     yg1=y1+5;
     xg2=xg1-5;
     yg2=yg1;
     for (a=yw2;a<=yw3;a++){  //Смерть от первого противника
      if (((y1==a) && (x1==xw2)) || ((y4==a) && (x1==xw2))){
       alive=false;
      }
     }
     for (a=ye2;a<=ye3;a++){  //Смерть от второго противника (влево)
      if (((y1==a) && (x1==xe2)) || ((y4==a) && (x1==xe2))){
       alive=false;
      }
     }
     for (a=yw3;a<=pb1->Height;a++){ //Смерть от лазера
      if ((y1==a) && (x1==xwg)){
       alive=false;
      }
     }
    }
   }
   if ((Key == 'd') || (Key == 'в') || (Key == 'D') || (Key == 'В')){ //Движение вправо
    if (x2<pb1->Width){//Если не край карты
     x1=x1+1; //Координаты турели
     x2=x2+1;
     x3=x3+1;
     x4=x4+1;
     xg1=x2;  //Задаём новые координаты пушки
     yg1=y2+5;
     xg2=xg1+5;
     yg2=yg1;
     for (a=yw1;a<=yw4;a++){  //Смерть от первого противника
      if (((y2==a) && (x2==xw1)) || ((y3==a) && (x2==xw1))){
       alive=false;
      }
     }
     for (a=ye1;a<=ye4;a++){  //Смерть от второго противника (впрао)
      if (((y2==a) && (x2==xe1)) || ((y3==a) && (x2==xe1))){
       alive=false;
      }
     }
     for (a=yw3;a<=pb1->Height;a++){ //Смерть от лазера
      if ((y3==a) && (x2==xwg)){
       alive=false;
      }
     }
    }
   }
   if ((Key == 'e') || (Key == 'у') || (Key == 'У') || (Key == 'E')){  //Стреляем из лазера
    shot=true;
   }
}
//---------------------------------------------------------------------------

void __fastcall TForm1::lvl2Click(TObject *Sender)
{
 if (dest==false){
  img1->Picture->LoadFromFile("img2.bmp");
  dest=true;
 }
 shot=false;
 pb1->Refresh();
 i=0;
 alive=true;
 test1->Enabled=false;
 test2->Enabled=true;
 test3->Enabled=false;
 pr1=true;
 pr2=true;
 pr3=true;
 pb1->Canvas->Pen->Color = clBlack;  //Начало игры!
 x1=pb1->Width / 2; //Задаём координаты турели
 y1=pb1->Height / 2;
 x2=x1+10;
 y2=y1;
 x3=x2;
 y3=y2+10;
 x4=x3-10;
 y4=y3;
 xg1=x1+5; //Задаём координаты пушки
 yg1=y1;
 xg2=xg1;
 yg2=yg1-5;
 xw1=0; //Задаём первого координаты противника
 yw1=0;
 xw2=xw1+10;
 yw2=yw1;
 xw3=xw2;
 yw3=yw2+10;
 xw4=xw3-10;
 yw4=yw3;
 xwg=xw4+5;
 xe1=pb1->Width-10; //Задаём второго координаты противника
 ye1=pb1->Height-10;
 xe2=xe1+10;
 ye2=ye1;
 xe3=xe2;
 ye3=ye2+10;
 xe4=xe3-10;
 ye4=ye3;
 xeg=ye4-5;
 xr1=pb1->Width-10; //Задаём координаты третьего противника
 yr1=0;
 xr2=xr1+10;
 yr2=yr1;
 xr3=xr2;
 yr3=yr2+10;
 xr4=xr3-10;
 yr4=yr3;
 xrg=xr4+5;
 pb1->Canvas->MoveTo(x1,y1); //Отрисовываем турель
 pb1->Canvas->LineTo(x2,y2);
 pb1->Canvas->LineTo(x3,y3);
 pb1->Canvas->LineTo(x4,y4);
 pb1->Canvas->LineTo(x1,y1);
 pb1->Canvas->MoveTo(0,pb1->Height-1); //Отрисовываем края карты
 pb1->Canvas->LineTo(pb1->Width-1,pb1->Height-1);
 pb1->Canvas->LineTo(pb1->Width-1,0);
 pb1->Canvas->LineTo(0,0);
 pb1->Canvas->LineTo(0,pb1->Height-1);
 pb1->Canvas->MoveTo(xw1,yw1); //Отрисовываем противников
 pb1->Canvas->LineTo(xw2,yw2); //Первый противник
 pb1->Canvas->LineTo(xw3,yw3);
 pb1->Canvas->LineTo(xw4,yw4);
 pb1->Canvas->LineTo(xw1,yw1);
 pb1->Canvas->MoveTo(xe1,ye1);//Второй противник
 pb1->Canvas->LineTo(xe2,ye2);
 pb1->Canvas->LineTo(xe3,ye3);
 pb1->Canvas->LineTo(xe4,ye4);
 pb1->Canvas->LineTo(xe1,ye1);
 pb1->Canvas->MoveTo(xr1,yr1);//Третий противник
 pb1->Canvas->LineTo(xr2,yr2);
 pb1->Canvas->LineTo(xr3,yr3);
 pb1->Canvas->LineTo(xr4,yr4);
 pb1->Canvas->LineTo(xr1,yr1);
 pb1->Canvas->Pen->Color = clRed;
 pb1->Canvas->MoveTo(xwg,yw3); //Отрисовываем выстрелы противников ПЕРВЫЙ
 pb1->Canvas->LineTo(xwg,pb1->Height);
 pb1->Canvas->MoveTo(0,xeg); //Отрисовываем выстрелы противников ВТОРОЙ
 pb1->Canvas->LineTo(xe1,xeg);
 pb1->Canvas->MoveTo(xrg,yr4); //Отрисовываем выстрелы противников ТРЕТИЙ
 pb1->Canvas->LineTo(xrg,pb1->Height);
 pb1->Canvas->Pen->Color = clRed; //Отрисовываем пушку
 pb1->Canvas->MoveTo(xg1,yg1);
 pb1->Canvas->LineTo(xg2,yg2);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::lvl2KeyPress(TObject *Sender, char &Key)
{
 int a;
 if ((Key == 'w') || (Key == 'ц') || (Key == 'Ц') || (Key == 'W')){  //Движение вверх
  if (y1>0){ //Если не край карты
   y1=y1-1;   //Задаём новые координаты турели
   y2=y2-1;
   y3=y3-1;
   y4=y4-1;
   xg1=x1+5;  //Задаём новые координаты пушки
   yg1=y1;
   xg2=xg1;
   yg2=yg1-5;
   for (a=xw4;a<=xw3;a++){  //Смерть от первого противника
    if (((x1==a) && (y1==yw3)) || ((x2==a) && (y1==yw3))){
     alive=false;
    }
   }
   for (a=xe4;a<=xe3;a++){  //Смерть от второго противника
    if (((x1==a) && (y1==ye3)) || ((x2==a) && (y1==ye3))){
     alive=false;
    }
   }
   for (a=xr4;a<=xr3;a++){  //Смерть от третьего противника
    if (((x1==a) && (y1==yr3)) || ((x2==a) && (y1==yr3))){
     alive=false;
    }
   }
   for (a=0;a<=xe1;a++){ //Смерть от лазера
    if ((x1==a) && (y1==xeg)){
     alive=false;
    }
   }
  }
 }
 if ((Key == 's') || (Key == 'ы') || (Key == 'S')|| (Key == 'Ы')){ //Движение вниз
  if (y3<pb1->Height){ //Если не край карты
   y1=y1+1; //Новые координаты турели
   y2=y2+1;
   y3=y3+1;
   y4=y4+1;
   xg1=x3-5;  //Задаём новые координаты пушки
   yg1=y3;
   xg2=xg1;
   yg2=yg1+5;
   for (a=xw1;a<=xw2;a++){//Смерть от первого противника
    if (((x3==a) && (y3==yw1)) || ((x4==a) && (y3==yw1))){
     alive=false;
    }
   }
   for (a=xe1;a<=xe2;a++){//Смерть от второго противника (Вниз)
    if (((x3==a) && (y3==ye1)) || ((x4==a) && (y3==ye1))){
     alive=false;
    }
   }
   for (a=xr1;a<=xr2;a++){//Смерть от третьего противника
    if (((x3==a) && (y3==yr1)) || ((x4==a) && (y3==yr1))){
     alive=false;
    }
   }
   for (a=0;a<=xe1;a++){ //Смерть от лазера
    if ((x3==a) && (y3==xeg)){
     alive=false;
    }
   }
  }
 }
 if ((Key == 'a') || (Key == 'ф') || (Key == 'Ф') || (Key == 'A')){//Движение влево
  if (x1>0){ //Если не край карты
   x1=x1-1; //Координаты турели
   x2=x2-1;
   x3=x3-1;
   x4=x4-1;
   xg1=x1;  //Задаём новые координаты пушки
   yg1=y1+5;
   xg2=xg1-5;
   yg2=yg1;
   for (a=yw2;a<=yw3;a++){  //Смерть от первого противника
    if (((y1==a) && (x1==xw2)) || ((y4==a) && (x1==xw2))){
     alive=false;
    }
   }
   for (a=ye2;a<=ye3;a++){  //Смерть от второго противника (влево)
    if (((y1==a) && (x1==xe2)) || ((y4==a) && (x1==xe2))){
     alive=false;
    }
   }
   for (a==yr2;a<=yr3;a++){  //Смерть от первого противника
    if (((y1==a) && (x1==xr2)) || ((y4==a) && (x1==xr2))){
     alive=false;
    }
   }
   for (a=yw3;a<=pb1->Height;a++){ //Смерть от первого лазера
    if ((y1==a) && (x1==xwg)){
     alive=false;
    }
   }
   for (a=yr3;a<=pb1->Height;a++){ //Смерть от третьего лазера
    if ((y1==a) && (x1==xrg)){
     alive=false;
    }
   }
  }
 }
 if ((Key == 'd') || (Key == 'в') || (Key == 'D') || (Key == 'В')){ //Движение вправо
  if (x2<pb1->Width){//Если не край карты
   x1=x1+1; //Координаты турели
   x2=x2+1;
   x3=x3+1;
   x4=x4+1;
   xg1=x2;  //Задаём новые координаты пушки
   yg1=y2+5;
   xg2=xg1+5;
   yg2=yg1;
   for (a=yw1;a<=yw4;a++){  //Смерть от первого противника
    if (((y2==a) && (x2==xw1)) || ((y3==a) && (x2==xw1))){
     alive=false;
    }
   }
   for (a=ye1;a<=ye4;a++){  //Смерть от второго противника (впрао)
    if (((y2==a) && (x2==xe1)) || ((y3==a) && (x2==xe1))){
     alive=false;
    }
   }
   for (a=yr1;a<=yr4;a++){  //Смерть от третьего противника
    if (((y2==a) && (x2==xr1)) || ((y3==a) && (x2==xr1))){
     alive=false;
    }
   }
   for (a=yw3;a<=pb1->Height;a++){ //Смерть от первого лазера
    if ((y3==a) && (x2==xwg)){
     alive=false;
    }
   }
   for (a=yr3;a<=pb1->Height;a++){ //Смерть от второго лазера
    if ((y3==a) && (x2==xrg)){
     alive=false;
    }
   }
  }
 }
 if ((Key == 'e') || (Key == 'у') || (Key == 'У') || (Key == 'E')){  //Стреляем из лазера
  shot=true;
 }
}
//---------------------------------------------------------------------------

void __fastcall TForm1::test2Timer(TObject *Sender)
{
 int a,b,c;
 if (alive==true){
  pb1->Refresh();
  pb1->Canvas->Pen->Color = clBlack;  //Отрисовываем турель
  pb1->Canvas->MoveTo(x1,y1);
  pb1->Canvas->LineTo(x2,y2);
  pb1->Canvas->LineTo(x3,y3);
  pb1->Canvas->LineTo(x4,y4);
  pb1->Canvas->LineTo(x1,y1);
  pb1->Canvas->MoveTo(0,pb1->Height-1); //Отрисовываем края карты
  pb1->Canvas->LineTo(pb1->Width-1,pb1->Height-1);
  pb1->Canvas->LineTo(pb1->Width-1,0);
  pb1->Canvas->LineTo(0,0);
  pb1->Canvas->LineTo(0,pb1->Height-1);
  pb1->Canvas->Pen->Color = clRed;   //Отрисовываем пушку
  pb1->Canvas->MoveTo(xg1,yg1);
  pb1->Canvas->LineTo(xg2,yg2);
  if (shot==true){ //Стреляем из лазера
   if (i!=5){
    if (yg2 == y1-5){  //Если смотрим вверх
     pb1->Canvas->LineTo(xg2,0);  //Ресуем лазер
     for (a=0;a<=yg1;a++){  //смерть первого противника
      for (c=xw1;c<=xw2;c++){
       if ((a==yw3)&&(xg2==c)){
        pr1=false;
       }
      }
     }
     for (a=y1;a>=0;a--){  //смерть второго противника
      for (b=ye1;b<=ye3;b++){
       for (c=xe1;c<=xe2;c++){
        if ((a==b)&&(xg2==c)){
         pr2=false;
        }
       }
      }
     }
     for (a=y1;a>=0;a--){  //смерть третьего противника
      for (b=yr1;b<=yr3;b++){
       for (c=xr1;c<=xr2;c++){
        if ((a==b)&&(xg2==c)){
         pr3=false;
        }
       }
      }
     }
    }
    if (yg2 == y3+5){//Если смотрим вниз
     pb1->Canvas->LineTo(xg2,pb1->Height);  //Ресуем лазер
     for (a=y3;a<=pb1->Height;a++){ //Смерть первого противника
      for (b=yw1;b<=yw3;b++){
       for (c=xw1;c<=xw2;c++){
        if ((a==b)&&(xg2==c)){
         pr1=false;
        }
       }
      }
     }
     for (a=y3;a<=pb1->Height;a++){  //Смерть второго противника
      for (b=ye1;b<=ye3;b++){
       for (c=xe1;c<=xe2;c++){
        if ((a==b)&&(xg2==c)){
         pr2=false;
        }
       }
      }
     }
     for (a=y3;a<=pb1->Height;a++){  //Смерть третьего противника
      for (b=yr1;b<=yr3;b++){
       for (c=xr1;c<=xr2;c++){
        if ((a==b)&&(xg2==c)){
         pr3=false;
        }
       }
      }
     }
    }
    if (xg2 == x1-5){ //Если смотрим влево
     pb1->Canvas->LineTo(0,yg2);
     for (a=x1;a>=0;a--){//Смерть первого противника
      for (b=yw1;b<=yw3;b++){
       for (c=xw1;c<=xw2;c++){
        if ((a==c)&&(yg2==b)){
         pr1=false;
        }
       }
      }
     }
     for (a=x1;a>=0;a--){//Смерть второго противника
      for (b=ye1;b<=ye3;b++){
       for (c=xe1;c<=xe2;c++){
        if ((a==c)&&(yg2==b)){
         pr2=false;
        }
       }
      }
     }
     for (a=x1;a>=0;a--){//Смерть третьего противника
      for (b=yr1;b<=yr3;b++){
       for (c=xe1;c<=xr2;c++){
        if ((a==c)&&(yg2==b)){
         pr3=false;
        }
       }
      }
     }
    }
    if (xg2 == x2+5){ //Если смотрим вправо
     pb1->Canvas->LineTo(pb1->Width,yg2);
     for (a=x1;a<=pb1->Width;a++){//Смерть первого противника
      for (b=yw1;b<=yw3;b++){
       for (c=xw1;c<=xw2;c++){
        if ((a==c)&&(yg2==b)){
         pr1=false;
        }
       }
      }
     }
     for (a=x1;a<=pb1->Width;a++){//Смерть второго противника
      for (b=ye1;b<=ye3;b++){
       for (c=xe1;c<=xe2;c++){
        if ((a==c)&&(yg2==b)){
         pr2=false;
        }
       }
      }
     }
     for (a=x1;a<=pb1->Width;a++){//Смерть третьего противника
      for (b=yr1;b<=yr3;b++){
       for (c=xr1;c<=xr2;c++){
        if ((a==c)&&(yg2==b)){
         pr3=false;
        }
       }
      }
     }
    }
    i=i+1;
   }else{
    i=0;
    shot=false;
   }
  }
  if (pr1==true){ //Если первый противник жив
   xw1=xw1+1;//Движение противника
   xw2=xw2+1;
   xw3=xw3+1;
   xw4=xw4+1;
   xwg=xwg+1;
   pb1->Canvas->Pen->Color = clBlack;
   pb1->Canvas->MoveTo(xw1,yw1); //Отрисовываем противника
   pb1->Canvas->LineTo(xw2,yw2);
   pb1->Canvas->LineTo(xw3,yw3);
   pb1->Canvas->LineTo(xw4,yw4);
   pb1->Canvas->LineTo(xw1,yw1);
   pb1->Canvas->Pen->Color = clRed;
   pb1->Canvas->MoveTo(xwg,yw3); //Отрисовываем выстрел противника
   pb1->Canvas->LineTo(xwg,pb1->Height);
  }else{//Если первый противник мёртв
   xw1=-5;
   xw2=-5;
   xw3=-5;
   xw4=-5;
   yw1=-5;
   yw2=-5;
   yw3=-5;
   yw4=-5;
   xwg=-5;
  }
  if (pr2==true){ //Если второй противник жив
   ye1=ye1-1;//Движение противника
   ye2=ye2-1;
   ye3=ye3-1;
   ye4=ye4-1;
   xeg=xeg-1;
   pb1->Canvas->Pen->Color = clBlack;
   pb1->Canvas->MoveTo(xe1,ye1);
   pb1->Canvas->LineTo(xe2,ye2);
   pb1->Canvas->LineTo(xe3,ye3);
   pb1->Canvas->LineTo(xe4,ye4);
   pb1->Canvas->LineTo(xe1,ye1);
   pb1->Canvas->Pen->Color = clRed;
   pb1->Canvas->MoveTo(0,xeg); //Отрисовываем выстрелы противников
   pb1->Canvas->LineTo(xe1,xeg);
  }else{ //Если второй противник мёртв
   xe1=-5;
   xe2=-5;
   xe3=-5;
   xe4=-5;
   ye1=-5;
   ye2=-5;
   ye3=-5;
   ye4=-5;
   xeg=-5;
  }
  if (pr3==true){ //Если третий противник жив
   xr1=xr1-1;//Движение противника
   xr2=xr2-1;
   xr3=xr3-1;
   xr4=xr4-1;
   xrg=xrg-1;
   pb1->Canvas->Pen->Color = clBlack;
   pb1->Canvas->MoveTo(xr1,yr1); //Отрисовываем противника
   pb1->Canvas->LineTo(xr2,yr2);
   pb1->Canvas->LineTo(xr3,yr3);
   pb1->Canvas->LineTo(xr4,yr4);
   pb1->Canvas->LineTo(xr1,yr1);
   pb1->Canvas->Pen->Color = clRed;
   pb1->Canvas->MoveTo(xrg,yr3); //Отрисовываем выстрел противника
   pb1->Canvas->LineTo(xrg,pb1->Height);
  }else{ //Если третий противник мёртв
   xr1=-5;
   xr2=-5;
   xr3=-5;
   xr4=-5;
   yr1=-5;
   yr2=-5;
   yr3=-5;
   yr4=-5;
   xrg=-5;
  }
   //СМЕРТИ ОТ ПЕРВОГО ПРОТИВНИКА!!!
  for (a=xw4;a<=xw3;a++){  //Смерть от противника
   if (((x1==a) && (y1==yw3)) || ((x2==a) && (y1==yw3))){
    alive=false;
   }
  }
  for (a=xw1;a<=xw2;a++){//Смерть от противника
   if (((x3==a) && (y3==yw1)) || ((x4==a) && (y3==yw1))){
    alive=false;
   }
  }
  for (a=yw2;a<=yw3;a++){  //Смерть от противника
   if (((y1==a) && (x1==xw2)) || ((y4==a) && (x1==xw2))){
    alive=false;
   }
  }
  for (a=yw1;a<=yw4;a++){  //Смерть от противника
   if (((y2==a) && (x2==xw1)) || ((y3==a) && (x2==xw1))){
    alive=false;
   }
  }
  for (a=yw3;a<=pb1->Height;a++){ //Смерть от лазера
   if ((y1==a) && (x1==xwg)){
    alive=false;
   }
  }
  for (a=yw3;a<=pb1->Height;a++){ //Смерть от лазера
   if ((y3==a) && (x2==xwg)){
    alive=false;
   }
  }
   //СМЕРТИ ОТ ВТОРОГО ПРОТИВНИКА!!!
  for (a=xe4;a<=xe3;a++){  //Смерть от противника (вверх)
   if (((x1==a) && (y1==ye3)) || ((x2==a) && (y1==ye3))){
    alive=false;
   }
  }
  for (a=xe1;a<=xe2;a++){//Смерть от противника (Вниз)
   if (((x3==a) && (y3==ye1)) || ((x4==a) && (y3==ye1))){
    alive=false;
   }
  }
  for (a=ye2;a<=ye3;a++){ //Смерть от противника (влево)
   if (((y1==a) && (x1==xe2)) || ((y4==a) && (x1==xe2))){
    alive=false;
   }
  }
  for (a=ye1;a<=ye4;a++){  //Смерть от противника (впрао)
   if (((y2==a) && (x2==xe1)) || ((y3==a) && (x2==xe1))){
    alive=false;
   }
  }
  for (a=0;a<=xe1;a++){ //Смерть от лазера
   if ((x1==a) && (y1==xeg)){
    alive=false;
   }
  }
  for (a=0;a<=xe1;a++){ //Смерть от лазера
   if ((x3==a) && (y3==xeg)){
    alive=false;
   }
  }
   //СМЕРТИ ОТ ТРЕТЬЕГО ПРОТИВНИКА!!!
  for (a=xr4;a<=xr3;a++){ //Смерть от противника
   if (((x1==a) && (y1==yr3)) || ((x2==a) && (y1==yr3))){
    alive=false;
   }
  }
  for (a=xr1;a<=xr2;a++){//Смерть от противника
   if (((x3==a) && (y3==yr1)) || ((x4==a) && (y3==yr1))){
    alive=false;
   }
  }
  for (a=yr2;a<=yr3;a++){  //Смерть от противника
   if (((y1==a) && (x1==xr2)) || ((y4==a) && (x1==xr2))){
    alive=false;
   }
  }
  for (a=yr1;a<=yr4;a++){  //Смерть от противника
   if (((y2==a) && (x2==xr1)) || ((y3==a) && (x2==xr1))){
    alive=false;
   }
  }
  for (a=yr3;a<=pb1->Height;a++){//Смерть от лазера
   if ((y1==a) && (x1==xrg)){
    alive=false;
   }
  }
  for (a=yr3;a<=pb1->Height;a++){ //Смерть от лазера
   if ((y3==a) && (x2==xrg)){
    alive=false;
   }
  }
  if ((pr1==false) && (pr2==false) && (pr3==false)){ //ПОБЕДА!
   pb1->Refresh();
   pb1->Canvas->TextOut((pb1->Width / 2)-70,pb1->Height / 2,"YOU WIN! Для повтора уровня нажми пробел");
   test2->Enabled=false;
  }
 }else{
//СМЕРТЬ
 pb1->Refresh();
 pb1->Canvas->TextOut((pb1->Width / 2)-70,pb1->Height / 2,"GAME OVER! Для повтора уровня нажми пробел");
 test2->Enabled=false;
}
}
//---------------------------------------------------------------------------

void __fastcall TForm1::lvl3Click(TObject *Sender)
{
 if (dest==false){
  img1->Picture->LoadFromFile("img2.bmp");
  dest=true;
 }
 shot=false;
 pb1->Refresh();
 i=0;
 alive=true;
 test1->Enabled=false;
 test2->Enabled=false;
 test3->Enabled=true;
 pr1=true;
 pr2=true;
 pr3=true;
 pr4=true;
 pb1->Canvas->Pen->Color = clBlack;  //Начало игры!
 x1=pb1->Width / 2; //Задаём координаты турели
 y1=pb1->Height / 2;
 x2=x1+10;
 y2=y1;
 x3=x2;
 y3=y2+10;
 x4=x3-10;
 y4=y3;
 xg1=x1+5; //Задаём координаты пушки
 yg1=y1;
 xg2=xg1;
 yg2=yg1-5;
 xw1=0; //Задаём первого координаты противника
 yw1=0;
 xw2=xw1+10;
 yw2=yw1;
 xw3=xw2;
 yw3=yw2+10;
 xw4=xw3-10;
 yw4=yw3;
 xe1=pb1->Width-10; //Задаём второго координаты противника
 ye1=pb1->Height-10;
 xe2=xe1+10;
 ye2=ye1;
 xe3=xe2;
 ye3=ye2+10;
 xe4=xe3-10;
 ye4=ye3;
 xr1=pb1->Width-10; //Задаём координаты третьего противника
 yr1=0;
 xr2=xr1+10;
 yr2=yr1;
 xr3=xr2;
 yr3=yr2+10;
 xr4=xr3-10;
 yr4=yr3;
 xt1=0; //Задаём координаты четвёртого противника
 yt1=pb1->Height-10;
 xt2=xt1+10;
 yt2=yt1;
 xt3=xt2;
 yt3=yt2+10;
 xt4=xt3-10;
 yt4=yt3;
 pb1->Canvas->MoveTo(x1,y1); //Отрисовываем турель
 pb1->Canvas->LineTo(x2,y2);
 pb1->Canvas->LineTo(x3,y3);
 pb1->Canvas->LineTo(x4,y4);
 pb1->Canvas->LineTo(x1,y1);
 pb1->Canvas->MoveTo(0,pb1->Height-1); //Отрисовываем края карты
 pb1->Canvas->LineTo(pb1->Width-1,pb1->Height-1);
 pb1->Canvas->LineTo(pb1->Width-1,0);
 pb1->Canvas->LineTo(0,0);
 pb1->Canvas->LineTo(0,pb1->Height-1);
 pb1->Canvas->MoveTo(xw1,yw1); //Отрисовываем противников
 pb1->Canvas->LineTo(xw2,yw2); //Первый противник
 pb1->Canvas->LineTo(xw3,yw3);
 pb1->Canvas->LineTo(xw4,yw4);
 pb1->Canvas->LineTo(xw1,yw1);
 pb1->Canvas->MoveTo(xe1,ye1);//Второй противник
 pb1->Canvas->LineTo(xe2,ye2);
 pb1->Canvas->LineTo(xe3,ye3);
 pb1->Canvas->LineTo(xe4,ye4);
 pb1->Canvas->LineTo(xe1,ye1);
 pb1->Canvas->MoveTo(xr1,yr1);//Третий противник
 pb1->Canvas->LineTo(xr2,yr2);
 pb1->Canvas->LineTo(xr3,yr3);
 pb1->Canvas->LineTo(xr4,yr4);
 pb1->Canvas->LineTo(xr1,yr1);
 pb1->Canvas->MoveTo(xt1,yt1);//Четвёртый противник
 pb1->Canvas->LineTo(xt2,yt2);
 pb1->Canvas->LineTo(xt3,yt3);
 pb1->Canvas->LineTo(xt4,yt4);
 pb1->Canvas->LineTo(xt1,yt1);
 pb1->Canvas->Pen->Color = clRed;
 pb1->Canvas->Pen->Color = clRed; //Отрисовываем пушку
 pb1->Canvas->MoveTo(xg1,yg1);
 pb1->Canvas->LineTo(xg2,yg2);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::lvl3KeyPress(TObject *Sender, char &Key)
{
 int a;
 if ((Key == 'w') || (Key =='ц') || (Key == 'Ц') || (Key == 'W')){  //Движение вверх
  if (y1>0){ //Если не край карты
   y1=y1-1;   //Задаём новые координаты турели
   y2=y2-1;
   y3=y3-1;
   y4=y4-1;
   xg1=x1+5;  //Задаём новые координаты пушки
   yg1=y1;
   xg2=xg1;
   yg2=yg1-5;
   for (a=xw4;a<=xw3;a++){  //Смерть от первого противника
    if (((x1==a) && (y1==yw3)) || ((x2==a) && (y1==yw3))){
     alive=false;
    }
   }
   for (a=xe4;a<=xe3;a++){  //Смерть от второго противника
    if (((x1==a) && (y1==ye3)) || ((x2==a) && (y1==ye3))){
     alive=false;
    }
   }
   for (a=xr4;a<=xr3;a++){  //Смерть от третьего противника
    if (((x1==a) && (y1==yr3)) || ((x2==a) && (y1==yr3))){
     alive=false;
    }
   }
   for (a=xt4;a<=xt3;a++){  //Смерть от четвёртого противника
    if (((x1==a) && (y1==yt3)) || ((x2==a) && (y1==yt3))){
     alive=false;
    }
   }
  }
 }
 if ((Key == 's') || (Key == 'ы') || (Key == 'S') || (Key == 'Ы')){ //Движение вниз
  if (y3<pb1->Height){ //Если не край карты
   y1=y1+1; //Новые координаты турели
   y2=y2+1;
   y3=y3+1;
   y4=y4+1;
   xg1=x3-5;  //Задаём новые координаты пушки
   yg1=y3;
   xg2=xg1;
   yg2=yg1+5;
   for (a=xw1;a<=xw2;a++){//Смерть от первого противника
    if (((x3==a) && (y3==yw1)) || ((x4==a) && (y3==yw1))){
     alive=false;
    }
   }
   for (a=xe1;a<=xe2;a++){//Смерть от второго противника (Вниз)
    if (((x3==a) && (y3==ye1)) || ((x4==a) && (y3==ye1))){
     alive=false;
    }
   }
   for (a=xr1;a<=xr2;a++){//Смерть от третьего противника
    if (((x3==a) && (y3==yr1)) || ((x4==a) && (y3==yr1))){
     alive=false;
    }
   }
   for (a=xt1;a<=xt2;a++){//Смерть от четвёртого противника
    if (((x3==a) && (y3==yt1)) || ((x4==a) && (y3==yt1))){
     alive=false;
    }
   }
  }
 }
 if ((Key == 'a') || (Key == 'ф') || (Key == 'Ф') || (Key == 'A')){//Движение влево
  if (x1>0){ //Если не край карты
   x1=x1-1; //Координаты турели
   x2=x2-1;
   x3=x3-1;
   x4=x4-1;
   xg1=x1;  //Задаём новые координаты пушки
   yg1=y1+5;
   xg2=xg1-5;
   yg2=yg1;
   for (a=yw2;a<=yw3;a++){ //Смерть от первого противника
    if (((y1==a) && (x1==xw2)) || ((y4==a) && (x1==xw2))){
     alive=false;
    }
   }
   for (a=ye2;a<=ye3;a++){  //Смерть от второго противника (влево)
    if (((y1==a) && (x1==xe2)) || ((y4==a) && (x1==xe2))){
     alive=false;
    }
   }
   for (a=yr2;a<=yr3;a++){  //Смерть от третьего противника
    if (((y1==a) && (x1==xr2)) || ((y4==a) && (x1==xr2))){
     alive=false;
    }
   }
   for (a=yt2;a<=yt3;a++){ //Смерть от четвёртого противника
    if (((y1==a) && (x1==xt2)) || ((y4==a) && (x1==xt2))){
     alive=false;
    }
   }
  }
 }
 if ((Key == 'd') || (Key == 'в') || (Key == 'D') || (Key == 'В')){ //Движение вправо
  if (x2<pb1->Width){//Если не край карты
   x1=x1+1; //Координаты турели
   x2=x2+1;
   x3=x3+1;
   x4=x4+1;
   xg1=x2;  //Задаём новые координаты пушки
   yg1=y2+5;
   xg2=xg1+5;
   yg2=yg1;
   for (a=yw1;a<=yw4;a++){  //Смерть от первого противник
    if (((y2==a) && (x2==xw1)) || ((y3==a) && (x2==xw1))){
     alive=false;
    }
   }
   for (a=ye1;a<=ye4;a++){  //Смерть от второго противника (впрао)
    if (((y2==a) && (x2==xe1)) || ((y3==a) && (x2==xe1))){
     alive=false;
    }
   }
   for (a=yr1;a<=yr4;a++){  //Смерть от третьего противника
    if (((y2==a) && (x2==xr1)) || ((y3==a) && (x2==xr1))){
     alive=false;
    }
   }
   for (a=yt1;a<=yt4;a++){  //Смерть от четвёртого противника
    if (((y2==a) && (x2==xt1)) || ((y3==a) && (x2==xt1))){
     alive=false;
    }
   }
  }
 }
 if ((Key == 'e') || (Key == 'у') || (Key == 'У') || (Key == 'E')){  //Стреляем из лазера
  shot=true;
 } 
}
//---------------------------------------------------------------------------

void __fastcall TForm1::test3Timer(TObject *Sender)
{
 int a,b,c;
 if (alive==true){
  pb1->Refresh();
  pb1->Canvas->Pen->Color = clBlack;  //Отрисовываем турель
  pb1->Canvas->MoveTo(x1,y1);
  pb1->Canvas->LineTo(x2,y2);
  pb1->Canvas->LineTo(x3,y3);
  pb1->Canvas->LineTo(x4,y4);
  pb1->Canvas->LineTo(x1,y1);
  pb1->Canvas->MoveTo(0,pb1->Height-1); //Отрисовываем края карты
  pb1->Canvas->LineTo(pb1->Width-1,pb1->Height-1);
  pb1->Canvas->LineTo(pb1->Width-1,0);
  pb1->Canvas->LineTo(0,0);
  pb1->Canvas->LineTo(0,pb1->Height-1);
  pb1->Canvas->Pen->Color = clRed;   //Отрисовываем пушку
  pb1->Canvas->MoveTo(xg1,yg1);
  pb1->Canvas->LineTo(xg2,yg2);
  if (shot==true){ //Стреляем из лазера
   if (i!=5){
    if (yg2 == y1-5){  //Если смотрим вверх
     pb1->Canvas->LineTo(xg2,0);  //Ресуем лазер
     for (a=0;a<=yg1;a++){  //смерть первого противника
      for (c=xw1;c<=xw2;c++){
       if ((a==yw3)&&(xg2==c)){
        pr1=false;
       }
      }
     }
     for (a=y1;a>=0;a--){  //смерть второго противника
      for (b=ye1;b<=ye3;b++){
       for (c=xe1;c<=xe2;c++){
        if ((a==b)&&(xg2==c)){
         pr2=false;
        }
       }
      }
     }
     for (a=y1;a>=0;a--){  //смерть третьего противника
      for (b=yr1;b<=yr3;b++){
       for (c=xr1;c<=xr2;c++){
        if ((a==b)&&(xg2==c)){
         pr3=false;
        }
       }
      }
     }
     for (a=y1;a>=0;a--){  //смерть четвёртого противника
      for (b=yt1;b<=yt3;b++){
       for (c=xt1;c<=xt2;c++){
        if ((a==b)&&(xg2==c)){
         pr4=false;
        }
       }
      }
     }
    }
    if (yg2 == y3+5){//Если смотрим вниз
     pb1->Canvas->LineTo(xg2,pb1->Height);  //Ресуем лазер
     for (a=y3;a<=pb1->Height;a++){ //Смерть первого противника
      for (b=yw1;b<=yw3;b++){
       for (c=xw1;c<=xw2;c++){
        if ((a==b)&&(xg2==c)){
         pr1=false;
        }
       }
      }
     }
     for (a=y3;a<=pb1->Height;a++){  //Смерть второго противника
      for (b=ye1;b<=ye3;b++){
       for (c=xe1;c<=xe2;c++){
        if ((a==b)&&(xg2==c)){
         pr2=false;
        }
       }
      }
     }
     for (a=y3;a<=pb1->Height;a++){  //Смерть третьего противника
      for (b=yr1;b<=yr3;b++){
       for (c=xr1;c<=xr2;c++){
        if ((a==b)&&(xg2==c)){
         pr3=false;
        }
       }
      }
     }
     for (a=y3;a<=pb1->Height;a++){  //Смерть четвёртого противника
      for (b=yt1;b<=yt3;b++){
       for (c=xt1;c<=xt2;c++){
        if ((a==b)&&(xg2==c)){
         pr4=false;
        }
       }
      }
     }
    }
    if (xg2 == x1-5){ //Если смотрим влево
     pb1->Canvas->LineTo(0,yg2);
     for (a=x1;a>=0;a--){//Смерть первого противника
      for (b=yw1;b<=yw3;b++){
       for (c=xw1;c<=xw2;c++){
        if ((a==c)&&(yg2==b)){
         pr1=false;
        }
       }
      }
     }
     for (a=x1;a>=0;a--){//Смерть второго противника
      for (b=ye1;b<=ye3;b++){
       for (c=xe1;c<=xe2;c++){
        if ((a==c)&&(yg2==b)){
         pr2=false;
        }
       }
      }
     }
     for (a=x1;a>=0;a--){//Смерть третьего противника
      for (b=yr1;b<=yr3;b++){
       for (c=xe1;c<=xr2;c++){
        if ((a==c)&&(yg2==b)){
         pr3=false;
        }
       }
      }
     }
     for (a=x1;a>=0;a--){//Смерть четвёртого противника
      for (b=yt1;b<=yt3;b++){
       for (c=xt1;c<=xt2;c++){
        if ((a==c)&&(yg2==b)){
         pr4=false;
        }
       }
      }
     }
    }
    if (xg2 == x2+5){ //Если смотрим вправо
     pb1->Canvas->LineTo(pb1->Width,yg2);
     for (a=x1;a<=pb1->Width;a++){//Смерть первого противника
      for (b=yw1;b<=yw3;b++){
       for (c=xw1;c<=xw2;c++){
        if ((a==c)&&(yg2==b)){
         pr1=false;
        }
       }
      }
     }
     for (a=x1;a<=pb1->Width;a++){//Смерть второго противника
      for (b=ye1;b<=ye3;b++){
       for (c=xe1;c<=xe2;c++){
        if ((a==c)&&(yg2==b)){
         pr2=false;
        }
       }
      }
     }
     for (a=x1;a<=pb1->Width;a++){//Смерть третьего противника
      for (b=yr1;b<=yr3;b++){
       for (c=xr1;c<=xr2;c++){
        if ((a==c)&&(yg2==b)){
         pr3=false;
        }
       }
      }
     }
     for (a=x1;a<=pb1->Width;a++){//Смерть четвёртого противника
      for (b=yt1;b<=yt3;b++){
       for (c=xt1;c<=xt2;c++){
        if ((a==c)&&(yg2==b)){
         pr4=false;
        }
       }
      }
     }
    }
    i=i+1;
   }else{
    i=0;
    shot=false;
   }
  }
  if (pr1==true){ //Если первый противник жив
   //Движение противника
   if (xw1<x1){
    xw1=xw1+1;
    xw2=xw2+1;
    xw3=xw3+1;
    xw4=xw4+1;
   }
   if (yw1<y1){
    yw1=yw1+1;
    yw2=yw2+1;
    yw3=yw3+1;
    yw4=yw4+1;
   }
   if (xw1>x1){
    xw1=xw1-1;
    xw2=xw2-1;
    xw3=xw3-1;
    xw4=xw4-1;
   }
    if (yw1>y1){
    yw1=yw1-1;
    yw2=yw2-1;
    yw3=yw3-1;
    yw4=yw4-1;
   }
   pb1->Canvas->Pen->Color = clBlack;
   pb1->Canvas->MoveTo(xw1,yw1); //Отрисовываем противника
   pb1->Canvas->LineTo(xw2,yw2);
   pb1->Canvas->LineTo(xw3,yw3);
   pb1->Canvas->LineTo(xw4,yw4);
   pb1->Canvas->LineTo(xw1,yw1);
  }else{ //Если первый противник мёртв
   xw1=-5;
   xw2=-5;
   xw3=-5;
   xw4=-5;
   yw1=-5;
   yw2=-5;
   yw3=-5;
   yw4=-5;
  }
  if (pr2==true){ //Если второй противник жив
    //Движение противника
   if (xe1<x1){
    xe1=xe1+1;
    xe2=xe2+1;
    xe3=xe3+1;
    xe4=xe4+1;
   }
   if (ye1<y1){
    ye1=ye1+1;
    ye2=ye2+1;
    ye3=ye3+1;
    ye4=ye4+1;
   }
   if (xe1>x1){
    xe1=xe1-1;
    xe2=xe2-1;
    xe3=xe3-1;
    xe4=xe4-1;
   }
   if (ye1>y1){
    ye1=ye1-1;
    ye2=ye2-1;
    ye3=ye3-1;
    ye4=ye4-1;
   }
   pb1->Canvas->Pen->Color = clBlack;
   pb1->Canvas->MoveTo(xe1,ye1);
   pb1->Canvas->LineTo(xe2,ye2);
   pb1->Canvas->LineTo(xe3,ye3);
   pb1->Canvas->LineTo(xe4,ye4);
   pb1->Canvas->LineTo(xe1,ye1);
  }else{ //Если второй противник мёртв
   xe1=-5;
   xe2=-5;
   xe3=-5;
   xe4=-5;
   ye1=-5;
   ye2=-5;
   ye3=-5;
   ye4=-5;
  }
  if (pr3==true){ //Если третий противник жив
    //Движение противника
   if (xr1<x1){
    xr1=xr1+1;
    xr2=xr2+1;
    xr3=xr3+1;
    xr4=xr4+1;
   }
   if (yr1<y1){
    yr1=yr1+1;
    yr2=yr2+1;
    yr3=yr3+1;
    yr4=yr4+1;
   }
   if (xr1>x1){
    xr1=xr1-1;
    xr2=xr2-1;
    xr3=xr3-1;
    xr4=xr4-1;
   }
   if (yr1>y1){
    yr1=yr1-1;
    yr2=yr2-1;
    yr3=yr3-1;
    yr4=yr4-1;
   }
   pb1->Canvas->Pen->Color = clBlack;
   pb1->Canvas->MoveTo(xr1,yr1); //Отрисовываем противника
   pb1->Canvas->LineTo(xr2,yr2);
   pb1->Canvas->LineTo(xr3,yr3);
   pb1->Canvas->LineTo(xr4,yr4);
   pb1->Canvas->LineTo(xr1,yr1);
  }else{ //Если третий противник мёртв
   xr1=-5;
   xr2=-5;
   xr3=-5;
   xr4=-5;
   yr1=-5;
   yr2=-5;
   yr3=-5;
   yr4=-5;
  }
  if (pr4==true){ //Если четвёртый противник жив
    //Движение противника
   if (xt1<x1){
    xt1=xt1+1;
    xt2=xt2+1;
    xt3=xt3+1;
    xt4=xt4+1;
   }
   if (yt1<y1){
    yt1=yt1+1;
    yt2=yt2+1;
    yt3=yt3+1;
    yt4=yt4+1;
   }
   if (xt1>x1){
    xt1=xt1-1;
    xt2=xt2-1;
    xt3=xt3-1;
    xt4=xt4-1;
   }
   if (yt1>y1){
    yt1=yt1-1;
    yt2=yt2-1;
    yt3=yt3-1;
    yt4=yt4-1;
   }
   pb1->Canvas->Pen->Color = clBlack;
   pb1->Canvas->MoveTo(xt1,yt1); //Отрисовываем противника
   pb1->Canvas->LineTo(xt2,yt2);
   pb1->Canvas->LineTo(xt3,yt3);
   pb1->Canvas->LineTo(xt4,yt4);
   pb1->Canvas->LineTo(xt1,yt1);
  }else{ //Если четвёртый противник мёртв
   xt1=-5;
   xt2=-5;
   xt3=-5;
   xt4=-5;
   yt1=-5;
   yt2=-5;
   yt3=-5;
   yt4=-5;
  }
   //СМЕРТИ ОТ ПЕРВОГО ПРОТИВНИКА!!!
  for (a=xw4;a<=xw3;a++){  //Смерть от противника
   if (((x1==a) && (y1==yw3)) || ((x2==a) && (y1==yw3))){
    alive=false;
   }
  }
  for (a=xw1;a<=xw2;a++){//Смерть от противника
   if (((x3==a) && (y3==yw1)) || ((x4==a) && (y3==yw1))){
    alive=false;
   }
  }
  for (a=yw2;a<=yw3;a++){  //Смерть от противника
   if (((y1==a) && (x1==xw2)) || ((y4==a) && (x1==xw2))){
    alive=false;
   }
  }
  for (a=yw1;a<=yw4;a++){  //Смерть от противника
   if (((y2==a) && (x2==xw1)) || ((y3==a) && (x2==xw1))){
    alive=false;
   }
  }
   //СМЕРТИ ОТ ВТОРОГО ПРОТИВНИКА!!!
  for (a=xe4;a<=xe3;a++){  //Смерть от противника (вверх)
   if (((x1==a) && (y1==ye3)) || ((x2==a) && (y1==ye3))){
    alive=false;
   }
  }
  for (a=xe1;a<=xe2;a++){//Смерть от противника (Вниз)
   if (((x3==a) && (y3==ye1)) || ((x4==a) && (y3==ye1))){
    alive=false;
   }
  }
  for (a=ye2;a<=ye3;a++){  //Смерть от противника (влево)
   if (((y1==a) && (x1==xe2)) || ((y4==a) && (x1==xe2))){
    alive=false;
   }
  }
  for (a=ye1;a<=ye4;a++){  //Смерть от противника (впрао)
   if (((y2==a) && (x2==xe1)) || ((y3==a) && (x2==xe1))){
    alive=false;
   }
  }
   //СМЕРТИ ОТ ТРЕТЬЕГО ПРОТИВНИКА!!!
  for (a=xr4;a<=xr3;a++){  //Смерть от противника
   if (((x1==a) && (y1==yr3)) || ((x2==a) && (y1==yr3))){
    alive=false;
   }
  }
  for (a=xr1;a<=xr2;a++){//Смерть от противника
   if (((x3==a) && (y3==yr1)) || ((x4==a) && (y3==yr1))){
    alive=false;
   }
  }
  for (a=yr2;a<=yr3;a++){  //Смерть от противника
   if (((y1==a) && (x1==xr2)) || ((y4==a) && (x1==xr2))){
    alive=false;
   }
  }
  for (a=yr1;a<=yr4;a++){  //Смерть от противника
   if (((y2==a) && (x2==xr1)) || ((y3==a) && (x2==xr1))){
    alive=false;
   }
  }
   //СМЕРТИ ОТ ЧЕТВЁРТОГО ПРОТИВНИКА!!!
  for (a=xt4;a<=xt3;a++){  //Смерть от противника
   if (((x1==a) && (y1==yt3)) || ((x2==a) && (y1==yt3))){
    alive=false;
   }
  }
  for (a=xt1;a<=xt2;a++){//Смерть от противника
   if (((x3==a) && (y3==yt1)) || ((x4==a) && (y3==yt1))){
    alive=false;
   }
  }
  for (a=yt2;a<=yt3;a++){  //Смерть от противника
   if (((y1==a) && (x1==xt2)) || ((y4==a) && (x1==xt2))){
    alive=false;
   }
  }
  for (a=yt1;a<=yt4;a++){  //Смерть от противника
   if (((y2==a) && (x2==xt1)) || ((y3==a) && (x2==xt1))){
    alive=false;
   }
  }
  if ((pr1==false) && (pr2==false) && (pr3==false) && (pr4==false)){ //ПОБЕДА!
   pb1->Refresh();
   pb1->Canvas->TextOut((pb1->Width / 2)-70,pb1->Height / 2,"YOU WIN! Для повтора уровня нажми пробел");
   test3->Enabled=false;
  }
 }else{ //СМЕРТЬ
  pb1->Refresh();
  pb1->Canvas->TextOut((pb1->Width / 2)-70,pb1->Height / 2,"GAME OVER! Для повтора уровня нажми пробел");
  test3->Enabled=false;
 }
}
//---------------------------------------------------------------------------

void __fastcall TForm1::manualClick(TObject *Sender)
{
 if (dest==false){
  img1->Picture->LoadFromFile("img2.bmp");
  dest=true;
 }
 pb1->Refresh();
 pb1->Canvas->TextOut(5,20,"Цель игры - уничтожить всех противников до того, как они уничтожат тебя!");
 pb1->Canvas->TextOut(5,50,"Нажми W, чтобы ехать вперёд!");
 pb1->Canvas->TextOut(5,80,"Нажми S, чтобы ехать назад!");
 pb1->Canvas->TextOut(5,110,"Нажми A, чтобы ехать влево!");
 pb1->Canvas->TextOut(5,140,"Нажми D, чтобы ехать вправо!");
 pb1->Canvas->TextOut(5,170,"Нажми E, чтобы стрелять!");
 pb1->Canvas->TextOut(5,200,"И помни! У тебя нет ни одного лишнего мгновения!");
}
//---------------------------------------------------------------------------

