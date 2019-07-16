Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 646F66AD4E
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 19:03:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41CEE6E154;
	Tue, 16 Jul 2019 17:03:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from anholt.net (anholt.net [50.246.234.109])
 by gabe.freedesktop.org (Postfix) with ESMTP id AA2ED6E154
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 17:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id 662E110A2C47;
 Tue, 16 Jul 2019 10:03:42 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at anholt.net
Received: from anholt.net ([127.0.0.1])
 by localhost (kingsolver.anholt.net [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id Vg4aWRwCekfW; Tue, 16 Jul 2019 10:03:41 -0700 (PDT)
Received: from eliezer.anholt.net (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id 473EF10A264A;
 Tue, 16 Jul 2019 10:03:41 -0700 (PDT)
Received: by eliezer.anholt.net (Postfix, from userid 1000)
 id 436DA2FE2547; Tue, 16 Jul 2019 10:03:42 -0700 (PDT)
From: Eric Anholt <eric@anholt.net>
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 0/19] drm: drop use of drmp.h in drm-misc
In-Reply-To: <20190716064220.18157-1-sam@ravnborg.org>
References: <20190716064220.18157-1-sam@ravnborg.org>
User-Agent: Notmuch/0.22.2+1~gb0bcfaa (http://notmuchmail.org) Emacs/26.1
 (x86_64-pc-linux-gnu)
Date: Tue, 16 Jul 2019 10:03:41 -0700
Message-ID: <87muhd6hea.fsf@anholt.net>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============0429410755=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0429410755==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Sam Ravnborg <sam@ravnborg.org> writes:

> This patch set removes a far share of the remaining uses of drmP.h.
> Common for all patches are that the respective files are maintained
> in drm-misc.
> All patches are independent.

For v3d, vc4, pl111:

Reviewed-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAl0uA24ACgkQtdYpNtH8
nujvhA//QNua9OXNRMHYRca87udRhwv3kfpv8J+A5x8AXGwXuDdx07BBmtoz176a
qEBjdSgbSSgrhdPdSKYnhiODA5rhZo6nIFI/Ue7JZk2HzcTgLazYnKzo3rwT28mT
jyg//MEy6V+/rVFl+iZxE8XNj0yQS5ANAWGSAj/K8CkbJoVlS0PwjJ4s3nOD47nF
Qp1NQPaEA5AyB4UZDQpIDk4Zm07RbsPYlrDgAT92DNDKMrbke+K6SLe3pz2t++Qs
e9IAwL2YezlDHLyVzfVpfUd3bEAfNBT/lPtxEK3Ex2QdSeVNrhTSJeK+BXrFhG6N
SU9OnDDdqbjxKiRP5rqjaJlYyPejhQDvB+J95FzAANkoQ/E/zZyhI1STLe3Za1hl
RNtVJ2DQPktKVwIXMXIcO9wBymvYYeLApqJzEo2kBWj/ni3YrmlBth5gLM4pSl6H
9JiUY/zKsJSOW5YYiriFvis4K7JlI24V3P5ULGN99DmwFPL3UT/fLy4jRtss6SLL
BvlmU3ve2gPSe0Ib6rg926stGYFTWqmN8akyiH27BDUFv/snphu1piJv9sLIyvnx
vyA+UM9CVt4IC3v7cUovKOGmX0x72sv+npdOgUVGM6iIqIAI4Hv/7TG6BWILKcm4
71VaYDn3rRrt0HOra1lUJbTESDZtooZte9hU64xfpRXh6M4C/vc=
=SiuG
-----END PGP SIGNATURE-----
--=-=-=--

--===============0429410755==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0429410755==--
