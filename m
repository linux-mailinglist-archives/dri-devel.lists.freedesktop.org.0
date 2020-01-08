Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE3B133D06
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 09:24:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D326E870;
	Wed,  8 Jan 2020 08:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www413.your-server.de (www413.your-server.de [88.198.28.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 281846E870;
 Wed,  8 Jan 2020 08:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=cyberus-technology.de; s=default1911; h=MIME-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JBlWYGGSvBWACbm7HRiuPkVho02AyIMjSgIaZ7f4e1Q=; b=TD4KfA1mHsPk/otH1nsJhcfx2
 6qMbUG8qh3Ag+InObwXGU1QjJ5b8J0+nvAXqzzzNrUd9Uarn2o3GB5AU+KsXEpmm37+MnJCBKZrPx
 A3S6FfMg2BTQuxXDat1VNUmpEtlM08UgFaErOIV5VqS0QoaiBoMoegmfB7Mz37cmfKX8uTW6HB1j2
 DVdc4kQ+GQ4GGKBgWTGwVUW/NnoYxlAFb2JWS3qaDdW/ItuzT72Bt20hWhpk9UjOOE8hW5vM4Jey1
 tg8Qqsf9ZID9xNjchIdKF+1R0qAmL8sm+DEc7y8RmFI8bfs7iF8gQmv+BJAwOGEwJrtawIYa2w0pd
 LuMtXVm1Q==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
 by www413.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1)
 (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1ip6dd-00062z-4J; Wed, 08 Jan 2020 09:24:25 +0100
Received: from [24.134.37.229] (helo=192-168-0-109.rdsnet.ro)
 by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1ip6dc-0007FL-PG; Wed, 08 Jan 2020 09:24:24 +0100
Message-ID: <ab56cd76c4a4c1266ca35df1645d05bfeae58e25.camel@cyberus-technology.de>
Subject: Re: [PATCH 1/3] drm/i915/gvt: fix file paths in documentation
From: Julian Stecklina <julian.stecklina@cyberus-technology.de>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Date: Wed, 08 Jan 2020 10:24:22 +0200
In-Reply-To: <20200107020637.GA5894@zhen-hp.sh.intel.com>
References: <20200106140622.14393-1-julian.stecklina@cyberus-technology.de>
 <20200107020637.GA5894@zhen-hp.sh.intel.com>
Organization: Cyberus Technology GmbH
User-Agent: Evolution 3.34.2 (3.34.2-1.fc31) 
MIME-Version: 1.0
X-Authenticated-Sender: julian.stecklina@cyberus-technology.de
X-Virus-Scanned: Clear (ClamAV 0.101.4/25687/Tue Jan  7 10:56:22 2020)
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
Cc: zhiyuan.lv@intel.com, intel-gvt-dev@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hang.yuan@intel.com
Content-Type: multipart/mixed; boundary="===============0378216731=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0378216731==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-YmIID+xuIDInK9HOwQWr"


--=-YmIID+xuIDInK9HOwQWr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-01-07 at 10:06 +0800, Zhenyu Wang wrote:
> On 2020.01.06 16:06:20 +0200, Julian Stecklina wrote:
> > The documentation had some stale paths to i915 graphics virtualization
> > code. Fix them to point to existing files.
> >=20
> > Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> > Cc: zhiyuan.lv@intel.com
> > Cc: hang.yuan@intel.com
> >=20
> > Signed-off-by: Julian Stecklina <julian.stecklina@cyberus-technology.de=
>
> > ---
> >  Documentation/gpu/i915.rst | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
> > index e539c42a3e78..d644683c5249 100644
> > --- a/Documentation/gpu/i915.rst
> > +++ b/Documentation/gpu/i915.rst
> > @@ -43,19 +43,19 @@ Interrupt Handling
> >  Intel GVT-g Guest Support(vGPU)
> >  -------------------------------
> > =20
> > -.. kernel-doc:: drivers/gpu/drm/i915/i915_vgpu.c
> > +.. kernel-doc:: drivers/gpu/drm/i915/gvt/vgpu.c
> >     :doc: Intel GVT-g guest support
> > =20
> > -.. kernel-doc:: drivers/gpu/drm/i915/i915_vgpu.c
> > +.. kernel-doc:: drivers/gpu/drm/i915/gvt/vgpu.c
> >     :internal:
> > =20
> >  Intel GVT-g Host Support(vGPU device model)
> >  -------------------------------------------
> > =20
> > -.. kernel-doc:: drivers/gpu/drm/i915/intel_gvt.c
> > +.. kernel-doc:: drivers/gpu/drm/i915/gvt/gvt.c
> >     :doc: Intel GVT-g host support
> > =20
> > -.. kernel-doc:: drivers/gpu/drm/i915/intel_gvt.c
> > +.. kernel-doc:: drivers/gpu/drm/i915/gvt/gvt.c
> >     :internal:
> >=20
>=20
> The i915_vgpu.c and intel_gvt.c are still there for guest
> and host part of i915 interface with gvt. We still need them
> in doc. The files in gvt/ directory are gvt device model internals.=20

Thanks for clarifying. I'll drop the patch.

Julian

--=-YmIID+xuIDInK9HOwQWr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEIO56Pp1G3IBsGtZJ7pdfAn5EfbIFAl4VkbcACgkQ7pdfAn5E
fbK0dgf+NEF/F4ESZ27i+/L3luQ2NUKGLIdTQZDfA0Wajb8ljuRZuEpM5Uv8D+r3
o1+hTYRp15yqp1m23KKgvlJm9jUke4rpzNB7dJ1W/dbShshdsxRr90pCC0Mvm7W7
emIY80YjJLT0hq9Yhy4lEDhXju75Xrt5SHmnBm+XKYn6d+14BgZn9W+s4GzL1zUF
GdO791wtZpOAN2KK0B3+10ikhIkdtmoVsQvrRNflDWrDlQSSOqsDKu82KQDz2xxo
ykDmaB/zVvbC5WN5i5CNc/McC538Y1rkrHW3Re7cjEV8U3Pl2zmTXmNODv2fOR8D
jld35ZwlafJktmjluDQ0nbJUw8OBbA==
=t/Da
-----END PGP SIGNATURE-----

--=-YmIID+xuIDInK9HOwQWr--


--===============0378216731==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0378216731==--

