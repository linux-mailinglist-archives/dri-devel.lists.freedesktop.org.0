Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7227285FEC
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 15:20:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A24206E8E3;
	Wed,  7 Oct 2020 13:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED52E6E8E3
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 13:20:08 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id s7so2549052qkh.11
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 06:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/np4hspTF4uRrPQFAp5epbpeDDbfr6nr1Fjnfh+crRw=;
 b=a5XExxZ062ug/+2TVBcAfi9Z1EL6dg+oXzNQASiwaNwzVcXPPXEbLiKVpHYapkFqNF
 q6avf2VqMJ8Qq7mdnQcLoQbR6pU4gtjwfQlLX9e9XKH8s1+5Os6HHMfKDWVYptc2XZXA
 2rjKbUcU+4MgyZBb1O4IxL12Si8QIx6w4YxiXxwt3rMlJ7ALLj0baHGJf58iu8Q5E3GF
 v9CU072OfT7KdOEtZ9VmN5zyxs04XlTQuO9SO/1eltJcuL7/WToYk+Fv+W4hHAYDpxJt
 /tYXeng9jAQ//Ks3VzzznczK1om42PeWyLJ3ghbq+yqQpa4NFnXnEzYhBFBraYAM9/Wj
 pImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/np4hspTF4uRrPQFAp5epbpeDDbfr6nr1Fjnfh+crRw=;
 b=VGntE6Lrjf31x0uGt8Tu0bRT30OJYhDVy8b8RZPO3omuitZA8MGiV2FED0aeSgghlR
 aTBli7BfqWGXIfi5JvLtJYTGsHfNcpoH6CbbZd0BN7uWj4RJ4XawO17Csiw6a55VsLGD
 piQyCXy0RRwf44HlktkDxRtaGdnlzqSYFQCpL5Rj4PpwZ5UbE4aZFt7OFbGgthk4+BW4
 uw6VxQYIEuyhoiEFLwpe9lUsZEi3dB/p1tjtH7G8GA/lM59fz1Zd0t/mOAZCGar2ZvFV
 KDmdv4eqk/QqV4d9BQd9/Ayq6quh4AJH84lFmD7xDAGHxP9zbILaPIkc/2lACbohCedz
 yjUQ==
X-Gm-Message-State: AOAM530dyW8hO6EgyxINRFgsLyTsjBzqz74zgPUiRUuvUS2JHY9SnVeu
 NcUyElnMfUYkDsHi0FOvZzQ=
X-Google-Smtp-Source: ABdhPJyIHtBlrQnNoPkuDTkprmfOkDF/GSRsvy5ka4Es1GG8Uu0XdLysCIqI2bfWhz/5yBQfdqhAzQ==
X-Received: by 2002:a37:9142:: with SMTP id t63mr2781275qkd.50.1602076807922; 
 Wed, 07 Oct 2020 06:20:07 -0700 (PDT)
Received: from smtp.gmail.com ([2607:fea8:56e0:6d60:fa59:ed82:d489:7fd1])
 by smtp.gmail.com with ESMTPSA id m10sm1508762qti.46.2020.10.07.06.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 06:20:06 -0700 (PDT)
Date: Wed, 7 Oct 2020 09:19:57 -0400
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Melissa Wen <melissa.srw@gmail.com>
Subject: Re: [PATCH v2] drm/vkms: update todo
Message-ID: <20201007131957.coywsclf5njbnmin@smtp.gmail.com>
References: <20201006223006.gu55pjtuaigkh6il@smtp.gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201006223006.gu55pjtuaigkh6il@smtp.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1134088524=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1134088524==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cojknnsds6ridqyr"
Content-Disposition: inline


--cojknnsds6ridqyr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 10/06, Melissa Wen wrote:
> Drop issues already resolved in vkms:
>=20
> - CRC API Improvements to [1] add igt test to check extreme alpha values
>   and [2] alpha blending;
> - [3] prime buffer sharing;
> - [4] writeback support;
>=20
> On the other hand, we also found or thought about other improvements since
> the last update of this document:
>=20
> - better support for IGT tests
> - improvements to writeback support
> - syzbot report
>=20
> Finally, we reorder items by the assumed complexity.
>=20
> [1] https://patchwork.freedesktop.org/series/55944/
> [2] https://patchwork.freedesktop.org/series/80823/
> [3] https://patchwork.freedesktop.org/series/63212/
> [4] https://patchwork.freedesktop.org/series/81177/
>=20
> v2:
> - Link to syzbot dashboard
>=20
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
>=20
> Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  Documentation/gpu/vkms.rst | 99 ++++++++++++++++++++------------------
>  1 file changed, 53 insertions(+), 46 deletions(-)
>=20
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index 61586fc861bb..50b30dea0ba8 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -10,36 +10,24 @@
>  TODO
>  =3D=3D=3D=3D
> =20
> -CRC API Improvements
> ---------------------
> -
> -- Optimize CRC computation ``compute_crc()`` and plane blending ``blend(=
)``
> -
> -- Use the alpha value to blend vaddr_src with vaddr_dst instead of
> -  overwriting it in ``blend()``.
> -
> -- Add igt test to check cleared alpha value for XRGB plane format.
> -
> -- Add igt test to check extreme alpha values i.e. fully opaque and fully
> -  transparent (intermediate values are affected by hw-specific rounding =
modes).
> -
> -Runtime Configuration
> ----------------------
> -
> -We want to be able to reconfigure vkms instance without having to reload=
 the
> -module. Use/Test-cases:
> -
> -- Hotplug/hotremove connectors on the fly (to be able to test DP MST han=
dling of
> -  compositors).
> +If you want to do any of the items listed below, please share your inter=
est
> +with one of the VKMS maintainers.

Hi Melissa,

How about change "one of the VKMS maintainers" to "with VKMS
maintainers".

With the above change, everything else LGTM.

Reviewed-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
 =20
> -- Configure planes/crtcs/connectors (we'd need some code to have more th=
an 1 of
> -  them first).
> +IGT better support
> +------------------
> =20
> -- Change output configuration: Plug/unplug screens, change EDID, allow c=
hanging
> -  the refresh rate.
> +- Investigate: (1) test cases on kms_plane that are failing due to timeo=
ut on
> +  capturing CRC; (2) when running kms_flip test cases in sequence, some
> +  successful individual test cases are failing randomly.
> =20
> -The currently proposed solution is to expose vkms configuration through
> -configfs.  All existing module options should be supported through confi=
gfs too.
> +- VKMS already has support for vblanks simulated via hrtimers, which can=
 be
> +  tested with kms_flip test; in some way, we can say that VKMS already m=
imics
> +  the real hardware vblank. However, we also have virtual hardware that =
does
> +  not support vblank interrupt and completes page_flip events right away=
; in
> +  this case, compositor developers may end up creating a busy loop on vi=
rtual
> +  hardware. It would be useful to support Virtual Hardware behavior in V=
KMS
> +  because this can help compositor developers to test their features in
> +  multiple scenarios.
> =20
>  Add Plane Features
>  ------------------
> @@ -55,34 +43,50 @@ There's lots of plane features we could add support f=
or:
>  - Additional buffer formats, especially YUV formats for video like NV12.
>    Low/high bpp RGB formats would also be interesting.
> =20
> -- Async updates (currently only possible on cursor plane using the legac=
y cursor
> -  api).
> +- Async updates (currently only possible on cursor plane using the legacy
> +  cursor api).
> +
> +For all of these, we also want to review the igt test coverage and make =
sure
> +all relevant igt testcases work on vkms.
> +
> +Prime Buffer Sharing
> +--------------------
> =20
> -For all of these, we also want to review the igt test coverage and make =
sure all
> -relevant igt testcases work on vkms.
> +- Syzbot report - WARNING in vkms_gem_free_object:
> +  https://syzkaller.appspot.com/bug?extid=3De7ad70d406e74d8fc9d0
> +
> +Runtime Configuration
> +---------------------
> +
> +We want to be able to reconfigure vkms instance without having to reload=
 the
> +module. Use/Test-cases:
> +
> +- Hotplug/hotremove connectors on the fly (to be able to test DP MST han=
dling
> +  of compositors).
> +
> +- Configure planes/crtcs/connectors (we'd need some code to have more th=
an 1 of
> +  them first).
> +
> +- Change output configuration: Plug/unplug screens, change EDID, allow c=
hanging
> +  the refresh rate.
> +
> +The currently proposed solution is to expose vkms configuration through
> +configfs.  All existing module options should be supported through confi=
gfs
> +too.
> =20
>  Writeback support
>  -----------------
> =20
> -Currently vkms only computes a CRC for each frame. Once we have addition=
al plane
> -features, we could write back the entire composited frame, and expose it=
 as:
> +- The writeback and CRC capture operations share the use of composer_ena=
bled
> +  boolean to ensure vblanks. Probably, when these operations work togeth=
er,
> +  composer_enabled needs to refcounting the composer state to proper wor=
k.
> =20
> -- Writeback connector. This is useful for testing compositors if you don=
't have
> -  hardware with writeback support.
> +- Add support for cloned writeback outputs and related test cases using a
> +  cloned output in the IGT kms_writeback.
> =20
>  - As a v4l device. This is useful for debugging compositors on special v=
kms
>    configurations, so that developers see what's really going on.
> =20
> -Prime Buffer Sharing
> ---------------------
> -
> -We already have vgem, which is a gem driver for testing rendering, simil=
ar to
> -how vkms is for testing the modeset side. Adding buffer sharing support =
to vkms
> -allows us to test them together, to test synchronization and lots of oth=
er
> -features. Also, this allows compositors to test whether they work correc=
tly on
> -SoC chips, where the display and rendering is very often split between 2
> -drivers.
> -
>  Output Features
>  ---------------
> =20
> @@ -93,7 +97,10 @@ Output Features
>  - Add support for link status, so that compositors can validate their ru=
ntime
>    fallbacks when e.g. a Display Port link goes bad.
> =20
> -- All the hotplug handling describe under "Runtime Configuration".
> +CRC API Improvements
> +--------------------
> +
> +- Optimize CRC computation ``compute_crc()`` and plane blending ``blend(=
)``
> =20
>  Atomic Check using eBPF
>  -----------------------
> --=20
> 2.28.0
>=20

--=20
Rodrigo Siqueira
https://siqueira.tech

--cojknnsds6ridqyr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl99wHkACgkQWJzP/com
vP/WhQ/+MxiTkJVWxhc5pWPG2ajYAE0lr06dvYt+9/bPPbln9sCwMT1CxGhCLzg9
Sy/+C7A8vbZIYSvW6Jt97WpzC2DBZoYWsAnNMpYD2+r4tf7cuOp6Bw6vRhHVStTO
2skp93T/Q503wF04XFAmUIDeQdsyeZTr3afExuc74snNKDNQDnJu9gOaym79hFVE
uWj8/cZY0m/X/aSPdpkNIEuxWwcsIftxe5qyX++xomLGTpWTZGCb88WvozAcsui9
RhCydpEEgihyOdaeUBeokUJie6AbFPnm/3ArazONHW7VXCqzI5/SZQYd8O2Y8ujL
SFnn1z6T/iCjSldAaDj71KjPxUJ6WaTy8EgXQZdGD4cJUCEUGuuWAqcUNID0ynfI
EmgabtXjwEeQhcLUVclY0LU/PtCxS/F1Nb6pXq3whCKJSBbKPFgI5ZPhVmvwjLh/
80APxsUaIeCzDQmaDFo8fCuIMoANs2nHdzwmGtyzRpAqyMQeJ8IAR7yWhWCgvCcf
UhQzWMc3nkrKbKXAqJ6aGNC2FQo8oBEB7lgm8H2E3lztVf946wuTR23AgeoQnR5M
NHBYUwrwcVNu3hACpy8gXGUb8YeAcVX7Vtvm67KkuFXMu72SxCIPUHKVdm6ajDUt
xMab8ADiqbCiQqnyJXcdE3JmEhw+nSu+WaqRriE9Hrtc+jPvT7Y=
=1dEv
-----END PGP SIGNATURE-----

--cojknnsds6ridqyr--

--===============1134088524==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1134088524==--
