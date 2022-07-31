Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BCF585CD3
	for <lists+dri-devel@lfdr.de>; Sun, 31 Jul 2022 03:49:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A8C10E08D;
	Sun, 31 Jul 2022 01:49:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 237BC10E08D
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jul 2022 01:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1659232178;
 bh=6f17EIBtF+jK2QegrgLjeSqN3VbaO1n55M2KEyluX7c=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=WhvBN298NaqZcFeY7jennR8xNod9JPgTQYaKB7EInA5y/wN5+rxbgzCFeufY1TVYH
 199SsUh+uMC422sknNdCyRQijvqWkaCwM3B870Tb6XGTae+Fb59p1DSWg7ho+SBL/T
 eKnsbC59aLaklxV10/sVHZYvNwL58Sh2zqNPmjQ4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [68.251.140.185] ([68.251.140.185]) by web-mail.gmx.net
 (3c-app-mailcom-bs13.server.lan [172.19.170.181]) (via HTTP); Sun, 31 Jul
 2022 03:49:38 +0200
MIME-Version: 1.0
Message-ID: <trinity-e13df8a2-fa37-4234-8787-8e57ce0d0881-1659232178771@3c-app-mailcom-bs13>
From: Kevin Brace <kevinbrace@gmx.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 30/32] drm/via: Add Kconfig
Content-Type: text/plain; charset=UTF-8
Date: Sun, 31 Jul 2022 03:49:38 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <af72d22c-323d-abb9-dd77-b8b5eda4d7df@suse.de>
References: <20220725235359.20516-1-kevinbrace@gmx.com>
 <20220725235359.20516-11-kevinbrace@gmx.com>
 <af72d22c-323d-abb9-dd77-b8b5eda4d7df@suse.de>
Content-Transfer-Encoding: quoted-printable
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:PR2vVodM8G1TIEvvFqUysGw5yD51qHlgPc4Eu2eH1Gpq0sjxke13TtjtT8btLpDg8Hm4h
 ob0WO7SbZingth6FY4t7XsdzFsBoulzrDta4v0YUiX3Su9dW5C05H8WFflaPIAXmen/k/NjKgn1f
 UnLOmwuUVHACW+x5P1VKR/InB0UwfMEaX9DPJq0EKIzKQ1+NAEEtVJvFfqW0UKS3XwJfxu5sPNeY
 4UoJpDYkDnjCZIIEdYG6aCrcOPr37qlTlFOr0/U+YzVkgrMPDmp6MjQRnxBZTOcbrl5yZRoQPCc9
 0U=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:x5YvEvyD6Q4=:wO/t6Qr0O/gQdfTiqG/l9O
 nQivWTAVKzPMvqEDZH9HXkmpdJdWVfIgsij7ViPZoa1Mh67Ta4SYDOjFvRBbKzlZ+ft9nXXB5
 TCDqkB2gpkLGQ6mRZRC3rGPN4DT0umheoBowuCMjUWpSFV1frha2cLZvnEuXxFXFWDfbBeVt2
 aOftavoopU+6zlj8yHNZKXi25hsi8OX/HjP1IIaxOnGXn4aQJnOJ+0x/NRGz9V25sGVgUGXdf
 jY4xZuLP/ppgrL5iUo7D0bmzleFiSIIn+pichWMKx3dh/iN5O7XmqkwNnmsdQwlQ8zO0llbxK
 E8l+EkmNhqbPRUITPpb0KsLhrNb/9S1o2qTGMJy6WPuXk7isVokyjbSSzNY5M4vTAAOJhj/wy
 jWvzzkgh6FnFdU5oA05bvClivac5b01jGufwKAHv9K6pts7xDHmv1HCPezyyD90qs99hV3hpG
 PnT2jiNwri91ghPtVpFdGTvvH41giwcWBbGdQBXwKqQ4kJS+seXbmNKhL9wJAOvHs9bB/9P4L
 SQCJ93k39On/FozNu++DP8uv6c3INRBqcXy6RFnAYV5vVqS9yKszRVZo+jg09olidst8kk6Tt
 3ZxeCqMf7FTqATLe7LgmFo4f6490tAfNn9HG+B18M0dbBoVQ+ZmtAPwa810CoSKZJ9ffH8Vjr
 KlR1Jd9WFCmxmmxnr+N4JMufPE2mIXIKqgEDR7fup8Q3KgqgjD8XpRWM2zl8kXXDNtpY05zuZ
 sXqZpMFYbFz2kUMUpLvUVTBkNqj8OpTaKq1sMkDPq4tqbuXW4JivQvzcwbwxGt4rywIJ1bnKj
 Gj06H4x
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

In general, I am okay with the idea of keeping DRI1 based VIA DRM for now=
=2E
Personally, I am not that interested in keeping it, but I am not against k=
eeping it, either=2E
Coming up with a scheme to keep the DRI1 based VIA DRM is sort of beyond m=
y skill level,  so I am glad you and Sam came up with a scheme to keep it=
=2E
I think we will reuse this scheme when I finally have the time to get arou=
nd adding KMS support to other similar legacy DRI1 based DRM modules=2E

Regards,

Kevin Brace
Brace Computer Laboratory blog
https://bracecomputerlab=2Ecom


> Sent: Tuesday, July 26, 2022 at 12:28 AM
> From: "Thomas Zimmermann" <tzimmermann@suse=2Ede>
> To: "Kevin Brace" <kevinbrace@gmx=2Ecom>, dri-devel@lists=2Efreedesktop=
=2Eorg
> Cc: "Kevin Brace" <kevinbrace@bracecomputerlab=2Ecom>
> Subject: Re: [PATCH v3 30/32] drm/via: Add Kconfig
>
> Hi
>=20
> Am 26=2E07=2E22 um 01:53 schrieb Kevin Brace:
> > From: Kevin Brace <kevinbrace@bracecomputerlab=2Ecom>
> >=20
> > Signed-off-by: Kevin Brace <kevinbrace@bracecomputerlab=2Ecom>
> > ---
> >   drivers/gpu/drm/via/Kconfig | 9 +++++++++
> >   1 file changed, 9 insertions(+)
> >   create mode 100644 drivers/gpu/drm/via/Kconfig
> >=20
> > diff --git a/drivers/gpu/drm/via/Kconfig b/drivers/gpu/drm/via/Kconfig
> > new file mode 100644
> > index 000000000000=2E=2E7c4656a1d473
> > --- /dev/null
> > +++ b/drivers/gpu/drm/via/Kconfig
> > @@ -0,0 +1,9 @@
> > +config DRM_OPENCHROME
>=20
> I would keep the driver option named DRM_VIA, as it has been so far=2E T=
o=20
> build the existing DRI1 driver, rather introduce a new config symbol=20
> that enables it=2E The rule looks something like this:
>=20
>    config DRM_VIA_DRI1
>    boolean "DRI1 support"
>      depends on DRM_VIA && DRM_LEGACY
>      help
>        Build for DRI1-based userspace drivers=2E
>=20
> It will show up as an option if the user selects both DRM_VIA and=20
> DRM_LEGACY=2E
>=20
> Best regards
> Thomas
>=20
>=20
> > +	tristate "OpenChrome (VIA Technologies Chrome)"
> > +	depends on DRM && PCI && X86
> > +	select DRM_KMS_HELPER
> > +	select DRM_TTM
> > +	help
> > +	  Choose this option if you have VIA Technologies UniChrome or
> > +	  Chrome9 integrated graphics=2E If M is selected the module will
> > +	  be called via=2E
> > --
> > 2=2E35=2E1
> >=20
>=20
> --=20
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr=2E 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
>
