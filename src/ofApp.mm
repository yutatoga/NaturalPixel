#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){	
    ofSetOrientation(OF_ORIENTATION_DEFAULT);//Set iOS to Orientation Landscape Right
    // iPhone 5S
    // ofGetWidth():320
    // ofGetHeight():568
    
    ofSetFrameRate(30);
    grabber.setDeviceID(0); //外側カメラ:0 内側カメラ:1
    grabber.initGrabber(ofGetWidth(), ofGetHeight(), OF_PIXELS_BGRA);
    originImage.loadImage("monalisa.jpg");
    canvasImage.loadImage("canvas.jpg");
}

//--------------------------------------------------------------
void ofApp::update(){
    ofBackground(255,255,255);
    grabber.update();
}

//--------------------------------------------------------------
void ofApp::draw(){
    ofSetColor(255);
    grabber.draw(0, 0, ofGetWidth(), ofGetHeight());
    ofRect(0, 0, 100, 50);
    originImage.draw(ofPoint(0, 0), ofGetWidth(), ofGetHeight());
    ofColor originColor, canvasColor, grabberColor;
    ofImage grabberImage;
    grabber.draw(0, 0, ofGetWidth(), ofGetHeight());
    grabberImage.grabScreen(0, 0, ofGetWidth(), ofGetHeight());
    for (int i=0; i<ofGetHeight(); i++) {
        for (int j=0; j<ofGetWidth(); j++) {
            //カメラからの入力した色が、今のカンバスの色よりも近い場合は、塗り替える
            grabberColor = grabberImage.getColor(j, i);
            canvasColor = canvasImage.getColor(j, i);
            originColor = originImage.getColor(j, i);
            if (colorDistance(grabberColor, originColor) < colorDistance(canvasColor, originColor)) {
                canvasImage.setColor(j, i, grabberColor);
            }
            
        }
    }
    canvasImage.update();
    canvasImage.draw(ofPoint(0,0), ofGetWidth(), ofGetHeight());
}

float ofApp::colorDistance(ofColor color1, ofColor color2){
    return sqrt((color2.r-color1.r)*(color2.r-color1.r)+(color2.g-color1.g)*(color2.g-color1.g)+(color2.b-color1.b)*(color2.b-color1.b));
}

//--------------------------------------------------------------
void ofApp::exit(){

}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchDoubleTap(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::lostFocus(){

}

//--------------------------------------------------------------
void ofApp::gotFocus(){

}

//--------------------------------------------------------------
void ofApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void ofApp::deviceOrientationChanged(int newOrientation){

}
