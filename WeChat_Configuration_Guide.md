# WeChat MP Configuration Guide

This guide will help you configure the WeChat MP (Official Account) service in the system to enable features like WeChat login and binding.

## Issue Description

If you're seeing errors related to WeChat QR code generation or binding, it's likely because the WeChat MP service is not properly configured in the system.

## Configuration Steps

1. **Register a WeChat Official Account**:
   - Go to the [WeChat Official Account Platform](https://mp.weixin.qq.com/) and register an account
   - You'll need at least a Service Account or Subscription Account

2. **Get the Required Credentials**:
   - AppID
   - AppSecret
   - Token (you can generate this yourself)
   - AesKey (you can generate this yourself)

3. **Configure the System**:
   - Log in to the admin panel
   - Go to System Configuration
   - Find the WeChat MP configuration section
   - Enter the AppID, AppSecret, Token, and AesKey

4. **Alternative Configuration Method**:
   - If the admin panel doesn't have a WeChat MP configuration section, you can configure it directly in the application.yml file:

```yaml
wx:
  mp:
    configs:
      - appId: YOUR_APP_ID
        secret: YOUR_APP_SECRET
        token: YOUR_TOKEN
        aesKey: YOUR_AES_KEY
```

5. **Restart the Application**:
   - After configuring the WeChat MP service, restart the application for the changes to take effect

## Troubleshooting

If you're still experiencing issues after configuration:

1. Check the application logs for specific error messages
2. Verify that the credentials are correct
3. Make sure the WeChat Official Account has the necessary permissions
4. Ensure the server can access the WeChat API (no firewall blocking)

## Support

If you need further assistance, please contact the system administrator or developer.
