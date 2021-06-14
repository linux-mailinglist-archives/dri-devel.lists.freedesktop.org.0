Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FFD3A5DA8
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 09:25:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A695189A9F;
	Mon, 14 Jun 2021 07:25:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD5C89A9F
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 07:25:31 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id s14so9869205pfd.9
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 00:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=AMykhyDqQBbaHMiywFSB9ML+JDGa+EpZX1LNPgYY4Zc=;
 b=qj5JAnB588HOc2jwLQqrovr1XGhoYQv5RFkElZzigkYtxrUduAbxlPgoi9gVfdY02A
 ZR7+R1dCkIihxS4IuKuYveYt0vvMUCpCMrjXI+DOd2ywzwnBVwqGi3IroErjZuBmAzX+
 z0uQU/IRWcoPclJ6zpOsYyfSqYpD2SrlsUOQFm/ollqrUfsFjbDKfBVy1Hmitw+ns8Q/
 K/KxjPe90heu7U1QVO95XZVKtZTfBF7eMeWPypyYaNmlgNJU9emVDy+brsT6xFEuvnjx
 3jAy60Cey85rPhkokk2qTb5MZdIZfTQKJfcSySnWo3SNL2jpKWffiQfRJ4jqDZSQCNvn
 f14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=AMykhyDqQBbaHMiywFSB9ML+JDGa+EpZX1LNPgYY4Zc=;
 b=MNlfYqLRsLoVPiqXCIQDpC+NJTAkluC9gN6kXVaMVj3FP+BP1tfeiTRZynPY7NuS3+
 SYNo+aVMDPGRRTt6HcBoA0mOBPFnQto8BlPsUBDH95ho7yhYvoKBbLWlAufujCrukZQJ
 UloEfO08vpLQckT1628mopIW/Jd6LAaUuJazGZu53Spmg569abcugY+sjxNgrqNnq1mo
 9wQOV9fJ+LfMXrKeYxEO5ceB/BJjfk5Cz/Z7t2nnzEqN/vYvuER0fy9phQN4WMc+hXSy
 RaG4AE6Ajt2LbL2tSVopqX6diPH+88O2mpAEzaoquhx4PVxXLz1FebLOP03nNZwbboad
 2MaQ==
X-Gm-Message-State: AOAM531jZtqftSUv5aZoYfnff9XywuhpqNeiUA8dN9tdbG8YmlRdLHEk
 WUFwkC57/B8bcit+pukjTh/HBqcyfUYjLGM9Vp0=
X-Google-Smtp-Source: ABdhPJyp7zIxr65YJCOiZ6K/FwBFmlTWCutupU196eRa7Pb7taMb3Xn0YWA2wmKNWo+aR9YpwQk25tYu27sHw3v+2KU=
X-Received: by 2002:a63:79c3:: with SMTP id
 u186mr15720923pgc.203.1623655530978; 
 Mon, 14 Jun 2021 00:25:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:c002:0:0:0:0 with HTTP; Mon, 14 Jun 2021 00:25:30
 -0700 (PDT)
In-Reply-To: <20210613233041.128961-1-alexander.sverdlin@gmail.com>
References: <20210613233041.128961-1-alexander.sverdlin@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 14 Jun 2021 10:25:30 +0300
Message-ID: <CAHp75VdMxns2GJf6WGVY=tsv=dwf_f++q2-Chw0CJLp_R8n09A@mail.gmail.com>
Subject: Re: [PATCH 0/7] Prepare EP93xx drivers for Common Clock Framework
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000029634e05c4b4c34e"
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Nikita Shubin <nikita.shubin@maquefel.me>,
 Takashi Iwai <tiwai@suse.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000029634e05c4b4c34e
Content-Type: text/plain; charset="UTF-8"

On Monday, June 14, 2021, Alexander Sverdlin <alexander.sverdlin@gmail.com>
wrote:

> Nikita posted a patch converting EP93xx to use Common Clock Framework. It
> turns out some cleanup is necessary in the EP93xx drivers to avoid
> "Enabling unprepared" clock warnings.
>
> Patches with stack traces in the commit messages are tested on EP9302.
>
> Link: https://lore.kernel.org/patchwork/patch/1435884/
>
>
For all commit messages: please, reduce the noise in them as much as
possible, i.e. leave only up to ~3-4 most significant lines out of
trackbacks.



> Alexander Sverdlin (7):
>   iio: ep93xx: Prepare clock before using it
>   spi: spi-ep93xx: Prepare clock before using it
>   Input: ep93xx_keypad: Prepare clock before using it
>   video: ep93xx: Prepare clock before using it
>   dmaengine: ep93xx: Prepare clock before using it
>   ASoC: cirrus: i2s: Prepare clock before using it
>   pwm: ep93xx: Prepare clock before using it
>
>  drivers/dma/ep93xx_dma.c               |  6 +++---
>  drivers/iio/adc/ep93xx_adc.c           |  6 +++---
>  drivers/input/keyboard/ep93xx_keypad.c |  4 ++--
>  drivers/pwm/pwm-ep93xx.c               | 12 ++++++------
>  drivers/spi/spi-ep93xx.c               |  4 ++--
>  drivers/video/fbdev/ep93xx-fb.c        |  4 ++--
>  sound/soc/cirrus/ep93xx-i2s.c          | 12 ++++++------
>  7 files changed, 24 insertions(+), 24 deletions(-)
>
> --
> 2.32.0
>
>

-- 
With Best Regards,
Andy Shevchenko

--00000000000029634e05c4b4c34e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Monday, June 14, 2021, Alexander Sverdlin &lt;<a href=3D"mailto:=
alexander.sverdlin@gmail.com">alexander.sverdlin@gmail.com</a>&gt; wrote:<b=
r><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">Nikita posted a patch converting EP93xx to=
 use Common Clock Framework. It<br>
turns out some cleanup is necessary in the EP93xx drivers to avoid<br>
&quot;Enabling unprepared&quot; clock warnings.<br>
<br>
Patches with stack traces in the commit messages are tested on EP9302.<br>
<br>
Link: <a href=3D"https://lore.kernel.org/patchwork/patch/1435884/" target=
=3D"_blank">https://lore.kernel.org/<wbr>patchwork/patch/1435884/</a><br>
<br></blockquote><div><br></div><div>For all commit messages: please, reduc=
e the noise in them as much as possible, i.e. leave only up to ~3-4 most si=
gnificant lines out of trackbacks.</div><div><br></div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">
Alexander Sverdlin (7):<br>
=C2=A0 iio: ep93xx: Prepare clock before using it<br>
=C2=A0 spi: spi-ep93xx: Prepare clock before using it<br>
=C2=A0 Input: ep93xx_keypad: Prepare clock before using it<br>
=C2=A0 video: ep93xx: Prepare clock before using it<br>
=C2=A0 dmaengine: ep93xx: Prepare clock before using it<br>
=C2=A0 ASoC: cirrus: i2s: Prepare clock before using it<br>
=C2=A0 pwm: ep93xx: Prepare clock before using it<br>
<br>
=C2=A0drivers/dma/ep93xx_dma.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 6 +++---<br>
=C2=A0drivers/iio/adc/ep93xx_adc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 6 +++---<br>
=C2=A0drivers/input/keyboard/ep93xx_<wbr>keypad.c |=C2=A0 4 ++--<br>
=C2=A0drivers/pwm/pwm-ep93xx.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 12 ++++++------<br>
=C2=A0drivers/spi/spi-ep93xx.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 4 ++--<br>
=C2=A0drivers/video/fbdev/ep93xx-fb.<wbr>c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 4 ++--<br>
=C2=A0sound/soc/cirrus/ep93xx-i2s.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 12 =
++++++------<br>
=C2=A07 files changed, 24 insertions(+), 24 deletions(-)<br>
<br>
-- <br>
2.32.0<br>
<br>
</blockquote><br><br>-- <br>With Best Regards,<br>Andy Shevchenko<br><br><b=
r>

--00000000000029634e05c4b4c34e--
