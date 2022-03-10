package com.example.lesson9;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;

import androidx.annotation.NonNull;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "flutterapp.tutorialspoint.com/browser";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
                new MethodChannel.MethodCallHandler() {
                    @Override
                    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
                        String url = call.argument("url");
                        if (call.method.equals("openBrowser")) {
                            openBrowser(call, result, url);
                        } else {
                            result.notImplemented();
                        }
                    }
                }
        );
    }
    private void openBrowser(MethodCall call, Result result, String url) {
        Activity activity = this; if (activity == null) {
            result.error(
                    "ACTIVITY_NOT_AVAILABLE", "Browser cannot be opened without foreground activity", null
            );
            return;
        }
        Intent intent = new Intent(Intent.ACTION_VIEW);
        intent.setData(Uri.parse(url));
        activity.startActivity(intent);
        result.success((Object) true);
    }
}
