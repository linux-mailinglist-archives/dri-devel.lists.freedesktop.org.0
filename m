Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0983C58A726
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 09:32:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC4CB1F9A;
	Fri,  5 Aug 2022 07:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA3D8B3A82
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Aug 2022 07:15:43 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-10ee900cce0so2089539fac.5
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Aug 2022 00:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=rBfg03r6Oz80zycU9nYxPKDZqyu0flWu34xyfSsV/xQ=;
 b=agzV17pAjdU+TvhMumx74BNB+0vNi/7ZJAraV8hNOxgMs/r346zI0A7p2FYhs9PXEM
 /6hk7jXE7DFH7HxqTu+kHZcXKO9dU39UbPqgy3VG6rbpMQKUUVTry0UQJgOrlkd2u9P4
 pflB1Ipb41B2SwiUI3JRlCnC4h0RtCGNSJohk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=rBfg03r6Oz80zycU9nYxPKDZqyu0flWu34xyfSsV/xQ=;
 b=iIoEk+WECOEGjULwit4KGpaw9cFvQnd6A/xLBUJzj2VeenQ8DXbthrCcxavS5VARRR
 bcl19b/wVCOMQHVxzUHqMiTf3c32/A1eWmN8kFTPRWDHRHIYc2BBnxXQED80bi+xUUMp
 Nwfjigzla2JxgkNkD8Vr0OdvszDHfg1EgfCU9yqUMelMrWsa8yHILb3PHxA38fbEnUO5
 GaY5kWqy3RDhlepxWYAtqE1oNea75uZFSyh22QCFvhzuSOx/kpxSlpPt6+quJCLZfyX3
 6PVvH1nbUpAJp4dPBvKyVJYeJvzfW+HFh8yRs8z+6HSsG4HWSJvnmNQFa6JVd9+lodff
 ektg==
X-Gm-Message-State: ACgBeo0BD0wXCem3S9fPe4Ei1WbShNyrol3dXF7cdUIz1ipdwbBxD6aH
 bfHZqLxEwC8Wy87A/N35MTUyTmP4a0CpPpvFtP8LrQ==
X-Google-Smtp-Source: AA6agR7M44AVBZXjQnaVRf4WnwPJtVsbSPUm+3MQr8ivnT6nIulYI9+j+w7X1TuNrrWa+rq7oL7pb8NTM7iDNa+jgoc=
X-Received: by 2002:a05:6870:6015:b0:fe:340e:e854 with SMTP id
 t21-20020a056870601500b000fe340ee854mr2599009oaa.52.1659683743023; Fri, 05
 Aug 2022 00:15:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220711095721.1935377-1-sunil@amarulasolutions.com>
In-Reply-To: <20220711095721.1935377-1-sunil@amarulasolutions.com>
From: Suniel Mahesh <sunil@amarulasolutions.com>
Date: Fri, 5 Aug 2022 12:45:31 +0530
Message-ID: <CAM+7aWvbcV3m7PGRTudJSvRnrWt_zqOi2VhRQzOWmcOVDqAOmQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Add R16 Vista E board from RenewWorldOutreach
To: Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Maxime Ripard <maxime.ripard@free-electrons.com>, 
 Christopher Vollo <chris@renewoutreach.org>,
 Michael Trimarchi <michael@amarulasolutions.com>, 
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: multipart/alternative; boundary="000000000000f15bc305e5793b2d"
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000f15bc305e5793b2d
Content-Type: text/plain; charset="UTF-8"

Hi all,

Can you guys please review and comment for any changes.

Regards
Suniel

On Mon, Jul 11, 2022 at 3:27 PM Suniel Mahesh <sunil@amarulasolutions.com>
wrote:

> This patch series adds the R16-Vista-E board from RenewWorldOutreach based
> on allwinner R16(A33).
>
> Patch 1/2 adds the dt-bindings for the board.
>
> Patch 2/2 adds the board with the following below features:
>
> General features:
> - 1GB RAM
> - microSD slot
> - Realtek Wifi
> - 1 x USB 2.0
> - HDMI IN
> - HDMI OUT
> - Audio out
> - MIPI DSI
> - TI DLPC3433
>
> It has also connectors to connect an external mini keypad.
>
> v2 patches can be found here:
>
> https://lore.kernel.org/all/20220615093900.344726-1-sunil@amarulasolutions.com/
>
> Suniel Mahesh (2):
>   dt-bindings: arm: sunxi: Add binding for RenewWorldOutReach
>     R16-Vista-E board
>   ARM: dts: sun8i: Add R16 Vista E board from RenewWorldOutreach
>
>  .../devicetree/bindings/arm/sunxi.yaml        |   6 +
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  arch/arm/boot/dts/Makefile                    |   1 +
>  arch/arm/boot/dts/sun8i-r16-renew-vista-e.dts | 362 ++++++++++++++++++
>  4 files changed, 371 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun8i-r16-renew-vista-e.dts
>
> --
> 2.25.1
>
>

--000000000000f15bc305e5793b2d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,</div><div><br></div><div>Can you guys please =
review and comment for any changes.</div><div><br></div><div>Regards</div><=
div>Suniel</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Mon, Jul 11, 2022 at 3:27 PM Suniel Mahesh &lt;<a href=3D"mail=
to:sunil@amarulasolutions.com">sunil@amarulasolutions.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">This patch series =
adds the R16-Vista-E board from RenewWorldOutreach based<br>
on allwinner R16(A33).<br>
<br>
Patch 1/2 adds the dt-bindings for the board.<br>
<br>
Patch 2/2 adds the board with the following below features:<br>
<br>
General features:<br>
- 1GB RAM<br>
- microSD slot<br>
- Realtek Wifi<br>
- 1 x USB 2.0<br>
- HDMI IN<br>
- HDMI OUT<br>
- Audio out<br>
- MIPI DSI<br>
- TI DLPC3433<br>
<br>
It has also connectors to connect an external mini keypad.<br>
<br>
v2 patches can be found here:<br>
<a href=3D"https://lore.kernel.org/all/20220615093900.344726-1-sunil@amarul=
asolutions.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.o=
rg/all/20220615093900.344726-1-sunil@amarulasolutions.com/</a><br>
<br>
Suniel Mahesh (2):<br>
=C2=A0 dt-bindings: arm: sunxi: Add binding for RenewWorldOutReach<br>
=C2=A0 =C2=A0 R16-Vista-E board<br>
=C2=A0 ARM: dts: sun8i: Add R16 Vista E board from RenewWorldOutreach<br>
<br>
=C2=A0.../devicetree/bindings/arm/sunxi.yaml=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A06 +<br>
=C2=A0.../devicetree/bindings/vendor-prefixes.yaml=C2=A0 |=C2=A0 =C2=A02 +<=
br>
=C2=A0arch/arm/boot/dts/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0arch/arm/boot/dts/sun8i-r16-renew-vista-e.dts | 362 +++++++++++++++++=
+<br>
=C2=A04 files changed, 371 insertions(+)<br>
=C2=A0create mode 100644 arch/arm/boot/dts/sun8i-r16-renew-vista-e.dts<br>
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--000000000000f15bc305e5793b2d--
