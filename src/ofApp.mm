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
		if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
				// The device is an iPad running iOS 3.2 or later.
				// The device is an iPhone or iPod touch.
				ofSetColor(255);
				grabber.draw(0, 0, ofGetWidth(), ofGetHeight());
				ofRect(0, 0, 100, 50);
				originImage.draw(ofPoint(0, 0), ofGetWidth(), ofGetHeight());
				ofColor originColor, canvasColor, grabberColor;
				ofImage grabberImage;
				grabber.draw(0, 0, ofGetWidth(), ofGetHeight());
				grabberImage.grabScreen(0, 0, ofGetWidth(), ofGetHeight());
				grabberImage.resize(ofGetWidth()/2, ofGetHeight()/2);
				ofLog(OF_LOG_NOTICE, "canvas");
				ofLog(OF_LOG_NOTICE, "w"+ofToString(canvasImage.width)+"="+ofToString(ofGetWidth()));
				ofLog(OF_LOG_NOTICE, "h"+ofToString(canvasImage.height)+"="+ofToString(ofGetHeight()));
				ofLog(OF_LOG_NOTICE, "monalisa");
				ofLog(OF_LOG_NOTICE, "w"+ofToString(originImage.width)+"="+ofToString(ofGetWidth()));
				ofLog(OF_LOG_NOTICE, "h"+ofToString(originImage.height)+"="+ofToString(ofGetHeight()));
				ofLog(OF_LOG_NOTICE, "grabberImage");
				ofLog(OF_LOG_NOTICE, "w"+ofToString(grabberImage.width)+"="+ofToString(ofGetWidth()));
				ofLog(OF_LOG_NOTICE, "h"+ofToString(grabberImage.height)+"="+ofToString(ofGetHeight()));
				
				for (int i=0; i<ofGetHeight()/2; i++) {
						for (int j=0; j<ofGetWidth()/2; j++) {
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
		}else{
				// The device is an iPhone or iPod touch.
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
