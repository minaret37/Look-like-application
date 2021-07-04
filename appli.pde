//1014126 Tomoya Minamoto

import ddf.minim.*;

Minim minim;
AudioPlayer player;

int pat;//スイッチでいま何を押した後か
float slide;//一度スタート画面でスライドしたか
float start;//スタート画面のｘ座標
int time;//時間を図る
int time2;//時間を図る
int time3;//時間を図る
int time4;//時間を図る
int time5;//時間を図る
int key1;//一度したかどうかなどを判断
int key2;//一度したかどうかなどを判断
int key3;//一度したかどうかなどを判断
int key4;//一度したかどうかなどを判断
int key5=1;//一度したかどうかなどを判断
int timerpage;
int buki;//武器のアイコンを押して、今どんなカーソルか判断
int h10;//何十時間か
int h1;//何時間か
int m10;//何十分か
int m1;//何分か
int hho[];//設定した数字

String tim[];
String tim_d[];
int zyun;

String data2[];// 曜日
int h[];      // 講義時間
int h2[];     // 勉強時間

String data[];
int unit_n[][] = new int[7][]; // 何時間するか
int unit_k[][] = new int[7][]; // 何をするか

String dw[] = {
  "SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"//講義
};

/* function getDayOfWeek() converts a string to a number */
/* returns 0, 1, .. , 6 for "SUN", "MON, .. ,"SAT" */

String lines[];

int getDayOfWeek(String s) {//曜日
  for (int i = 0; i < 7; i++) {// 7日
    if (s.equals(dw[i])) {//曜日
      return i;
    }
  }
  return -1;
}


void umbre() {

  if (mouseX-pmouseX<100 && slide==0) {//マウスを動かす速さの取得
  } else {
    start=start+10;//スタート画面を横に動かす
    slide=1; //一度動かしたら動き続ける
  }

  stroke(0);
  fill(0, 20, 0);
  rect(start-2, -2, width+2, height+2);//スタート画面の背景

  fill(0, 0, 0, 0);

  for (float i=0; i<2; i=i+0.5) {
    stroke(0, 200, 0);
    triangle( (start+2)+width/2, (0-2)+height/3, (start+2)+width/2 -50*i * sin(millis()*0.001), 
    (0-2)+height/3-100*i, (start+2)+width/2+50*i * sin(millis()*0.001), (0-2)+height/3-100*i );//蜘蛛の巣
    triangle( (start+2)+width/2, (0-2)+height/3, (start+2)+width/2 -50*i * sin(millis()*0.001), 
    (0-2)+height/3+100*i, (start+2)+width/2+50*i * sin(millis()*0.001), (0-2)+height/3+100*i );//蜘蛛の巣
    triangle( (start+2)+width/2, (0-2)+height/3, (start+2)+width/2 -100*i * sin(millis()*0.001), 
    (0-2)+height/3+50*i, (start+2)+width/2-i*100 * sin(millis()*0.001), (0-2)+height/3-50*i );//蜘蛛の巣
    triangle( (start+2)+width/2, (0-2)+height/3, (start+2)+width/2 +100*i * sin(millis()*0.001), 
    (0-2)+height/3+50*i, (start+2)+width/2+i*100 * sin(millis()*0.001), (0-2)+height/3-50*i );//蜘蛛の巣

    triangle( (start+2)+width/2, (0-2)+height/3, (start+2)+width/2 -50*i * sin(millis()*0.001), 
    (0-2)+height/3-100*i, (start+2)+width/2-100*i * sin(millis()*0.001), (0-2)+height/3-50*i );//蜘蛛の巣
    triangle( (start+2)+width/2, (0-2)+height/3, (start+2)+width/2 -50*i * sin(millis()*0.001), 
    (0-2)+height/3+100*i, (start+2)+width/2-100*i * sin(millis()*0.001), (0-2)+height/3+50*i );//蜘蛛の巣
    triangle( (start+2)+width/2, (0-2)+height/3, (start+2)+width/2 +50*i * sin(millis()*0.001), 
    (0-2)+height/3-100*i, (start+2)+width/2+100*i * sin(millis()*0.001), (0-2)+height/3-50*i );//蜘蛛の巣
    triangle( (start+2)+width/2, (0-2)+height/3, (start+2)+width/2 +50*i * sin(millis()*0.001), 
    (0-2)+height/3+100*i, (start+2)+width/2+100*i * sin(millis()*0.001), (0-2)+height/3+50*i );//蜘蛛の巣
  }


  for (int i=-2; i<3; i++) {
    for (int j=-2; j<3; j++) {
      if (i!=j && i+j!=0 && i!=0 && j!=0 ) {
        line((start+2)+width/2, (0-2)+height/3, (start+2)+width/2+100*1 * sin(millis()*0.001)*i, (0-2)+height/3+50*2*j);//蜘蛛の巣のはみ出た線の部分
      }
    }
  }
  strokeWeight(10);
  fill(0, 200, 0);
  ellipse((start+2)+width/2, (0-2)+height/3, 30* sin(millis()*0.001), 50);//蜘蛛の胴体
  ellipse((start+2)+width/2, (0-2)+height/3-70, 70* sin(millis()*0.001), 110);//蜘蛛の胴体
  strokeWeight(10);
  line((start+2)+width/2, (0-2)+height/3, (start+2)+width/2+100*0.7* sin(millis()*0.001), (0-2)+height/3+50*0.6);//蜘蛛の右足
  line((start+2)+width/2+100*0.7* sin(millis()*0.001), (0-2)+height/3+50*0.6, (start+2)+width/2+100*0.7* sin(millis()*0.001), (0-2)+height/3+50*1+50);//蜘蛛の右足
  line((start+2)+width/2, (0-2)+height/3, (start+2)+width/2+100*0.3* sin(millis()*0.001), (0-2)+height/3+50*1.3);//蜘蛛の右足
  line((start+2)+width/2+100*0.3* sin(millis()*0.001), (0-2)+height/3+50*1.3, (start+2)+width/2+100*0.3* sin(millis()*0.001), (0-2)+height/3+50*1.3+50);//蜘蛛の右足
  line((start+2)+width/2, (0-2)+height/3, (start+2)+width/2+100*0.7* sin(millis()*0.001), (0-2)+height/3-50*0.6);//蜘蛛の右足
  line((start+2)+width/2+100*0.7* sin(millis()*0.001), (0-2)+height/3-50*0.6, (start+2)+width/2+100*0.7* sin(millis()*0.001), (0-2)+height/3-50*1-60);//蜘蛛の右足
  line((start+2)+width/2, (0-2)+height/3, (start+2)+width/2+100*0.5* sin(millis()*0.001), (0-2)+height/3-50*1.3);//蜘蛛の右足
  line( (start+2)+width/2+100*0.5* sin(millis()*0.001), (0-2)+height/3-50*1.3, (start+2)+width/2+100*0.5* sin(millis()*0.001), (0-2)+height/3-50*1.3-60);//蜘蛛の右足

  line((start+2)+width/2, (0-2)+height/3, (start+2)+width/2-100*0.7* sin(millis()*0.001), (0-2)+height/3+50*0.6);//蜘蛛の左足
  line((start+2)+width/2-100*0.7* sin(millis()*0.001), (0-2)+height/3+50*0.6, (start+2)+width/2-100*0.7* sin(millis()*0.001), (0-2)+height/3+50*1+50);//蜘蛛の左足
  line((start+2)+width/2, (0-2)+height/3, (start+2)+width/2-100*0.3* sin(millis()*0.001), (0-2)+height/3+50*1.3);//蜘蛛の左足
  line((start+2)+width/2-100*0.3* sin(millis()*0.001), (0-2)+height/3+50*1.3, (start+2)+width/2-100*0.3* sin(millis()*0.001), (0-2)+height/3+50*1.3+50);//蜘蛛の左足
  line((start+2)+width/2, (0-2)+height/3, (start+2)+width/2-100*0.7* sin(millis()*0.001), (0-2)+height/3-50*0.6);//蜘蛛の左足
  line((start+2)+width/2-100*0.7* sin(millis()*0.001), (0-2)+height/3-50*0.6, (start+2)+width/2-100*0.7* sin(millis()*0.001), (0-2)+height/3-50*1-60);//蜘蛛の左足
  line((start+2)+width/2, (0-2)+height/3, (start+2)+width/2-100*0.5* sin(millis()*0.001), (0-2)+height/3-50*1.3);//蜘蛛の左足
  line( (start+2)+width/2-100*0.5* sin(millis()*0.001), (0-2)+height/3-50*1.3, (start+2)+width/2-100*0.5* sin(millis()*0.001), (0-2)+height/3-50*1.3-60);//蜘蛛の左足

  strokeWeight(1);
  fill(100, 200, 100);

  text("PASSWORD", (start+2)+width/2-30, (0-2)+height*2/3); //パスワード　という文字
  fill(100, 200, 100, 0);
  stroke(100, 200, 100);
  rect((start+2)+100, (0-2)+height*2/3+20, 280, 20);//パスワードを入力する四角形
  fill(100, 200, 100);
  text(" ＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊", (start+2)+100, (0-2)+height*2/3+35);//パスワード

  noCursor();

  cur();//カーソルを変更する関数
}


void cur() {//カーソルの変更

  if (buki == 1 || pat==1 || pat ==2) {
    //理想の生活パターンと勉強時間のところは強制的に変更、ボタンを押しても変更化
    fill(0, 0, 0, 0);//枠線
    stroke(0, 0, 0, 200);//薄暗い枠
    strokeWeight(475);//枠は太め
    ellipse(mouseX, mouseY, 100, 100);//この透明な円を基準に枠を作る
    stroke(0);
    for (int i=0; i<11; i++) {//枠を増やし、透明な円以外からは見えないようにする
      strokeWeight(500+i*100);//枠を増やし、透明な円以外からは見えないようにする
      ellipse(mouseX, mouseY, 100, 100);//枠を増やし、透明な円以外からは見えないようにする
    }
    strokeWeight(2);
    fill(0);

    line(mouseX-150, mouseY, mouseX-55, mouseY);//横線
    line(mouseX+150, mouseY, mouseX+55, mouseY);//横線
    line(mouseX, mouseY+95, mouseX, mouseY+150);//左下の横線

    line(mouseX-140, mouseY+90, mouseX-40, mouseY+90);//縦線
    text("1.7", mouseX-50, mouseY+110);//左下の横線の数字

    for (int i=0; i<11; i++) {//真ん中の縦線　１０本
      if (i==0 || i==10) {
        line(mouseX-50+i*10, mouseY, mouseX-50+i*10, mouseY+20);//縦線
      } else if (i==5) {
        line(mouseX-50+i*10, mouseY, mouseX-50+i*10-3, mouseY+10);//真ん中は三角形のように
        line(mouseX-50+i*10, mouseY, mouseX-50+i*10+3, mouseY+10);//真ん中は三角形のように
      } else {
        line(mouseX-50+i*10, mouseY, mouseX-50+i*10, mouseY+10);//縦線
      }
    }

    for (int i = 1; i<4; i++) {//真ん中から下の三角形
      triangle(mouseX, mouseY+5+20*i, 
      mouseX-3, mouseY+15+20*i, mouseX+3, mouseY+15+20*i);
    }

    for (int i = 0; i<10; i++) {//左下の徐々に上がる線と数字
      if (i%2==0) {
        text(10-i, mouseX-140+i*10, mouseY+75-i*i*0.6);
        line(mouseX-130+i*10, mouseY+80-i*i*0.6, mouseX-140+i*10, mouseY+80-(i-1)*(i-1)*0.6 );
      }
    }


    if (mousePressed) {//マウスを押すとエフェクト
      if (time2+500<millis() ) {//押してから０．５秒たたないとエフェクトでない
        noStroke();
        fill(100, 100, 0);
        ellipse(random(mouseX-10, mouseX+10), random(mouseY-10, mouseY+10), 10, 10);//マズルファイア
        fill(255, 255, 0);
        ellipse(random(mouseX-5, mouseX+5), random(mouseY-5, mouseY+5), 20, 20);//マズルファイア

        time2=millis();//押してから０．５秒たたないとエフェクトでないようにするためのもの
      }

      stroke(0);
    }
  } else {//もう一つのカーソルの表し方

    if (mousePressed) {//マウスを押すとエフェクト
      if (time2+100<millis() ) {//押してから０．１秒たたないとエフェクトでない
        noStroke();
        fill(100, 100, 0);
        ellipse(random(mouseX-10, mouseX+10), random(mouseY-10, mouseY+10), 10, 10);//マズルファイア
        fill(255, 255, 0);
        ellipse(random(mouseX-5, mouseX+5), random(mouseY-5, mouseY+5), 20, 20);//マズルファイア

        time2=millis();//押してから０．１秒たたないとエフェクトでないようにするためのもの
      }

      stroke(0);
    }

    fill(100, 200, 100);//ここから赤いサイト
    stroke(255, 0, 0);
    line(mouseX-20, mouseY, mouseX+20, mouseY);//十字
    line(mouseX, mouseY-20, mouseX, mouseY+20);//十字
    fill(0, 0, 0, 0);
    ellipse(mouseX, mouseY, 20, 20);//枠だけの円
  }
  stroke(0);
}

void icon() {//ボタンのアイコン 
  fill(100, 200, 100);
  stroke(0);//ここから銃のアイコン
  rect(390, 405, 80, 40);
  fill(0);
  rect(395, 410, 60, 5);
  rect(400, 410, 60, 13);
  quad(455, 412, 445, 422, 450, 440, 460, 439);
  strokeWeight(3);
  fill(0, 0, 0, 0);
  rect(439, 419, 10, 10);
  strokeWeight(1);



  strokeWeight(2);
  stroke(0);//時計のアイコン
  fill(0, 0, 0, 0);//枠線　
  ellipse(75, 505, 35, 35);//時計
  line(75, 505, 85, 505);//針
  line(75, 505, 75, 490);//針

  rect(160, 490, 30, 32);//スケジュール
  line(160, 500, 190, 500);//横線
  line(160, 508, 190, 508);//横線
  line(160, 516, 190, 516);//横線

  line(180, 490, 180, 522);//縦線
  line(170, 500, 170, 522);//縦線

  rect(70, 595, 10, 30);//鉛筆マーク
  triangle(70, 595, 80, 595, 75, 585);
  fill(0);
  triangle(73, 590, 77, 590, 75, 585);//芯の部分
  fill(0, 0, 0, 0);

  triangle(160, 590, 170, 590, 165, 595);//電波マーク
  line(165, 590, 165, 620);//電波マーク

  rect(173, 610, 3, 10);//電波のつながり具合
  rect(178, 600, 3, 20);//電波のつながり具合
  rect(183, 590, 3, 30);//電波のつながり具合

  strokeWeight(1);
}

void timer() {//タイマー
  PrintWriter output;





  if (timerpage == 0) {
    fill(100, 255, 100);

    time(60, 30, (year()%10000-year()%1000)/1000, 5, 20);//西暦の千の位
    time(100, 30, (year()%1000-year()%100)/100, 5, 20);//西暦の百の位
    time(140, 30, (year()%100-year()%10)/10, 5, 20);//西暦の十の位
    time(180, 30, year()%10, 5, 20);//西暦の一の位

    time(260, 30, (month()-month()%10)/10, 5, 20);//何月かの十の位
    time(300, 30, month()%10, 5, 20);//何月かの一の位
    stroke(100, 200, 100);
    strokeWeight(5);
    line(340, 73, 360, 33);//月日の真ん中の斜線
    stroke(0);
    strokeWeight(1);
    time(380, 30, (day()-day()%10)/10, 5, 20);//何日かの十の位
    time(420, 30, day()%10, 5, 20);//何日かの一の位


    time(70, 180, (hour()-hour()%10)/10, 7, 28);//時間の十の位
    time(120, 180, hour()%10, 7, 28);//時間の一の位
    time(190, 180, (minute()-minute()%10)/10, 7, 28);//分の十の位
    time(240, 180, minute()%10, 7, 28);//分の一の位
    time(310, 180, (second()-second()%10)/10, 7, 28);//秒の十の位
    time(360, 180, second()%10, 7, 28);//秒の一の位

    if (second()%2==1) {
      rect(167, 190, 12, 12);//時間と分の間の：
      rect(167, 220, 12, 12);//時間と分の間の：
      rect(287, 190, 12, 12);//分と秒の間の：
      rect(287, 220, 12, 12);//分と秒の間の：
    }

    fill(125);
    rect(95, 325, 290, 60);//枠線
    fill(0);
    rect(100, 330, 280, 50);//空の部分
    fill(50, 200, 50);
    rect(100, 330, 280*( hour()*60+minute() )/24/60, 50);//時間が経つと緑色で埋まっていく
    fill(100, 200, 100);
    text("一日 - "+100*( hour()*60+minute() )/24/60 + "%完了", 200, 320);//一日の何％が経過したか記述

    if (mousePressed && 70<mouseX && mouseX<395 &&
      180<mouseY && mouseY <245) {//時間の表示されている上で押すとぺージが変わる
      timerpage=1;
    }
  } else {

    fill(125);
    rect(395, 50, 60, 340);//カードキーで開ける鍵
    rect(400, 55, 50, 330);//カードキーで開ける鍵
    fill(0);
    rect(420, 70, 10, 300);
    if (400<mouseX && mouseY<450 &&
      55<mouseY && mouseY <385 &&
      mouseY-50>pmouseY) {//右側のカードキーで下にフリック
      timerpage=0;//ページの変化
    }

    stroke(0);
    fill(100, 200, 100);
    rect(30, 30, 350, 400);//電卓
    fill(50, 100, 50);
    rect(40, 40, 330, 380);
    ;//電卓
    fill(0);
    rect(50, 50, 300, 90);
    ;//数字の入る黒い画面
    fill(100, 200, 100);
    if (key3==0) {//ENTERを押したか押していないか
      if (zyun>=1) {
        time(70, 61, h10, 7, 28);//ボタンを押していくと数字が代入されていく
      }
      if (zyun>=2) {
        time(130, 61, h1, 7, 28);//ボタンを押していくと数字が代入されていく
      }
      if (zyun>=3) {
        time(190, 61, m10, 7, 28);//ボタンを押していくと数字が代入されていく
      }
      if (zyun>=4) {
        time(250, 61, m1, 7, 28);//ボタンを押していくと数字が代入されていく
      }
    } else if (h10<=2 && h1<4 && m10<6) {//画面に出ている数字が時間の表し方に忠実な場合
      strokeWeight(10);//OPENの字ができる
      stroke(100, 200, 100); 
      fill(0, 0, 0, 0);
      ellipse(150, 80, 70, 30);//ここからP
      line(150, 70, 150, 120);
      noStroke();
      fill(0);
      rect(90, 60, 55, 50);
      stroke(100, 200, 100); 
      fill(100, 200, 100, 0);//ここからO 
      ellipse(90, 95, 50, 50);

      line(220, 70, 220, 120);//ここからE
      line(220, 70, 250, 70);
      line(220, 95, 250, 95);
      line(220, 120, 250, 120);

      line(290, 70, 290, 120);//ここからN
      line(290, 70, 320, 120);
      line(320, 70, 320, 120);

      strokeWeight(1);
      fill(100, 200, 100);
    } else {//そうでない場合
      strokeWeight(10);//ERRORの字ができる

      stroke(100, 200, 100);//ここからR
      fill(0, 0, 0, 0);
      ellipse(300, 80, 70, 30);
      line(300, 70, 300, 120);
      line(300, 90, 340, 120);
      noStroke();
      fill(0);
      rect(260, 60, 35, 50);
      stroke(100, 200, 100); 


      stroke(100, 200, 100);//ここからR
      fill(0, 0, 0, 0);
      ellipse(190, 80, 70, 30);
      line(190, 70, 190, 120);
      line(190, 90, 220, 120);
      noStroke();
      fill(0);
      rect(150, 60, 35, 50);
      stroke(100, 200, 100); 

      stroke(100, 200, 100);//ここからR
      fill(0, 0, 0, 0);
      ellipse(130, 80, 70, 30);
      line(130, 70, 130, 120);
      line(130, 90, 160, 120);
      noStroke();
      fill(0);
      rect(90, 60, 35, 50);
      stroke(100, 200, 100); 


      fill(0, 0, 0, 0);
      line(70, 70, 70, 120);//ここからE
      line(70, 70, 100, 70);
      line(70, 95, 100, 95);
      line(70, 120, 100, 120);

      ellipse(260, 95, 45, 50);//O

      strokeWeight(1);
      stroke(0);
    }

    fill(100, 200, 100); 

    rect(60, 340, 235, 55);
    for (int i=0; i<3; i++) {//ボタンとボタンの上の数字と押すと代入するプログラム
      for (int j=0; j<3; j++) {
        rect(60+80*i, 160+60*j, 75, 55);//ボタン
        fill(0);
        stroke(50, 200, 50);
        time(60+80*i+25, 160+60*j+5, i+1+j*3, 5, 20);//ボタンの上の数字
        time(60+80*1+25, 160+60*3+5, 0, 5, 20);//ボタンの上の数字　０
        fill(100, 200, 100);
        stroke(0);
        if (key4==0) {//押してから数秒押せなくする
          if (mousePressed && 60+80*i<mouseX && mouseX<60+80*i+75 &&
            160+60*j<mouseY && mouseY<160+60*j+55) {//ボタンを押すと順番に代入
            switch(zyun) {
            case 0:
              h10=i+1+j*3;
              zyun=1;//順番が変化
              break;
            case 1:
              h1=i+1+j*3;
              zyun=2;
              ;//順番が変化
              break;
            case 2:
              m10=i+1+j*3;
              zyun=3;
              ;//順番が変化
              break;
            case 3:
              m1=i+1+j*3;
              zyun=4;
              ;//順番が変化
              break;
            case 4://何を押しても変化なし
              break;
            }
          }
        }
      }
    } 
    if (key4==0) {

      if (mousePressed && 60<mouseX && mouseX<60+235 &&
        340<mouseY && mouseY<340+55) {//０を押すと代入

        switch(zyun) {
        case 0:
          h10=0;
          zyun=1;
          break;
        case 1:
          h1=0;
          zyun=2;
          break;
        case 2:
          m10=0;
          zyun=3;
          break;
        case 3:
          m1=0;
          zyun=4;
          break;
        case 4:
          break;
        }
      }

      if (mousePressed && 300<mouseX && mouseX<360 &&
        160<mouseY && mouseY<190) {//右上のON　OFFと書かれているところを押すとアラームが鳴るか鳴らないか変えれる
        if (key5==0) {
          key5=1;
        } else {
          key5=0;
        }
      }

      if (mousePressed && 300<mouseX && mouseX<360 &&
        195<mouseY && mouseY<260) {//順番と数字のリセット　そしてアラームの停止
        h10=0;
        h1=0;
        m10=0;
        m1=0;
        zyun=0;
        player.close();
      }
    }


    if (mousePressed && 300<mouseX && mouseX<360 &&
      265<mouseY && mouseY<395) {//入力した数字を出力

      // 初期化
      output = createWriter("time.txt"); 

      // 書き込み
      output.println(h10+","+h1+","+m10+","+m1);

      // 終了処理†
      output.flush();
      output.close();

      key3=1;//時間で押せるようにする
    }

    if (key3==1) {//時間で押せるようにする
      time5++;
    }

    if (time5>100) {//時間で押せるようにする
      key3=0;
      time5=0;
    }

    rect(300, 160, 60, 30);
    fill(0);
    if (key5==1) {//アラームがONかOFFか判断
      text("ON", 310, 180);
      fill(0, 200, 0);
    } else {//アラームがONかOFFか判断
      text("OFF", 310, 180);
      fill(0, 50, 0);
    }
    ellipse(340, 175, 10, 10);//on offの変化で光る
    fill(100, 200, 100);
    rect(300, 195, 60, 65);//リセットボタン
    stroke(0, 20, 0);
    strokeWeight(7);//ここから矢印が丸まっているアイコン
    arc(330, 227, 35, 35, 2, 7);
    strokeWeight(1);
    fill(0, 20, 0);
    triangle(335, 235, 347, 247, 335, 245);

    fill(100, 200, 100);
    rect(300, 265, 60, 130);//ENTERボタン
    fill(0);
    text("ENTER", 310, 330);

    if (zyun==0) {
      key3=0;
    }//リセットボタンを押したときなどに初期化

    fill(255);
  }

  if (mousePressed && key4==0) {//ボタンを押したとき数秒経たないと押せないようにする
    key4=1;
  }
  if (key4==1) {//ボタンを押したとき数秒経たないと押せないようにする
    time4++;
  }
  if (40<time4) {//ボタンを押したとき数秒経たないと押せないようにする
    key4=0;
    time4=0;
  }
}


void study() {//勉強時間の推移をグラフ化

  if (mousePressed && 200<mouseX&& mouseX<280 && 380<mouseY && mouseY< 420) {//ボタンを押すと変更
    if (time2+150<millis() ) {//押してから０．１５秒後じゃないと反応しない
      if (key2==0) {
        key2=1;
        time2=millis();//押してから０．１５秒後じゃないと反応しないようにするためのもの
      } else {
        key2=0;
      }
      time2=millis();//押してから０．１５秒後じゃないと反応しないにするためのもの
    }
  }
  fill(125);
  rect(195, 375, 90, 50);//ボタンの枠線
  fill(50, 250, 50);
  rect(200, 380, 80, 40);//ボタン

  for (int i = 0; i < data2.length; i++) {//データの数だけ
    h = int(data2[i].split(","));//講義の時間を取得
    if (i!=data2.length-1) {
      h2 = int(data2[i+1].split(","));//勉強の時間を取得
    }

    if (data2.length<6 || key2==1) {//一週間しかない場合　またはボタンを押したか
      if (i<6) {
        showGraph2(h, h2, i);            //一週目のグラフ
      }
      fill(0);
      triangle(230, 390, 230, 410, 250, 400);//ボタンを押したかどうかで向きが変化
    } else {

      if (key2==0) {
        if (i>=6) {
          showGraph2(h, h2, i-6);//二週目のグラフ
        }
        fill(0);
        triangle(250, 390, 250, 410, 230, 400);//ボタンを押したかどうかで向きが変化
      }
    }
  }
}

void tusin() {//通信のグラフ
  stroke(100, 200, 100);
  fill(100, 200, 100, 0);  
  rect(40, 10, 390, 70);//一番上の四角い枠線

  strokeWeight(5);
  stroke(100, 200, 100);
  fill(0, 0, 0, 0);
  rect(25, 100, 100, 100);//左の画面
  rect(355, 100, 100, 100);//右の画面


  PImage ore = loadImage("ore.png");//悲しげな顔の画像
  image(ore, 355, 100, 100, 100);//右の画面の写真

  if (time>100) {
    PImage aite = loadImage("aite.png");//やる気にみちた画像
    image(aite, 25, 100, 100, 100);//左の画面の写真
  } else {
    noStroke();
    fill(0);
    rect(25, 100, 100, 100);//左の画面
  }

  strokeWeight(1);
  stroke(0);

  fill(50, 100, 50);
  rect(10, 250, 460, 150);//宿題などを入力する欄
  if (400<mouseX && mouseX<460 &&
    350<mouseY && mouseY<390 && mousePressed) {//ボタンを押すと
    fill(50, 150, 50);
    key1=1;//一度でも押したかどうかを判断
  } else {
    fill(100, 200, 100);
  }
  rect(400, 350, 60, 40);//ボタン

  fill(0, 0, 0, 0);
  arc(425, 370, 30, 30, PI*11/4, PI*13/4);//音波のアイコン
  arc(425, 370, 20, 20, PI*11/4, PI*13/4);//音波のアイコン
  arc(425, 370, 10, 10, PI*11/4, PI*13/4);//音波のアイコン
  fill(0);
  triangle(425, 360, 425, 380, 440, 370);//アイコン
  ellipse(440, 370, 5, 5);//アイコン

  if (key1==1) {//一度でもボタンを押したかどうか
    time++;
  }
  if (time>100) {//ボタンを押してから０．１秒たったら起動
    fill(100, 200, 100);
    text("大佐 : 君の任務はこれだ！", 20, 270);//宿題を入力される欄にあるセリフ
    for (int i = 0; i < lines.length; i++) {//宿題の数だけ入力
      // show text data line by line
      fill(100, 200, 100);
      if (i<7) {//宿題が七個以上だと横に移動して入力
        text(lines[i], 40, 280+(i+1) * 15);
      } else {
        text(lines[i], 250, 280+(i+1-7) * 15);
      }
    }
  } else {
    fill(0);
  }
  rect(150, 100, 180, 10);//通信しているように見せる真ん中の四角形
  rect(150, 120, 120, 10);//通信しているように見せる真ん中の四角形
  rect(150, 140, 70, 10);//通信しているように見せる真ん中の四角形
  rect(150, 160, 40, 10);//通信しているように見せる真ん中の四角形
  rect(150, 180, 20, 10);//通信しているように見せる真ん中の四角形
  rect(150, 200, 15, 10);//通信しているように見せる真ん中の四角形

  time(180, 180, 1, 3, 12);//通信しているように見せる真ん中の四角形のとなりにある１４．８６という数字
  time(210, 180, 4, 3, 12);//通信しているように見せる真ん中の四角形のとなりにある１４．８６という数字
  time(240, 170, 0, 4, 16);//通信しているように見せる真ん中の四角形のとなりにある１４．８６という数字
  rect(270, 200, 5, 5);//１４．８５のあいだの　.　代わり
  time(280, 170, 8, 4, 16);//通信しているように見せる真ん中の四角形のとなりにある１４．８６という数字
  time(310, 170, 6, 4, 16);//通信しているように見せる真ん中の四角形のとなりにある１４．８６という数字
}

void time(float x, float y, float t, float w, float h) {//数字のデジタル表示
  //数字の始点のX座標、Y座標、表記する数字、数字の幅、数字の高さ
  if (t==4 || t==5 ||
    t==6 || t==8 ||
    t==9 || t==0) {
    rect(x, y, w, h);
  }//アナログの表記の棒の一部
  if (t==1 || t==2 ||
    t==3 || t==4 || t==7 ||
    t==8 ||t==9 || t==0) {
    rect(x+h, y, w, h+w);
  }//アナログの表記の棒の一部
  if (t==5 || t==2 ||
    t==3 || t==6 || t==7 ||
    t==8 ||t==9 || t==0) {
    rect(x, y, h, w);
  }//アナログの表記の棒の一部
  if (t==2 ||
    t==6 || 
    t==8 || t==0) {
    rect(x, y+h, w, h);
  }//アナログの表記の棒の一部
  if (t==1 ||
    t==3 || t==4||t==5||t==6 || t==7 ||
    t==8 ||t==9 || t==0) {
    rect(x+h, y+h, w, h+w);
  }//アナログの表記の棒の一部
  if (t==2 ||
    t==3 || t==4||t==5||t==6 ||
    t==8 || t==9) {
    rect(x, y+h, h, w);
  }//アナログの表記の棒の一部
  if (t==2 ||
    t==3 ||t==5||t==6 ||
    t==8 ||t==9 || t==0) {
    rect(x, y+h+h, h+w, w);
  }//アナログの表記の棒の一部
}

void switch1(int x, int y, int i, int j) {//ボタンを押してpatが変化する関数
  float sw = 50;//ボタンの幅
  float sh = 50;//ボタンの高さ
  fill(50, 150, 50);
  if (mouseX>x && x+sw>mouseX
    &&mouseY>y && y+sh>mouseY) {//ボタンの上に来た時　色が変化
    fill(150, 255, 150);
    if (mousePressed) {//マウスを押すとpatが変化
      pat = i;
    }
  }
  if (i==j) {
    fill(0, 25, 0);//押したボタンだと色が変化
  }
  stroke(20);
  strokeWeight(5);
  rect(x, y, sw, sh);//ボタンを表記
  strokeWeight(1);
}
void setup() {

  minim = new Minim(this);
  player = minim.loadFile("untitled.mp3", 2048);

  String d[];
  String n[] = {
    "", "", "", "", "", "", ""
  };// 何時間やっていたか
  String k[] = {
    "", "", "", "", "", "", ""
  };// 何をやっていたか
  int dow, sum, i, j;

  size(480, 640); 
  data2 = loadStrings("life.txt"); //勉強時間の合計を曜日ごとに
  data = loadStrings("week_life.txt");//理想のスケジュール
  lines = loadStrings("homework.txt");//宿題やメモを入力したものを取得

  for (i = 0; i < data.length; i++) {
    // sprit one line to 3 strings
    // ex) "SUN,1,28" -> "SUN","1","28"
    d = data[i].split(",");
    dow = getDayOfWeek(d[0]); // dow is for day-of-week
    k[dow] += (d[1]+","); // 何をやっていたか
    n[dow] += (d[2]+","); // 何時間やっていたか
  }
  for (i = 0; i < 7; i++) {
    unit_k[i] = int(k[i].split(","));//何をやっていたか
    unit_n[i] = int(n[i].split(","));//何時間か
  }

  for (i = 0; i < 7; i++) {
    // check the sum of time-unit for each day-of-week 
    sum = 0;
    for (j = 0; j < unit_k[i].length; j++) { 
      // unit_k[i][j]
      sum += unit_n[i][j];
    }
    if (sum != 96) {
      println("Data Error: The sum of quarter-hour-unit for "+dw[i]+ " is "+ sum +".");
    }//if error arise, error texted
    sum = 0;
    for (j = 0; j < unit_k[i].length; j++) { 
      // unit_k[i][j]
      sum += unit_n[i][j];
    }
  }
}

int [] conv(String s) { //","ごとにデータを入れる
  return int(s.split(","));// ","ごとにいれる
}

void setColor(int idx) {//色を変える
  switch(idx) {
  case 1:
    fill(255, 100, 100); // 赤
    break;
  case 2:
    fill(100, 255, 100);//緑
    break;
  case 3:
    fill(100, 100, 255);//青
    break;
  case 4:
    fill(255, 255, 100);//黄
    break;
  case 5:
    fill(100, 255, 255);//水色
    break;
  case 6:
    fill(255, 100, 255);//紫
    break;
  default:
    fill(128, 128, 128);//灰色
  }
}

void showGraph(float x, float y, int k[], int n[]) {//スケジュール
  int i;
  float w, h, tx, ty;

  stroke(100, 200, 100);
  strokeWeight(2);
  line(x+(hour()*4+minute()/15)*4.1, y-30, x+(hour()*4+minute()/15)*4.1, y+40);//ライン
  strokeWeight(1);
  stroke(0);

  for (i = 0; i < n.length; i++) {
    tx = x; // 四角形の始点
    ty = y; // 四角形の始点

    setColor(k[i]);
    if (k[i] == 2) {
      ty = ty - 12;
      h = 32;//四角形の太さが増える
    } else {
      h = 8;//デフォルトの四角形の太さ
    }

    // the length of one time-unit on the window is 5
    w = n[i] * 4.1;//四角形の幅
    // draw the box
    rect(tx, ty, w, h);
    // move the current position to the right end of the box
    x += w;
  }

  setColor(5);
  rect(40, 400, 10, 10);
  text("Sky  blue is sleep", 50, 410);//色についての説明
  setColor(1);
  rect(150, 400, 10, 10);
  text("Magenta is study", 160, 410);//色についての説明
  setColor(2);
  rect(260, 400, 10, 10);
  text("Green  blue is lecture", 270, 410);//色についての説明
  setColor(4);
  rect(40, 420, 10, 10);
  text("Yellow is rest", 50, 430);//色についての説明
  setColor(6);
  rect(150, 420, 10, 10);
  text("Purple is live", 160, 430);//色についての説明
  setColor(7);
  rect(260, 420, 10, 10);
  text("Gray is other", 270, 430);//色についての説明
}

void showGraph2(int d[], int d2[], float y) {//勉強時間
  if (y!=6) {
    stroke(100, 200, 100);
    line(25, height-300, 450, height-300);//X軸
    line(25, 20, 25, height-300);//Y軸
    fill(100, 200, 100);
    text("SUN           MON          TUE          WED          THU           FRI          SAT", 40, height-280);//何曜日か記載
    strokeWeight(10);// line weight
    stroke(0, 200, 0);// change color
    line(60*y+50, -(d[1] +  d[2])*2.5+height-300, 
    60*(y+1)+50, -(d2[1]+ d2[2])*2.5+height-300);//講義と勉強時間の合計
  }

  if (y%3==1) {//一週間で最大二人まで人が出る
    line(60*y+50, -(d[1] +  d[2])*2.5+height-350, 60*y+50, -(d[1] +  d[2])*2.5+height-330);//人の胴体
    line(60*y+50, -(d[1] +  d[2])*2.5+height-350, 60*y+60, -(d[1] +  d[2])*2.5+height-340);//人の手
    line(60*y+50, -(d[1] +  d[2])*2.5+height-350, 60*y+40, -(d[1] +  d[2])*2.5+height-340);//人の手
    line(60*y+50, -(d[1] +  d[2])*2.5+height-330, 60*y+58, -(d[1] +  d[2])*2.5+height-310);//人の足
    line(60*y+50, -(d[1] +  d[2])*2.5+height-330, 60*y+42, -(d[1] +  d[2])*2.5+height-310);//人の足
    ellipse(60*y+50, -(d[1] +  d[2])*2.5+height-360, 10, 10);//人の頭
  }


  strokeWeight(1);//修正
  stroke(0);//修正
}

void draw() {
  float x, y;
  tim = loadStrings("time.txt");//タイマーの入力したものを取得
  for (int i = 0; i < tim.length; i++) {
    // sprit one line to 3 strings
    // ex) "SUN,1,28" -> "SUN","1","28"
    tim_d = tim[i].split(",");
  }

  background(0, 25, 0);
  fill(100, 200, 100);
  rect(0, 450, width, height);//下の欄
  fill(150, 255, 150);
  rect(0, 450, width, 5);//下の欄の枠

  for (int i=0; i<2; i++) {//ボタンを横に合計四個　
    for (int j=0; j<2; j++) {
      switch1(50+i*100, 480+j*100, (i+j*2), pat);//ボタン
    }
  }

  icon();//ボタンの上のアイコン

  switch(pat) {//ボタンを押したら画面が変更する
  case 0:
    timer();//タイマーの表示
    break;
  case 1:
    for (int i = 0; i < 7; i++) {
      // show text data line by line
      setColor(0);//change color
      x = 25;//graph's SITEN of X
      y = (i + 1) * 50;//graph's SITEN of Y
      text(dw[i], x, y);// text YOUBI
      showGraph(25, y, unit_k[i], unit_n[i]); //graph
    } 
    fill(100, 200, 100);
    text("NOW", 25+(hour()*4+minute()/15)*4.1, 20);//現在の時間の線に追従

    break;
  case 2:
    study();//勉強時間の推移を記録
    break;
  case 3:
    tusin();//宿題のメモを確認
    break;
  }

  stroke(0);
  fill(50, 100, 50);
  ellipse(380, 550, 160, 160);//ソナーは枠線
  fill(0, 50, 0);
  ellipse(380, 550, 150, 150);//ソナーの円
  stroke(0, 200, 0);
  ellipse(380, 550, 100, 100);//ソナーの中の円
  ellipse(380, 550, 50, 50);//ソナーの中の円
  stroke(100, 200, 100);

  stroke(0, 200, 0);
  for (int i=0; i<12; i++) {//ソナー内部の線
    line(380, 550, 380+cos(TWO_PI*i/12)*75, 550+sin(TWO_PI*i/12)*75);
  }

  strokeWeight(3);
  for (int i=1; i<10; i++) {//ソナーの中で回る線
    stroke(0, 200, 0, i*20);
    line(380, 550, 380+cos(millis()*0.003+i*0.05)*75, 550+sin(millis()*0.003+i*0.05) *75);
  }
  strokeWeight(1);



  if (350 < 380+cos(millis()*0.003)*75 && 380+cos(millis()*0.003)*75<430//ソナーに移る影　宿題一個以上で現れる
  && sin(millis()*0.003)<0 &&lines.length>1) {
    fill(0, 200, 0);
    ellipse(380, 510, 10, 10);
  }

  if (310 < 380+cos(millis()*0.003)*75 && 380+cos(millis()*0.003)*75<410 //ソナーに移る影　宿題三個以上で現れる
  && sin(millis()*0.003)<0 &&lines.length>3) {
    fill(0, 200, 0);
    ellipse(355, 530, 12, 12);
  }

  if (390 < 380+cos(millis()*0.003)*75 && 380+cos(millis()*0.003)*75<520 //ソナーに移る影　宿題五個以上で現れる
  && sin(millis()*0.003)<0 &&lines.length>5) {
    fill(0, 200, 0);
    ellipse(425, 520, 15, 15);
  }



  fill(50, 100, 50);
  if (390<mouseX && mouseX<470 && 405<mouseY && mouseY<445) {//銃のアイコンを押すとカーソルの変更
    if (mousePressed) {
      if (time2+500<millis() ) {//０．５秒経たないと押せない
        if (buki == 0) {
          buki=1;//スナイパーライフル
        } else {
          buki=0;//赤いサイト
        }
        time2=millis();
      }
    }
    fill(100, 200, 100);
  }

  hho=int(tim[0].split(","));

  if ( (hour()-hour()%10)/10 ==hho[0] &&
    hour()%10 ==hho[1] &&
    (minute()-minute()%10)/10 ==hho[2] &&
    minute()%10 ==hho[3] && key5==1) {
    player.play(); //再生
  }

  umbre();//スタート画面
}

void stop() {
  player.close();
  minim.stop();

  super.stop();
}

