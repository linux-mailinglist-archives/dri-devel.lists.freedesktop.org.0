Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD23768F22
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 09:45:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B312C10E1B9;
	Mon, 31 Jul 2023 07:45:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F13D10E1B9;
 Mon, 31 Jul 2023 07:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:
 From:Subject:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=81DPN+aKi1y10RqzNcbArNMEekg5a7BNETkGF6f/fEc=; b=Bfs0BPtdFhbt7c2eJvr41Wqi3B
 VXTBaS6vaJWRYELohHM95VHSqgeebpdpirdPX3N4+SRir2ROCwhGZ6TZNH+mulDKXqfM4wDpCrWgQ
 S77GZALtQKfxFqeBiDxJa/SqI+rfp56PzOV0mIGOTzCHjvrf2MMEsIVMHHjtuTbtghfWs3mDPrLoV
 IxEBL5WlPlFHhIvkOWid6bCbOuM46U/dDvqy4ICVe4jFIfUB5i0j5v+JZvkfwHWJO9v16gEZStvno
 cvbxvtkIqbkWzHCbpJ+W1k1Zst2aqyWg7RaOsGDdRRfnPWR/6qjMD+Fj1LjVO6j4+d6YI7q4ZKMcj
 zuAEN9+g==;
Received: from ip173.dynamic.igalia.com ([192.168.10.173])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qQNTj-007Kp5-6Y; Mon, 31 Jul 2023 09:38:07 +0200
Message-ID: <ef84ccedbf880c8605688f26ebedc04046c1dd78.camel@igalia.com>
Subject: Re: [PATCH v10] drm: Add initial ci/ subdirectory
From: "Juan A." =?ISO-8859-1?Q?Su=E1rez?= <jasuarez@igalia.com>
To: David Heidelberg <david.heidelberg@collabora.com>, Maira Canal
 <mcanal@igalia.com>, Helen Koike <helen.koike@collabora.com>, 
 dri-devel@lists.freedesktop.org, eric@igalia.com
Date: Mon, 31 Jul 2023 09:38:06 +0200
In-Reply-To: <ad029e1c-8f00-9f5e-e25a-957b3f70c385@collabora.com>
References: <20230720152737.102382-1-helen.koike@collabora.com>
 <52d1d9e5-00c8-2260-57fc-310cc2f712fd@igalia.com>
 <ad029e1c-8f00-9f5e-e25a-957b3f70c385@collabora.com>
Content-Type: multipart/alternative; boundary="=-xo+HgqGXfymsdIAN40aZ"
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 31 Jul 2023 07:45:29 +0000
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
Cc: emma@anholt.net, linux-doc@vger.kernel.org, jbrunet@baylibre.com,
 robdclark@google.com, corbet@lwn.net, khilman@baylibre.com,
 sergi.blanch.torne@collabora.com, gustavo.padovan@collabora.com,
 linux-rockchip@lists.infradead.org, daniels@collabora.com,
 martin.blumenstingl@googlemail.com, robclark@freedesktop.org,
 anholt@google.com, linux-mediatek@lists.infradead.org, mripard@kernel.org,
 matthias.bgg@gmail.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 neil.armstrong@linaro.org, guilherme.gallo@collabora.com,
 linux-kernel@vger.kernel.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--=-xo+HgqGXfymsdIAN40aZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2023-07-29 at 12:08 +0300, David Heidelberg wrote:
> Hello Maira,
>=20
> Regarding the second question about V3D and V3DV: in the Mesa3D CI,
> we=20
> currently use downstream kernels, so we don't build the kernel for=20
> Raspberry Pi.
>=20
>=20
>=20

BM_BOOTFS option can point to a link tarball containing an alternative
kernel to use instead of downstream one.

The only drawback is that this tarball must be an already compiled
kernel; it won't compile it.

> However, I've been thinking about the possibility of adding an
> override=20
> for the kernel from an external source to our CI. This way, we can
> also=20
> test with a provided kernel and override the default option of using
> the=20
> downstream kernel on Raspberry Pi.
>=20
> If we proceed with this, it would be sensible to include V3D* options
> in=20
> our kernel builds.
>=20
> I'm including Juan and Eric for their input on this topic.
>=20
>=20

The idea sounds great. Aren't we already compiling kernels for other
hardware? Maybe we can include specific versions for Rpi.

=20
 J.A.


--=-xo+HgqGXfymsdIAN40aZ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head><style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head><body><div>On Sat, 2023-07-29 at 12:08 +0300, David Heidelbe=
rg wrote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border=
-left:2px #729fcf solid;padding-left:1ex"><div class=3D"part-container pre =
-e-web-view-background-color -e-web-view-text-color" style=3D"border: none;=
 padding: 0; margin: 0;">Hello Maira,<br><br>Regarding the second question =
about V3D and V3DV: in the Mesa3D CI, we <br>currently use downstream kerne=
ls, so we don't build the kernel for <br>Raspberry Pi.<br><br><br><br></div=
></blockquote><div><br></div><div>BM_BOOTFS option can point to a link tarb=
all containing an alternative kernel to use instead of downstream one.</div=
><div><br></div><div>The only drawback is that this tarball must be an alre=
ady compiled kernel; it won't compile it.</div><div><br></div><blockquote t=
ype=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padd=
ing-left:1ex"><div class=3D"part-container pre -e-web-view-background-color=
 -e-web-view-text-color" style=3D"border: none; padding: 0; margin: 0;">How=
ever, I've been thinking about the possibility of adding an override <br>fo=
r the kernel from an external source to our CI. This way, we can also <br>t=
est with a provided kernel and override the default option of using the <br=
>downstream kernel on Raspberry Pi.<br><br>If we proceed with this, it woul=
d be sensible to include V3D* options in <br>our kernel builds.<br><br>I'm =
including Juan and Eric for their input on this topic.<br><br><br></div></b=
lockquote><div><br></div><div>The idea sounds great. Aren't we already comp=
iling kernels for other hardware? Maybe we can include specific versions fo=
r Rpi.</div><div><br></div><div><span class=3D"Apple-tab-span" style=3D"whi=
te-space:pre">	</span></div><div><span class=3D"Apple-tab-span" style=3D"wh=
ite-space:pre">	</span>J.A.</div><div><br></div><div><span></span></div></b=
ody></html>

--=-xo+HgqGXfymsdIAN40aZ--
