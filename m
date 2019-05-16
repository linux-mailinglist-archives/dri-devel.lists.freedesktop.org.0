Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B5F20D2A
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 18:38:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5082889739;
	Thu, 16 May 2019 16:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from anholt.net (anholt.net [50.246.234.109])
 by gabe.freedesktop.org (Postfix) with ESMTP id 029F989739
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 16:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id A081410A350A;
 Thu, 16 May 2019 09:38:11 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at anholt.net
Received: from anholt.net ([127.0.0.1])
 by localhost (kingsolver.anholt.net [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id VhfMX84sJkmL; Thu, 16 May 2019 09:38:06 -0700 (PDT)
Received: from eliezer.anholt.net (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id 4CAAF10A2E28;
 Thu, 16 May 2019 09:38:06 -0700 (PDT)
Received: by eliezer.anholt.net (Postfix, from userid 1000)
 id CDEFB2FE3AAE; Thu, 16 May 2019 11:38:05 -0500 (CDT)
From: Eric Anholt <eric@anholt.net>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/2 v2] drm/doc: Allow new UAPI to be used once it's in
 drm-next/drm-misc-next.
In-Reply-To: <20190425063321.GX9857@phenom.ffwll.local>
References: <CAPM=9tw59Z7FRM-7-_VChOO__1+ahNhSs6=AceV7biasHjWKqg@mail.gmail.com>
 <20190424220638.16222-1-eric@anholt.net>
 <20190425063321.GX9857@phenom.ffwll.local>
User-Agent: Notmuch/0.22.2+1~gb0bcfaa (http://notmuchmail.org) Emacs/26.1
 (x86_64-pc-linux-gnu)
Date: Thu, 16 May 2019 09:38:05 -0700
Message-ID: <87a7fmbbiq.fsf@anholt.net>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1862910288=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1862910288==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Daniel Vetter <daniel@ffwll.ch> writes:

> On Wed, Apr 24, 2019 at 03:06:38PM -0700, Eric Anholt wrote:
>> I was trying to figure out if it was permissible to merge the Mesa
>> side of V3D's CSD support yet while it's in drm-misc-next but not
>> drm-next, and developers on #dri-devel IRC had differing opinions of
>> what the requirement was.
>>=20
>> v2: Restrict to just drm-next or drm-misc-next on airlied's request.
>
> Personally I think that's a bit too strict (if people want to screw up,
> they will be able to anyway). But since I'm all for clearer rules where
> possible, this has my support too.
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Pushed to drm-misc-next now.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlzdke0ACgkQtdYpNtH8
nugh7w/+IyOEhis/Dfl16n2fKwUlAI1I3r3DkieaEiz4V67J5fTEES10zML0NyrQ
GeyxPI6J02dTH4MPTNmwdYMfh82Bz1lBT+e9gcOKH4PkGkNpFKjPG+IgIcf+8caD
UFnBiG40Cc+SbY7mEklfDzDk5cPqe6QJ0qrddqmikhppwdePcIDzGYq40u36eKDG
g+3YfRrUoCNk4FtpvH+bSGThM7WF6QnCAYPjl5BP3l9xpjpIbsbexxf8wCjQhjgF
B5gnV+wF5f9c0xp8d4pu1zRk9TnWl0MWmD1C4eVgkZBIKZdRXTkCit9k7BJP2LQg
TGpCGT7mofT6WEYdYbiI4T09KQJ8zaA10QUg6o+26O4KTq2jr2nb76msR/h4Ohsw
9mkEScezW0ryFSDLP2tVgIUfT/pN5uv+ypzUTF6Qj9YhXLmQ6jxRGoXcICEadRyT
E7MYJ5mFvmnqAjpWYYuw7SMrPWoaiCVyxO0gO8zwynJqPFCzTdHcpq3SPYAhXMW7
L1ZHfzDXFuzfxhCKlLZC0OGrhqViX/vJk1MevBGvp38yqabfQJ2MtJLqns4KaG/C
DyIQjhiRiMksX8TkhymV6ZNe6SN41sffw78SHV2dcrQlHBNPrBmTmPfO+LQ8h2JU
F+/LmjbjuIdrTjlurpm2LXtjkvwQb/5hrkaHJwqL9SIu0QrZveY=
=DceZ
-----END PGP SIGNATURE-----
--=-=-=--

--===============1862910288==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1862910288==--
