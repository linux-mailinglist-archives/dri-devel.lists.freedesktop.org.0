Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9397EFC01
	for <lists+dri-devel@lfdr.de>; Sat, 18 Nov 2023 00:05:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FBDB10E77E;
	Fri, 17 Nov 2023 23:05:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 473 seconds by postgrey-1.36 at gabe;
 Fri, 17 Nov 2023 20:54:03 UTC
Received: from 02d.relay.hey.com (02d.relay.hey.com [204.62.114.231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA7E10E0BF
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 20:54:03 +0000 (UTC)
Received: from hey.com (bigip-vip.rw-ash-int.37signals.com [10.20.0.24])
 by 02.relay.hey.com (Postfix) with ESMTP id 25B481BFC5F;
 Fri, 17 Nov 2023 20:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hey.com; s=heymail;
 t=1700253970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KhAg7IMV7M70cFyWUBrOVPfv7J+fXLOTa0VoF6Nr5io=;
 b=E+qrOPUp2Ab2hor2SoxOidyBJPyZacBpp7Tg7JbM/BGXLPHH/wHmCGzOoMEEeVj8F55Eg3
 pB5I5F14u8aMazx3rj4MkkEK6t7Mxj16DJOupWz5q4g9900so7bbQkk1/3BNNAsq/bbL4c
 qYaQlX9Mt9/1XwgHL1F+TcKGjSlgOdI0SHBNaJnq47db4tpsJCnVNPJttxoVHSOf6jBCA+
 w9vlmTcwbG7235AKm3Kfkw+7qsw7dqRlXKTVPrXED5nZZv4683c1MF++2lEwlm9RuwUjOy
 rQb9yXgxOIPa6kTG3mRR2QflE3FrvtGZQeZokouPOkq6+2W09agxYmQLx9TuqQ==
Date: Fri, 17 Nov 2023 12:46:07 -0800
From: Sean Aguinaga <sean.a@hey.com>
To: julius@zint.sh
Message-ID: <43d33bc0374ff57f45020c35d8234a0c74cffb77@hey.com>
Subject: Re: [PATCH 0/1] Backlight driver for the Apple Studio Display
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="--==_mimepart_6557d1104345d_17be220bc20956";
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 17 Nov 2023 23:05:15 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: daniel.thompson@linaro.org, zajec5@gmail.com, jingoohan1@gmail.com,
 deller@gmx.de, lee@kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


----==_mimepart_6557d1104345d_17be220bc20956
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit

Did you get a chance to implement V2?

I want this in my own install! :)

Thank you
Sean Aguinaga

----==_mimepart_6557d1104345d_17be220bc20956
Content-Type: text/html;
 charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html>
  <head>
    <meta charset=3D"utf-8">
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf=
-8" />
    <meta name=3D"viewport" id=3D"viewport" content=3D"width=3Ddevice-wid=
th,minimum-scale=3D1.0,maximum-scale=3D10.0,initial-scale=3D1.0" />

    <style>
      html{-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%}h1{fon=
t-size:1.3em;line-height:1.2;margin:0}ul,ol{margin:0;padding:0}ul li,ol l=
i,li li{margin:0 0 0 36px}[dir=3Drtl] li{margin:0 18px 0 0}blockquote{bor=
der-color:#dfdee1;border-style:solid;border-width:0 0 0 1px;margin:0;padd=
ing:0 0 0 1em}[dir=3Drtl] blockquote,blockquote[dir=3Drtl]{border-width:0=
 1px 0 0;padding:0 1em 0 0}pre{font-family:"SFMono-Regular",Consolas,"Lib=
eration Mono",Menlo,Courier,monospace;font-size:.9em;margin:0;padding:1re=
m;background-color:#f6f5f3;white-space:pre-wrap;word-wrap:break-word;over=
flow:visible}.message-content{font-family:-apple-system,BlinkMacSystemFon=
t,"Segoe UI",Roboto,Helvetica,Arial,sans-serif,"Apple Color Emoji","Segoe=
 UI Emoji","Segoe UI Symbol";line-height:1.4}.attachment{display:inline-b=
lock;margin:0;padding:0}.attachment__caption{padding:0;text-align:center}=
.attachment__caption a[href]{text-decoration:none;color:#333}.attachment-=
-preview{width:100%;text-align:center;margin:.625em 0}.attachment--previe=
w img{border:1px solid #dfdee1;vertical-align:middle;width:auto;max-width=
:100%;max-height:640px}.attachment--preview .attachment__caption{color:#7=
16d7b;font-size:.85em;margin-top:.625em}.attachment--file{color:#282138;l=
ine-height:1;margin:0 2px 2px 0;padding:.4em 1em;border:1px solid #dfdee1=
;border-radius:5px}.permalink{color:inherit}.txt--xx-small{font-size:14px=
}.flush{margin:0;padding:0}.push--bottom{margin-bottom:8px}.border--top{b=
order-top:1px solid #ece9e6}.btn{padding:.2em .4em;font-weight:500;text-d=
ecoration:none;border-radius:3rem;white-space:nowrap;background:#5522fa;b=
order-color:#5522fa;color:#fff}.btn--email{display:inline-block;text-alig=
n:center;font-weight:500;font-size:1em;text-decoration:none;border-radius=
:2em;white-space:nowrap;background:#5522fa;border-color:#5522fa;color:#ff=
f;border-top:.3em solid #5522fa;border-left:1em solid #5522fa;border-bott=
om:.3em solid #5522fa;border-right:1em solid #5522fa}.shaded{padding:1em;=
border-radius:4px;background-color:#f6f5f3;border:1px solid #dfdee1}

    </style>
  </head>

  <body>
    <div class=3D"message-content">
      <div class=3D"trix-content">
  <div>Did you get a chance to implement V2?<br><br>I want this in my own=
 install! :)<br><br></div><div>Thank you<br>Sean Aguinaga</div>
</div>


    </div>
  </body>
</html>

----==_mimepart_6557d1104345d_17be220bc20956--
