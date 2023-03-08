Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 938336B14C8
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 23:08:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 947CB10E735;
	Wed,  8 Mar 2023 22:08:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 314 seconds by postgrey-1.36 at gabe;
 Wed, 08 Mar 2023 22:08:22 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E84D210E735
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 22:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1678313301; i=deller@gmx.de;
 bh=URLRtCYvCA2OfgePK0dWq7nXnf4urDizzWJ5/29Hrz8=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=M2rz9gGIWO64OgRNDuu+sb+yd232rPzlxA4QfYaMhEtxG6NhEmktUUaVuV277xsqw
 2FXvaq0sB+DyPRouZX6ICoUHoPDKLF8Zd9i3vpwpw7mdvJL7Ffmbv0w46suTXX/Gfv
 lcgloQeOWnb4R+5Bo39GXca5NnnMyg0B1KX08cq0YzfHLALmWb7MYeU2Se9gIu73pQ
 FQXN7GGQlgfp/ZSnK7DEvYrAMW533m6lRH02Lqy5HfYqAXeL1e1cPqOoTOriqJmAJB
 zC2TvfZ96MreedZ2lIAGmQrvSvs0Vy4UnC8n+qDx0Uy5sYWudJARBkCzvU10zYpQhj
 rg0lnJnqVbPVQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.151.44]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MYNNo-1q5UnP0E54-00VU3c; Wed, 08
 Mar 2023 23:03:01 +0100
Message-ID: <53d85de3-3072-50e2-9ce8-1fd48a2cfd69@gmx.de>
Date: Wed, 8 Mar 2023 23:03:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] MAINTAINERS: orphan SIS FRAMEBUFFER DRIVER
Content-Language: en-US
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Thomas Winischhofer <thomas@winischhofer.net>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20230308071921.10963-1-lukas.bulwahn@gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20230308071921.10963-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YAJsaXgvOu0OB9fOwoTOiZ/2PC23B/DNDuSZiQLGjU07wjsxQAl
 qd03dqtJO4F5q0zf2FXWuptrt4RJpXMT8Vv1EEogkxZ3n/nbynNOH3TxJzMdh+MlXKYuBzE
 2DxQsF8p6tjUoC3Hhgm15bW3puUSfVeGj3PRwGMk2/Dpve6F3/dWQkvnPd59HUFH6F5R1Do
 Pi9Tq/HT/NiT9ybm37e3Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8WRlw4+5MJ8=;cisELys0PDPgKirlxGpjcx6QRzQ
 4ggecXtdM2gASntWBU1Ookhqlk2dPgvRWp8szcjGhaQaWxXwqUVj6RDCm2m9RTkF1rrN/lSRw
 rM3YVmcZneB/UoV3n1rD4l0aWAXbn04816YmoK2ZC2dY6B+/rE9/QM+ghsqFzDzkeHa12YAEL
 Cl/d1vKNN08Ret0joD6S9N68EPtUBo110ILgkIRYKDJB80ZoUDSaqkbGb95rxnSww/BVctZEf
 9BpiZT76DiHJbcsQjtonx+3WniyOQ3zHZT69VjNYmse+zd9SQS3tyXCeIuD8qrR4WMCZbRjiv
 zRR8bNZY/x+B/Cc5Mw+1sD2JwoFzmCzbONbSFdc6U489r0NuJq3+gpEwOE8zjaLZwIs6LJV6N
 WXWMiYvSVp+mdRwYR5PSK8q/z+FK2d8/ANVzk5PQ7Oh70WLvnKL27ukKjDsiBGmTItwcHoJaT
 XQgZJWS+DaBmc2vWOkQGJRTpAiZ/SKJlTYbW/TGVFcVen1O4n6+pL3FZSOcuR9brz3b+Jn4kX
 1NBvxHoeYF0B3lqOnWSuy3IUX3uFwhGmWlj/WUwPAlTm9QlH7vSG11GDs1kYTJFb8Mo/H4gpG
 FHcoTSmp4Z3SEPBrYlPFtgA8lHkJgDk19uDYWqhv06bobH3cbbeH736y7xmAlRvpYZcN51IY4
 WAoL5Qv1SbcOAxZDF9m3qnu6IS7jRgw3Qr01e/wgScWOrBnZvm77layk5SID95KLu4+yHYtlq
 x2QF3DTt+lzR+t3Njqa40/hYxKE0II25yROjDRBBCRL+V+vKJeISLAQj9BLd3oLyejPWP/GW8
 LA1ZdIYZ4BK262BlNjKrk9CLKdQzq/h24J0NZFstQZBPI7mH9irqpb+u2dPbQiTKa8pHYFyvn
 yNOOuvVaC7g/UeGfN8czp/skoLRWSzCLVd5Qyp/jdIHcz1/w7zlOmWf1jgUOguc/Y/E/13IFv
 PiD4W10+TV61I4ZqXspiOzbRHDM=
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/8/23 08:19, Lukas Bulwahn wrote:
> This was triggered by the fact that the webpage:
>
>    http://www.winischhofer.net/linuxsisvga.shtml
>
> cannot be reached anymore.
>
> Thomas Winischhofer is still reachable at the given email address, but h=
e
> has not been active since 2005.
>
> Mark the SIS FRAMEBUFFER DRIVER as orphan to reflect the current state.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

applied to fbdev git tree.

Thanks!
Helge



> ---
>   MAINTAINERS | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5d8f46f35aa4..354577534aef 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19191,9 +19191,7 @@ W:	http://www.brownhat.org/sis900.html
>   F:	drivers/net/ethernet/sis/sis900.*
>
>   SIS FRAMEBUFFER DRIVER
> -M:	Thomas Winischhofer <thomas@winischhofer.net>
> -S:	Maintained
> -W:	http://www.winischhofer.net/linuxsisvga.shtml
> +S:	Orphan
>   F:	Documentation/fb/sisfb.rst
>   F:	drivers/video/fbdev/sis/
>   F:	include/video/sisfb.h

