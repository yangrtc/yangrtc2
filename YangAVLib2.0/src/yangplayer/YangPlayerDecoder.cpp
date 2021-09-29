﻿/*
 * YangDeocoderBase.cpp
 *
 *  Created on: 2019年10月11日
 *      Author: yang
 */

#include "pthread.h"
#include <iostream>
#include <yangutil/yang_unistd.h>
#include <yangplayer/YangPlayerDecoder.h>
#include "yangdecoder/YangDecoderFactory.h"

YangPlayerDecoder::YangPlayerDecoder() {
	//m_ini=pini;
	m_out_audioBuffer=NULL;
	m_out_videoBuffer=NULL;
	m_audioDec=NULL;
	m_videoDec=NULL;
	memset(&m_audio,0,sizeof(m_audio));
	memset(&m_video,0,sizeof(m_video));
	m_audio.audioCacheNum=50;
	m_audio.audioDecoderType=0;
	m_audio.usingMono=0;
	m_audio.channel=2;
	m_audio.sample=44100;

	m_video.bitDepth=8;
	m_video.videoCacheNum=20;
	m_video.evideoCacheNum=20;
	m_video.videoDecoderType=0;
	m_video.videoDecHwType=0;
}

YangPlayerDecoder::~YangPlayerDecoder() {
	if(m_audioDec&&m_audioDec->m_isStart){
		m_audioDec->stop();
		while(m_audioDec->m_isStart){
								yang_usleep(1000);
							}
	}
	if(m_videoDec&&m_videoDec->m_isStart){
		m_videoDec->stop();
		while(m_videoDec->m_isStart){
								yang_usleep(1000);
							}
	}
	//yang_usleep(50000);
	yang_delete(m_audioDec);
	yang_delete(m_videoDec);
	//int32_t i=0;
	if(m_out_videoBuffer){
		delete m_out_videoBuffer;m_out_videoBuffer=NULL;
	}
	if(m_out_audioBuffer){
		delete m_out_audioBuffer;m_out_audioBuffer=NULL;
	}

}
void YangPlayerDecoder::stopAll(){
	if(m_audioDec)	m_audioDec->stop();
	if(m_videoDec)	m_videoDec->stop();
}

void YangPlayerDecoder::setRoomState(int32_t pst){
	//if(m_audioDec) m_audioDec->setRoomState(pst);
	//if(m_videoDec) m_videoDec->setRoomState(pst);
}
void YangPlayerDecoder::initAudioDecoder(){
	if(m_out_audioBuffer==NULL) {
		m_out_audioBuffer=new YangAudioPlayBuffer();
		m_out_audioBuffer->m_syn=&m_syn;
	}
	if(m_audioDec==NULL) {
	//	YangDecoderFactory df;
		//YangAudioParam audio={0};

		m_audioDec=new YangAudioDecoderHandle(&m_audio);
		m_audioDec->init();
		m_audioDec->setOutAudioBuffer(m_out_audioBuffer);
	}
}

void YangPlayerDecoder::initVideoDecoder(){
	//YangConfig *p_config = m_ini;
	if(m_out_videoBuffer==NULL) {
		m_out_videoBuffer=new YangVideoBuffer(1);
		//m_out_videoBuffer->m_syn=&m_syn;
	}
	//m_ini->videoBuffers=m_out_videoBuffer;
//	YangDecoderFactory df;
	if(m_videoDec==NULL) {

		m_videoDec=new YangVideoDecoderHandle(&m_video);
		m_videoDec->init();
		m_videoDec->setOutVideoBuffer(m_out_videoBuffer);
	}

}

void YangPlayerDecoder::startAudioDecoder(){
	if(m_audioDec&&!m_audioDec->m_isStart)		if(m_audioDec) m_audioDec->start();
}

void YangPlayerDecoder::startVideoDecoder(){
		if(m_videoDec&&!m_videoDec->m_isStart) m_videoDec->start();
}

void YangPlayerDecoder::setInVideoBuffer(YangVideoDecoderBuffer *pvel){
	if(m_videoDec!=NULL) m_videoDec->setInVideoBuffer(pvel);
}
void YangPlayerDecoder::setInAudioBuffer(YangAudioEncoderBuffer *pael){
	if(m_audioDec!=NULL) m_audioDec->setInAudioBuffer(pael);
}
YangVideoBuffer* YangPlayerDecoder::getOutVideoBuffer(){
	return m_out_videoBuffer;
}
YangAudioPlayBuffer*  YangPlayerDecoder::getOutAudioBuffer(){
	return  m_out_audioBuffer;
}

