Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A128674947A
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 05:51:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EDBE10E3DB;
	Thu,  6 Jul 2023 03:51:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id AC4FF10E3DB
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 03:51:52 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Cx7+tVOqZkQ7gAAA--.2107S3;
 Thu, 06 Jul 2023 11:51:49 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxB81GOqZkm9IdAA--.16604S3; 
 Thu, 06 Jul 2023 11:51:47 +0800 (CST)
Content-Type: multipart/alternative;
 boundary="------------7JOnsxKoR9pbIeAJ1LzWvQ54"
Message-ID: <02dc5dde-d36e-ea95-da45-1f6a1b66898e@loongson.cn>
Date: Thu, 6 Jul 2023 11:51:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [32/39] drm: renesas: shmobile: Shutdown the display on remove
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <2c28c0a137854d39b6bc997a21bd6d2db1f7a0a5.1687423204.git.geert+renesas@glider.be>
 <903c71fb-61af-e12a-ca56-a49d4e930f9f@loongson.cn>
 <CAMuHMdXoZiDupub2zEFjOwTJFswEsJq62zVa_K-g6TWg+zS7-g@mail.gmail.com>
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <CAMuHMdXoZiDupub2zEFjOwTJFswEsJq62zVa_K-g6TWg+zS7-g@mail.gmail.com>
X-CM-TRANSID: AQAAf8BxB81GOqZkm9IdAA--.16604S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxWr15XryfXFWDXr4xGFW8Zrc_yoW5Xryfpa
 n7CFWUKr4YqanrtwnrCa10v3Wayw4Iy34SqrykK3y8ur45K3s7XayvgryfJFyUW3yj9w4Y
 qrsIy3W8uF1UArXCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnRJUUU9Kb4IE77IF4wAF
 F20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r
 1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAF
 wI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67
 AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r4UJwAaw2AFwI0_Jrv_JF1l
 e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAv7VC0I7IYx2
 IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
 Y48IcVAKI48JMx8GjcxK6IxK0xIIj40E5I8CrwCYjI0SjxkI62AI1cAE67vIY487MxAIw2
 8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I
 3I0E5I8CrVAFwI0_JrI_JrWlx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxV
 WUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8I
 cVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aV
 AFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuY
 vjxU7fHUDUUUU
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
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------7JOnsxKoR9pbIeAJ1LzWvQ54
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 2023/7/5 18:29, Geert Uytterhoeven wrote:
> Hi Sui,
>
> On Tue, Jun 27, 2023 at 4:57 PM Sui Jingfeng<suijingfeng@loongson.cn>  wrote:
>> On 2023/6/22 17:21, Geert Uytterhoeven wrote:
>>> When the device is unbound from the driver, the display may be active.
>>> Make sure it gets shut down.
>> would you mind to give a short description why this is necessary.
> That's a good comment.
> It turned out that this is not really necessary here, but to avoid a regression
> with "[PATCH 34/39] drm: renesas: shmobile: Atomic conversion part 1", where
> it is needed to call drm_atomic_helper_shutdown().
> As the comments for drm_atomic_helper_shutdown() says it is the
> atomic version of drm_helper_force_disable_all(), I figured I had to
> introduce a call to the latter first, before doing the atomic conversion.
>
> Does that make sense?


I'm just noticed that I'm actually ask a duplicated question.

I didn't notice Laurent's remark about this patch.


I'm actually agree with  Laurent that this function should be turned 
into drm_atomic_helper_shutdown() finally.

Yes, I do noticed that you replace this function with in [PATCH 34/39],

Originally, I thought this patch could possibly merged with the [PATCH 
34/39].

then, the net result of the merged two patch is equivalent to

adding drm_atomic_helper_shutdown() function only in the 
shmob_drm_remove() function.


I also realized that it is necessary that disable the CRTC when the 
driver going to leave.

Otherwise there are some plane resource still being referenced.


OK, I'm satisfy about you answer (if no other reviewers complains).

Thanks for you answer. :-)

>>> Signed-off-by: Geert Uytterhoeven<geert+renesas@glider.be>
>>> Reviewed-by: Laurent Pinchart<laurent.pinchart+renesas@ideasonboard.com>
>>> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
>>> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
>>> @@ -16,6 +16,7 @@
>>>    #include <linux/pm_runtime.h>
>>>    #include <linux/slab.h>
>>>
>>> +#include <drm/drm_crtc_helper.h>
>>>    #include <drm/drm_drv.h>
>>>    #include <drm/drm_fbdev_generic.h>
>>>    #include <drm/drm_gem_dma_helper.h>
>>> @@ -145,6 +146,7 @@ static int shmob_drm_remove(struct platform_device *pdev)
>>>        struct drm_device *ddev = &sdev->ddev;
>>>
>>>        drm_dev_unregister(ddev);
>>> +     drm_helper_force_disable_all(ddev);
>> Is it that the DRM core recommend us to use
>> drm_atomic_helper_disable_all() ?
> Well, drm_atomic_helper_shutdown() is a convenience wrapper
> around drm_atomic_helper_disable_all()... But we can't call any
> atomic helpers yet, before the conversion to atomic modesetting.
>
>>>        drm_kms_helper_poll_fini(ddev);
>>>        return 0;
>>>    }
> Gr{oetje,eeting}s,
>
>                          Geert
>
--------------7JOnsxKoR9pbIeAJ1LzWvQ54
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi,<br>
    </p>
    <div class="moz-cite-prefix">On 2023/7/5 18:29, Geert Uytterhoeven
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAMuHMdXoZiDupub2zEFjOwTJFswEsJq62zVa_K-g6TWg+zS7-g@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">Hi Sui,

On Tue, Jun 27, 2023 at 4:57 PM Sui Jingfeng <a class="moz-txt-link-rfc2396E" href="mailto:suijingfeng@loongson.cn">&lt;suijingfeng@loongson.cn&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 2023/6/22 17:21, Geert Uytterhoeven wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">When the device is unbound from the driver, the display may be active.
Make sure it gets shut down.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
would you mind to give a short description why this is necessary.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
That's a good comment.
It turned out that this is not really necessary here, but to avoid a regression
with "[PATCH 34/39] drm: renesas: shmobile: Atomic conversion part 1", where
it is needed to call drm_atomic_helper_shutdown().
As the comments for drm_atomic_helper_shutdown() says it is the
atomic version of drm_helper_force_disable_all(), I figured I had to
introduce a call to the latter first, before doing the atomic conversion.

Does that make sense?
</pre>
    </blockquote>
    <p><br>
    </p>
    <p>I'm just noticed that I'm actually ask a duplicated question.</p>
    <p>I didn't notice Laurent's remark about this patch.</p>
    <p><br>
    </p>
    <p>I'm actually agree with  Laurent that this function should be
      turned into drm_atomic_helper_shutdown() finally.</p>
    <p>Yes, I do noticed that you replace this function with in [PATCH
      34/39],</p>
    <p>Originally, I thought this patch could possibly merged with the
      [PATCH 34/39].  <br>
    </p>
    <p>then, the net result of the merged two patch is equivalent to<br>
    </p>
    <p>adding <span class="p_add">drm_atomic_helper_shutdown() function
      </span><span class="p_add">only in the </span><span
        class="p_context">shmob_drm_remove() function.<br>
      </span></p>
    <p><span class="p_add"></span></p>
    <p><br>
    </p>
    <p>I also realized that it is necessary that disable the CRTC when
      the driver going to leave.</p>
    <p>Otherwise there are some plane resource still being referenced.</p>
    <p><br>
    </p>
    <p>OK, I'm satisfy about you answer (if no other reviewers
      complains).</p>
    <p>Thanks for you answer. :-)<br>
    </p>
    <blockquote type="cite"
cite="mid:CAMuHMdXoZiDupub2zEFjOwTJFswEsJq62zVa_K-g6TWg+zS7-g@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Signed-off-by: Geert Uytterhoeven <a class="moz-txt-link-rfc2396E" href="mailto:geert+renesas@glider.be">&lt;geert+renesas@glider.be&gt;</a>
Reviewed-by: Laurent Pinchart <a class="moz-txt-link-rfc2396E" href="mailto:laurent.pinchart+renesas@ideasonboard.com">&lt;laurent.pinchart+renesas@ideasonboard.com&gt;</a>
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
@@ -16,6 +16,7 @@
  #include &lt;linux/pm_runtime.h&gt;
  #include &lt;linux/slab.h&gt;

+#include &lt;drm/drm_crtc_helper.h&gt;
  #include &lt;drm/drm_drv.h&gt;
  #include &lt;drm/drm_fbdev_generic.h&gt;
  #include &lt;drm/drm_gem_dma_helper.h&gt;
@@ -145,6 +146,7 @@ static int shmob_drm_remove(struct platform_device *pdev)
      struct drm_device *ddev = &amp;sdev-&gt;ddev;

      drm_dev_unregister(ddev);
+     drm_helper_force_disable_all(ddev);
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Is it that the DRM core recommend us to use
drm_atomic_helper_disable_all() ?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Well, drm_atomic_helper_shutdown() is a convenience wrapper
around drm_atomic_helper_disable_all()... But we can't call any
atomic helpers yet, before the conversion to atomic modesetting.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">      drm_kms_helper_poll_fini(ddev);
      return 0;
  }
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Gr{oetje,eeting}s,

                        Geert

</pre>
    </blockquote>
  </body>
</html>

--------------7JOnsxKoR9pbIeAJ1LzWvQ54--

