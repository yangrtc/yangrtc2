CONFIG -= qt

TEMPLATE = lib
CONFIG += staticlib

CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS
DEFINES += __STDC_FORMAT_MACROS
HOME_BASE=../
INCLUDEPATH += $$HOME_BASE\include
INCLUDEPATH += $$HOME_BASE/thirdparty/include
INCLUDEPATH += $$HOME_BASE/thirdparty/include/ffmpeg
INCLUDEPATH += $$HOME_BASE/YangAVLib2.0/src
unix{

    INCLUDEPATH += $$HOME_BASE/include    
  CONFIG(debug, debug|release) {
        DESTDIR += $$HOME_BASE/bin/lib_debug
    }else{

        DESTDIR += $$HOME_BASE/bin/lib_release
    }
}
win32{
    DEFINES += _AMD64_
    INCLUDEPATH += $$HOME_BASE\thirdparty\include\win
    INCLUDEPATH += $$HOME_BASE\YangAVLib2.0\src
  CONFIG(debug, debug|release) {
        DESTDIR += $$HOME_BASE\bin\lib_win_debug
    }else{
        DESTDIR += $$HOME_BASE\bin\lib_win_release
    }

    msvc{
        QMAKE_CFLAGS += /utf-8
        QMAKE_CXXFLAGS += /utf-8
       # QMAKE_CXXFLAGS += /source-charset:utf-8 /execution-charset:utf-8
        DEFINES +=HAVE_STRUCT_TIMESPEC
        DEFINES +=WIN32_LEAN_AND_MEAN
        INCLUDEPATH += $$HOME_BASE\thirdparty\include\win\include
    }

}
# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    src/yangavutil/YangAecBase.cpp \
    src/yangavutil/YangAecSpeex.cpp \
    src/yangavutil/YangAudioFactory.cpp \
    src/yangavutil/YangAudioMix.cpp \
    src/yangavutil/YangAudioUtil.cpp \
    src/yangavutil/YangBmp.cpp \
    src/yangavutil/YangConvert.cpp \
    src/yangavutil/YangImageConvert.cpp \
    src/yangavutil/YangJpegUtil.cpp \
    src/yangavutil/YangMakeWave.cpp \
    src/yangavutil/YangMatImage.cpp \
    src/yangavutil/YangMatImageCv.cpp \
    src/yangavutil/YangPicUtilFfmpeg.cpp \
    src/yangavutil/YangPreProcess.cpp \
    src/yangavutil/YangPreProcessSpeex.cpp \
    src/yangavutil/YangResample.cpp \
    src/yangavutil/YangSwResample.cpp \
    src/yangavutil/YangTurboJpeg.cpp \
    src/yangavutil/YangYuvConvert.cpp \
    src/yangavutil/YangYuvUtil.cpp \
    src/yangcapture/YangAlsaDeviceHandle.cpp \
    src/yangcapture/YangAlsaHandle.cpp \
    src/yangcapture/YangAudioCapture.cpp \
    src/yangcapture/YangAudioCaptureHandle.cpp \
    src/yangcapture/YangAudioCaptureImpl.cpp \
    src/yangcapture/YangAudioDeviceQuery.cpp \
    src/yangcapture/YangCaptureAudioData.cpp \
    src/yangcapture/YangCaptureFactory.cpp \
    src/yangcapture/YangRenderAudioData.cpp \
    src/yangcapture/YangScreenCaptureImpl.cpp \
    src/yangcapture/YangScreenShare.cpp \
    src/yangcapture/YangVideoCapture.cpp \
    src/yangcapture/YangVideoCaptureHandle.cpp \
    src/yangcapture/YangVideoCaptureImpl.cpp \
    src/yangcapture/YangVideoDeviceQuery.cpp \
    src/yangcapture/win/YangAudioPlaySdl.cpp \
    src/yangcapture/win/YangRecAudioCaptureHandle.cpp \
    src/yangcapture/win/YangVideoSrc.cpp \
    src/yangcapture/win/YangWinAudioCapture.cpp \
    src/yangcapture/win/YangWinAudioCaptureHandle.cpp \
    src/yangcapture/win/YangWinRecordAudioCapture.cpp \
    src/yangcapture/win/YangWinVideoCapture.cpp \
    src/yangcapture/win/YangWinVideoCaptureHandle.cpp \
    src/yangcapture/win/api/YangWinAudioApi.cpp \
    src/yangcapture/win/api/YangWinAudioApiAec.cpp \
    src/yangcapture/win/api/YangWinAudioApiCapture.cpp \
    src/yangcapture/win/api/YangWinAudioApiDevice.cpp \
    src/yangcapture/win/api/YangWinAudioApiRender.cpp \
    src/yangcapture/win/api/YangWinAudioApiRenders.cpp \
    src/yangdecoder/YangAudioDecoder.cpp \
    src/yangdecoder/YangAudioDecoderAac.cpp \
    src/yangdecoder/YangAudioDecoderHandle.cpp \
    src/yangdecoder/YangAudioDecoderHandles.cpp \
    src/yangdecoder/YangAudioDecoderOpus.cpp \
    src/yangdecoder/YangAudioDecoderSpeex.cpp \
    src/yangdecoder/YangDecoderFactory.cpp \
    src/yangdecoder/YangH2645VideoDecoderFfmpeg.cpp \
    src/yangdecoder/YangH264DecoderSoft.cpp \
    src/yangdecoder/YangH264Header.cpp \
    src/yangdecoder/YangHeaderParseFfmpeg.cpp \
    src/yangdecoder/YangVideoDecoderHandle.cpp \
    src/yangdecoder/YangVideoDecoderHandles.cpp \
    src/yangdecoder/YangVideoDecoderIntel.cpp \
    src/yangencoder/YangAudioEncoder.cpp \
    src/yangencoder/YangAudioEncoderAac.cpp \
    src/yangencoder/YangAudioEncoderHandle.cpp \
    src/yangencoder/YangAudioEncoderHandleCb.cpp \
    src/yangencoder/YangAudioEncoderMeta.cpp \
    src/yangencoder/YangAudioEncoderMp3.cpp \
    src/yangencoder/YangAudioEncoderOpus.cpp \
    src/yangencoder/YangAudioEncoderSpeex.cpp \
    src/yangencoder/YangEncoderFactory.cpp \
    src/yangencoder/YangFfmpegEncoderMeta.cpp \
    src/yangencoder/YangH264EncHeader.cpp \
    src/yangencoder/YangH264EncoderIntel.cpp \
    src/yangencoder/YangH264EncoderMeta.cpp \
    src/yangencoder/YangH264EncoderSoft.cpp \
    src/yangencoder/YangH265EncoderMeta.cpp \
    src/yangencoder/YangH265EncoderSoft.cpp \
    src/yangencoder/YangVideoEncoder.cpp \
    src/yangencoder/YangVideoEncoderFfmpeg.cpp \
    src/yangencoder/YangVideoEncoderHandle.cpp \
    src/yangencoder/YangVideoEncoderMeta.cpp \
    src/yangplayer/YangAVSyn.cpp \
    src/yangplayer/YangAudioPlay.cpp \
    src/yangplayer/YangAudioPlayAlsa.cpp \
    src/yangplayer/YangAudioPlayerSdl.cpp \
    src/yangplayer/YangPlayFactory.cpp \
    src/yangplayer/YangPlayReceive.cpp \
    src/yangplayer/YangPlaySdl.cpp \
    src/yangplayer/YangPlayerBase.cpp \
    src/yangplayer/YangPlayerDecoder.cpp \
    src/yangplayer/YangPlayerHandleImpl.cpp \
    src/yangplayer/YangPlayerPlay.cpp \
    src/yangplayer/YangRtcReceive.cpp \
    src/yangplayer/YangTsTime.cpp \
    src/yangplayer/YangVideoPlay.cpp \
    src/yangplayer/YangWinPlayFactroy.cpp \
    src/yangplayer/YangWinPlaySdl.cpp \
    src/yangpush/YangPushCapture.cpp \
    src/yangpush/YangPushEncoder.cpp \
    src/yangpush/YangPushHandleImpl.cpp \
    src/yangpush/YangPushPublish.cpp \
    src/yangpush/YangRtcPublish.cpp \
    src/yangrecord/YangFlvWrite.cpp \
    src/yangrecord/YangMp4File.cpp \
    src/yangrecord/YangMp4FileApp.cpp \
    src/yangrecord/YangRecEncoder.cpp \
    src/yangrecord/YangRecord.cpp \
    src/yangrecord/YangRecordApp.cpp \
    src/yangrecord/YangRecordCapture.cpp \
    src/yangrecord/YangRecordMp4.cpp \
    src/yangrtmp/YangInvokeBuffer.cpp \
    src/yangrtmp/YangRtmpBase.cpp \
    src/yangrtp/YangRtcp.cpp \
    src/yangrtp/YangRtp.cpp \
    src/yangrtp/YangRtpCodec.cpp \
    src/yangrtp/YangRtpPacket.cpp \
    src/yangrtp/YangRtpQueue.cpp \
    src/yangsrt/YangSrtBase.cpp \
    src/yangsrt/YangTsBuffer.cpp \
    src/yangsrt/YangTsMuxer.cpp \
    src/yangsrt/YangTsPacket.cpp \
    src/yangsrt/YangTsdemux.cpp \
    src/yangsrt/common.cpp \
    src/yangsrt/crc.cpp \
    src/yangsrt/srt_data.cpp \
    src/yangstream/YangAudioStreamFrame.cpp \
    src/yangstream/YangStreamFactory.cpp \
    src/yangstream/YangStreamHandle.cpp \
    src/yangstream/YangStreamRtc.cpp \
    src/yangstream/YangStreamRtmp.cpp \
    src/yangstream/YangStreamSrt.cpp \
    src/yangstream/YangVideoStreamFrame.cpp \
    src/yangutil/TypeCast.cpp \
    src/yangutil/YangAmf.cpp \
    src/yangutil/YangAvtype.cpp \
    src/yangutil/YangEndian.cpp \
    src/yangutil/YangFile.cpp \
    src/yangutil/YangIniImpl.cpp \
    src/yangutil/YangLoadLib.cpp \
    src/yangutil/YangLog.cpp \
    src/yangutil/YangSocket.cpp \
    src/yangutil/YangSsl.cpp \
    src/yangutil/YangSsrc.cpp \
    src/yangutil/YangString.cpp \
    src/yangutil/YangSysMessageHandle.cpp \
    src/yangutil/YangThread.cpp \
    src/yangutil/YangTime.cpp \
    src/yangutil/YangTimer.cpp \
    src/yangutil/buffer/YangAudioBuffer.cpp \
    src/yangutil/buffer/YangAudioEncoderBuffer.cpp \
    src/yangutil/buffer/YangAudioPlayBuffer.cpp \
    src/yangutil/buffer/YangBuffer.cpp \
    src/yangutil/buffer/YangMediaBuffer.cpp \
    src/yangutil/buffer/YangVideoBuffer.cpp \
    src/yangutil/buffer/YangVideoDecoderBuffer.cpp \
    src/yangutil/buffer/YangVideoEncoderBuffer.cpp \
    src/yangwebrtc/YangRtcDtls.cpp \
    src/yangwebrtc/YangRtcHandleImpl.cpp \
    src/yangwebrtc/YangRtcPlayStream.cpp \
    src/yangwebrtc/YangRtcPublishStream.cpp \
    src/yangwebrtc/YangRtcSdp.cpp \
    src/yangwebrtc/YangRtcSession.cpp \
    src/yangwebrtc/YangRtcStun.cpp \
    src/yangwebrtc/YangRtcUserConfig.cpp \
    src/yangwebrtc/YangSrsHttp.cpp \
    src/yangwebrtc/YangUdpHandle.cpp


HEADERS += \
    src/yangavutil/YangAecSpeex.h \
    src/yangavutil/YangImageConvert.h \
    src/yangavutil/YangPreProcessSpeex.h \
    src/yangcapture/YangAlsaDeviceHandle.h \
    src/yangcapture/YangAlsaHandle.h \
    src/yangcapture/YangAudioCaptureHandle.h \
    src/yangcapture/YangAudioCaptureImpl.h \
    src/yangcapture/YangScreenCaptureImpl.h \
    src/yangcapture/YangScreenShare.h \
    src/yangcapture/YangVideoCaptureHandle.h \
    src/yangcapture/YangVideoCaptureImpl.h \
    src/yangcapture/YangVideoDeviceQuery.h \
    src/yangcapture/win/YangAudioPlaySdl.h \
    src/yangcapture/win/YangRecAudioCaptureHandle.h \
    src/yangcapture/win/YangVideoSrc.h \
    src/yangcapture/win/YangWinAudioCapture.h \
    src/yangcapture/win/YangWinAudioCaptureHandle.h \
    src/yangcapture/win/YangWinAudioDevice.h \
    src/yangcapture/win/YangWinRecordAudioCapture.h \
    src/yangcapture/win/YangWinVideoCapture.h \
    src/yangcapture/win/YangWinVideoCaptureHandle.h \
    src/yangcapture/win/api/YangAudioApiCapture.h \
    src/yangcapture/win/api/YangWinAudioApi.h \
    src/yangcapture/win/api/YangWinAudioApiAec.h \
    src/yangcapture/win/api/YangWinAudioApiCapture.h \
    src/yangcapture/win/api/YangWinAudioApiDevice.h \
    src/yangcapture/win/api/YangWinAudioApiRender.h \
    src/yangcapture/win/api/YangWinAudioApiRenders.h \
    src/yangdecoder/YangAudioDecoderAac.h \
    src/yangdecoder/YangAudioDecoderOpus.h \
    src/yangdecoder/YangAudioDecoderSpeex.h \
    src/yangdecoder/YangH2645VideoDecoderFfmpeg.h \
    src/yangdecoder/YangH264Dec.h \
    src/yangdecoder/YangH264DecoderSoft.h \
    src/yangdecoder/YangH264DecoderSoftFactory.h \
    src/yangdecoder/YangH264Header.h \
    src/yangdecoder/YangH264Header1.h \
    src/yangdecoder/YangHeaderParseFfmpeg.h \
    src/yangdecoder/YangVideoDecoderIntel.h \
    src/yangencoder/YangAudioEncoderAac.h \
    src/yangencoder/YangAudioEncoderMp3.h \
    src/yangencoder/YangAudioEncoderOpus.h \
    src/yangencoder/YangAudioEncoderSpeex.h \
    src/yangencoder/YangFfmpegEncoderMeta.h \
    src/yangencoder/YangH264EncHeader.h \
    src/yangencoder/YangH264EncoderIntel.h \
    src/yangencoder/YangH264EncoderIntel1.h \
    src/yangencoder/YangH264EncoderMeta.h \
    src/yangencoder/YangH264EncoderSoft.h \
    src/yangencoder/YangH265EncoderMeta.h \
    src/yangencoder/YangH265EncoderSoft.h \
    src/yangencoder/YangVideoEncoderFfmpeg.h \
    src/yangencoder/lame.h \
    src/yangplayer/YangAudioPlayAlsa.h \
    src/yangplayer/YangPlayCommon.h \
    src/yangplayer/YangPlaySdl.h \
    src/yangplayer/YangPlayerHandleImpl.h \
    src/yangplayer/YangRtcReceive.h \
    src/yangplayer/YangTsTime.h \
    src/yangpush/YangPushEncoder.h \
    src/yangpush/YangPushHandleImpl.h \
    src/yangrtmp/YangRtmpBase1.h \
    src/yangrtp/YangRtcp.h \
    src/yangrtp/YangRtp.h \
    src/yangrtp/YangRtpCodec.h \
    src/yangrtp/YangRtpConstant.h \
    src/yangrtp/YangRtpPacket.h \
    src/yangrtp/YangRtpQueue.h \
    src/yangstream/YangStreamRtc.h \
    src/yangstream/YangStreamRtmp.h \
    src/yangstream/YangStreamSrt.h \
    src/yangwebrtc/YangLocalSdp.h \
    src/yangwebrtc/YangRtcDtls.h \
    src/yangwebrtc/YangRtcHandleImpl.h \
    src/yangwebrtc/YangRtcPlayStream.h \
    src/yangwebrtc/YangRtcPublishStream.h \
    src/yangwebrtc/YangRtcSdp.h \
    src/yangwebrtc/YangRtcSession.h \
    src/yangwebrtc/YangRtcStun.h \
    src/yangwebrtc/YangRtcUserConfig.h \
    src/yangwebrtc/YangSrsHttp.h \
    src/yangwebrtc/YangUdpHandle.h

# Default rules for deployment.
unix {
    target.path = $$[QT_INSTALL_PLUGINS]/generic
}
!isEmpty(target.path): INSTALLS += target
