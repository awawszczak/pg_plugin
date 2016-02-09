package com.fanserv.plugin;

import android.util.DisplayMetrics;

import com.fanserv.fanserver.FanServer;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public class FanServAd extends CordovaPlugin {

    private String mBannerSize;
    private String mInterstitialSize;

    private static final String fanServAppId = "61c8d48c8b274c919d1cfe8160daf9c1";

    protected void pluginInitialize() {
        System.err.println("PLUGIN INITIALIZE CALLED");
        initFanServ();
    }

    public boolean execute(String action, JSONArray args, CallbackContext callbackContext)
            throws JSONException {
        System.err.println("EXECUTE CALLED");
//        if (action.equals("alert")) {
//            alert(args.getString(0), args.getString(1), args.getString(2), callbackContext);
//            return true;
//        }
        return false;
    }


    private synchronized void showBannerAd() {
        System.err.println("SHOW BANNER AD CALLED");
        try {
            FanServer.getInstance().startAd(cordova.getActivity(), FanServer.FanServerAdTypePhoneBanner, mBannerSize);
        } catch (Exception e) {
            //
        }
    }

    private synchronized void showInterstitialAd() {
        System.err.println("SHOW INTERSTITIAL AD CALLED");
        try {
            FanServer.getInstance().startAd(cordova.getActivity(), FanServer.FanServerAdTypePhoneInterstitial, mInterstitialSize);
        } catch (Exception e) {
            //
        }
    }

    private synchronized void hideAd() {
        System.err.println("HIDE ADD CALLED");
        Method method;
        Object obj = FanServer.getInstance();
        Object[] parameters = new Object[1];
        Class<?>[] classArray = new Class<?>[1];
        parameters[0] = cordova.getActivity();
        classArray[0] = cordova.getActivity().getClass();
        try {
            method = obj.getClass().getDeclaredMethod("cleanFromAds", classArray);
            method.setAccessible(true);
            method.invoke(obj, parameters);
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
    }

    private synchronized void setHidden() {
    }

    private synchronized void setVisible() {
    }

    private void initFanServ() {
        try {
            DisplayMetrics display = cordova.getActivity().getResources().getDisplayMetrics();
            int screen_width = display.widthPixels;
            int screen_height = display.heightPixels;

            FanServer.getInstance().serverAddress(FanServer.FanServerAddress.FanServerProd);
            FanServer.getInstance().init(cordova.getActivity(), fanServAppId);

            FanServer.getInstance().setAnimationStyle(FanServer.FanServerAdAnimation.FanServerAdAnimationFromBottom);
            FanServer.getInstance().setAnimationStyle(FanServer.FanServerAdAnimation.FanServerAdAnimationToBottom);
            FanServer.getInstance().setBannerAlign(FanServer.FanServerAlign.FanServerAlignCenter);
            FanServer.getInstance().setWaitForImages(true);
            FanServer.getInstance().setCheckDoubleAdShowOnResume(false);

            if (screen_width >= 1440) mInterstitialSize = FanServer.FanServerAdSize1440x2560;
            else if (screen_width >= 1080) {
                if (screen_height >= 1920)
                    mInterstitialSize = FanServer.FanServerAdSize1080x1920;
                else
                    mInterstitialSize = FanServer.FanServerAdSize1080x1800;
            } else if (screen_width >= 720) {
                if (screen_height >= 1280)
                    mInterstitialSize = FanServer.FanServerAdSize720x1280;
                else
                    mInterstitialSize = FanServer.FanServerAdSize720x1200;
            } else if (screen_width >= 600) mInterstitialSize = FanServer.FanServerAdSize600x500;
            else if (screen_width >= 480) mInterstitialSize = FanServer.FanServerAdSize480x800;
            else mInterstitialSize = FanServer.FanServerAdSize300x250;


            if (screen_width >= 1440) mBannerSize = FanServer.FanServerAdSize1440x225;
            else if (screen_width >= 1080) {
                if (screen_height >= 1800)
                    mBannerSize = FanServer.FanServerAdSize1080x180;
                else
                    mBannerSize = FanServer.FanServerAdSize1080x169;
            } else if (screen_width >= 720) {
                if (screen_height >= 1200)
                    mBannerSize = FanServer.FanServerAdSize720x120;
                else
                    mBannerSize = FanServer.FanServerAdSize720x113;
            } else if (screen_width >= 600) mBannerSize = FanServer.FanServerAdSize600x100;
            else if (screen_width >= 480) mBannerSize = FanServer.FanServerAdSize480x80;
            else mBannerSize = FanServer.FanServerAdSize300x50;
        } catch (Exception e) {
            //
        }
    }
}