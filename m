Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 868374EECCF
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 14:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C59310E111;
	Fri,  1 Apr 2022 12:04:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m176237.qiye.163.com (mail-m176237.qiye.163.com
 [59.111.176.237])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF5510E111
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 12:04:33 +0000 (UTC)
Received: from [172.16.12.141] (unknown [58.22.7.114])
 by mail-m176237.qiye.163.com (Hmail) with ESMTPA id B4436C40498;
 Fri,  1 Apr 2022 20:04:30 +0800 (CST)
Content-Type: multipart/alternative;
 boundary="------------O5aaJrIyhY4HfQnryRXFxtI1"
Message-ID: <041d7795-fdec-8e7d-a9ee-aa79c0faa6f3@rock-chips.com>
Date: Fri, 1 Apr 2022 20:04:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v9 00/23] drm/rockchip: RK356x VOP2 support
Content-Language: en-US
From: Andy Yan <andy.yan@rock-chips.com>
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
References: <20220328151116.2034635-1-s.hauer@pengutronix.de>
 <FB201567-AE5A-4242-82F1-7C55D8F111EA@gmail.com>
 <20220330072822.GX12181@pengutronix.de>
 <0D8F5951-5375-46B5-BFF0-7ED410371EB7@gmail.com>
 <20220330094556.GZ12181@pengutronix.de>
 <D3DA14F9-C9C6-4927-B015-5B7D25689DAA@gmail.com>
 <20220330102046.GA12181@pengutronix.de>
 <60601619-EF07-457B-91F2-64FEB598FEBE@gmail.com>
 <20220330192054.GA4012@pengutronix.de>
 <af8445e0-f4af-721b-709e-2eb7c488a8a4@rock-chips.com>
 <B7CD9D55-9F2D-42F4-9D04-17C6A5FEBB08@gmail.com>
 <622c8786-2c3f-13ff-66b7-ad9c8cb9425e@rock-chips.com>
In-Reply-To: <622c8786-2c3f-13ff-66b7-ad9c8cb9425e@rock-chips.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUlKS0tKN1dZLVlBSVdZDwkaFQgSH1lBWUIeQhlWGENMQklKHk
 IeTUhCVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktDSUNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NAg6ESo6Az5RQgMpSwINEwoM
 HiIKFDFVSlVKTU9DQ0pPTUxKT0hCVTMWGhIXVRoVHwJVAhoVOwkUGBBWGBMSCwhVGBQWRVlXWRIL
 WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSkpIT0s3Bg++
X-HM-Tid: 0a7fe5034550d9afkuwsb4436c40498
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, kernel@pengutronix.de,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------O5aaJrIyhY4HfQnryRXFxtI1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Piotr:

On 4/1/22 09:52, Andy Yan wrote:
>
> Hi Piotr:
>
> On 3/31/22 22:53, Piotr Oniszczuk wrote:
>>> Wiadomość napisana przez Andy Yan<andy.yan@rock-chips.com>  w dniu 31.03.2022, o godz. 14:13:
>>>
>>>
>>> Piotr:
>>>
>>> What soc is on you board? rk3566 or rk3568?
>> it is rk3566 in x96-x6 tvbox
>
>
> RK3566?  Maybe that is the problem.
>
>
> plane[43]: Esmart1-win0
> crtc=(null)
> fb=0
> crtc-pos=0x0+0+0
> src-pos=0.000000x0.000000+0.000000+0.000000
> rotation=1
> normalized-zpos=1
> color-encoding=ITU-R BT.601 YCbCr
> color-range=YCbCr limited range
>
> From your dri/state dump, Plane 43 is Esmart1.
>
> Cluster1, Esmart1, Smart1 are special on rk3566, they are
>
> mirror window of Cluster0, Esmart0, Esmart0. That means
>
> the software can't program  a independent framebuffer for
>
> these three windows. They can only share the fb address set
>
> in Cluster0, Esmart0, Smart0.
>
> For rk3566, we only use it for two VP display same content:
>
> assign Cluster0,Esmart0,Smart0 to VP1 for primary display(MIPI),
>
> assign Cluster1,Esmart1, Smart1 to VP0 for extend display(HDMI)
>
> we handle this logic in Android hwc:
>
> When a hdmi is connected, hwc will commit Esmart1 with Esmart0 with the
>
> same fb and src buffer size, the dst can be different(by window scale)
>
>
> I have code comment in my downstream kernel and explained this detail 
> when Sascha start submit this serials.
>
>>> I have a scripts[0]  use io[1] command to dump the VOP2 register you can use it dump the register configuration when you meet a display failure,
>>>
>>> then send the dump to me, maybe I can figure out something.
>>>
>>> [0]https://github.com/andyshrk/buildroot/blob/2022/board/andyshrk/rootfs_overlay/usr/bin/vop2_dump.sh
>>>
>>> [1]https://github.com/andyshrk/io
>> Andy
>>
>> Pls seehttps://pastebin.com/CHmu9s22
>
>
> The dump is a little strange, I will check it in the later night.
>

Pls update the new vop2_dump.sh scripts from github. The

previous scripts I gave you has some bug. sorry.

>> I put dumps for following scenarios:
>>
>> 1.
>> -boot
>> -modetest -s 69@67:1920x1080 -> ok
>> -modetest -P 43@67:1920x1080@NV12 -> green screen
>>
>>
>> 2.
>> -boot
>> -modetest -s 69@67:1920x1080 -> ok
>> -modetest -P 49@67:1920x1080@NV12 -> ok (but shifted horizontally by about 5% of screen width)
>> (setting palne#49 fixes plane #43. Here i set plane #49 but not yet setting #43)
>>
>>
>> 3.
>> -boot
>> -modetest -s 69@67:1920x1080 -> ok
>> -modetest -P 49@67:1920x1080@NV12 -> ok (but shifted horizontally by about 5% of screen width)
>> -modetest -P 43@67:1920x1080@NV12 -> now ok (but shifted horizontally by about 5% of screen width)
>>
--------------O5aaJrIyhY4HfQnryRXFxtI1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Piotr:<br>
    </p>
    <div class="moz-cite-prefix">On 4/1/22 09:52, Andy Yan wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:622c8786-2c3f-13ff-66b7-ad9c8cb9425e@rock-chips.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p>Hi Piotr:<br>
      </p>
      <div class="moz-cite-prefix">On 3/31/22 22:53, Piotr Oniszczuk
        wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:B7CD9D55-9F2D-42F4-9D04-17C6A5FEBB08@gmail.com">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Wiadomość napisana przez Andy Yan <a class="moz-txt-link-rfc2396E" href="mailto:andy.yan@rock-chips.com" moz-do-not-send="true">&lt;andy.yan@rock-chips.com&gt;</a> w dniu 31.03.2022, o godz. 14:13:


Piotr:

What soc is on you board? rk3566 or rk3568?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">it is rk3566 in x96-x6 tvbox</pre>
      </blockquote>
      <p><br>
      </p>
      <p>RK3566?  Maybe that is the problem.</p>
      <p><br>
      </p>
      <div class="de1">plane[43]: Esmart1-win0 </div>
      <div class="de1"> crtc=(null) </div>
      <div class="de1"> fb=0 </div>
      <div class="de1"> crtc-pos=0x0+0+0 </div>
      <div class="de1"> src-pos=0.000000x0.000000+0.000000+0.000000 </div>
      <div class="de1"> rotation=1 </div>
      <div class="de1"> normalized-zpos=1 </div>
      <div class="de1"> color-encoding=ITU-R BT.601 YCbCr </div>
      color-range=YCbCr limited range
      <p>From your dri/state dump, Plane 43 is Esmart1.</p>
      <p>Cluster1, Esmart1, Smart1 are special on rk3566, they are</p>
      <p>mirror window of Cluster0, Esmart0, Esmart0. That means</p>
      <p>the software can't program  a independent framebuffer for</p>
      <p>these three windows. They can only share the fb address set</p>
      <p>in Cluster0, Esmart0, Smart0.</p>
      <p>For rk3566, we only use it for two VP display same content:</p>
      <p>assign Cluster0,Esmart0,Smart0 to VP1 for primary
        display(MIPI),</p>
      <p>assign Cluster1,Esmart1, Smart1 to VP0 for extend display(HDMI)</p>
      <p>we handle this logic in Android hwc:</p>
      <p>When a hdmi is connected, hwc will commit Esmart1 with Esmart0
        with the <br>
      </p>
      <p>same fb and src buffer size, the dst can be different(by window
        scale)</p>
      <p><br>
      </p>
      <p>I have code comment in my downstream kernel and explained this
        detail when Sascha start submit this serials.<br>
      </p>
      <blockquote type="cite"
        cite="mid:B7CD9D55-9F2D-42F4-9D04-17C6A5FEBB08@gmail.com">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">I have a scripts[0]  use io[1] command to dump the VOP2 register you can use it dump the register configuration when you meet a display failure,

then send the dump to me, maybe I can figure out something.

[0]<a class="moz-txt-link-freetext" href="https://github.com/andyshrk/buildroot/blob/2022/board/andyshrk/rootfs_overlay/usr/bin/vop2_dump.sh" moz-do-not-send="true">https://github.com/andyshrk/buildroot/blob/2022/board/andyshrk/rootfs_overlay/usr/bin/vop2_dump.sh</a>

[1] <a class="moz-txt-link-freetext" href="https://github.com/andyshrk/io" moz-do-not-send="true">https://github.com/andyshrk/io</a>
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Andy

Pls see <a class="moz-txt-link-freetext" href="https://pastebin.com/CHmu9s22" moz-do-not-send="true">https://pastebin.com/CHmu9s22</a></pre>
      </blockquote>
      <p><br>
      </p>
      <p>The dump is a little strange, I will check it in the later
        night.<br>
      </p>
    </blockquote>
    <p><br>
    </p>
    <p>Pls update the new vop2_dump.sh scripts from github. The</p>
    <p>previous scripts I gave you has some bug. sorry.<br>
    </p>
    <blockquote type="cite"
      cite="mid:622c8786-2c3f-13ff-66b7-ad9c8cb9425e@rock-chips.com">
      <p> </p>
      <blockquote type="cite"
        cite="mid:B7CD9D55-9F2D-42F4-9D04-17C6A5FEBB08@gmail.com">
        <pre class="moz-quote-pre" wrap="">I put dumps for following scenarios:

1.
-boot
-modetest -s 69@67:1920x1080 -&gt; ok
-modetest -P 43@67:1920x1080@NV12 -&gt; green screen


2.
-boot
-modetest -s 69@67:1920x1080 -&gt; ok
-modetest -P 49@67:1920x1080@NV12 -&gt; ok (but shifted horizontally by about 5% of screen width)
(setting palne#49 fixes plane #43. Here i set plane #49 but not yet setting #43)


3.
-boot
-modetest -s 69@67:1920x1080 -&gt; ok
-modetest -P 49@67:1920x1080@NV12 -&gt; ok (but shifted horizontally by about 5% of screen width)
-modetest -P 43@67:1920x1080@NV12 -&gt; now ok (but shifted horizontally by about 5% of screen width)

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------O5aaJrIyhY4HfQnryRXFxtI1--
