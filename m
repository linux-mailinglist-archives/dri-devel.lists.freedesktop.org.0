Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF7920EF88
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 09:35:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42E3B89DB8;
	Tue, 30 Jun 2020 07:35:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAFD289EBD
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 21:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=k1; bh=1R5VbfyjnCD0CmpFWZBQGlSYfWm+
 NoLCMYa6SRuHNZI=; b=DuUNS0rIyBlqryiO1lADl4AQ5JfcuOPcJDV2IVFGM+pG
 BxMC/hkT5dkyCGF6Q1HTk4aJwCOLxenQqr8CAwZ8iWxCG9hxIYJYDosJU+dNoPJO
 Wze1Y9QWn06Sop7cYVo1anfQUotBy+ag5oUFAmqaYsB6C/ClU4FdFIxQ5eTRYoo=
Received: (qmail 2172219 invoked from network); 29 Jun 2020 23:10:30 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 29 Jun 2020 23:10:30 +0200
X-UD-Smtp-Session: l3s3148p1@IvsbfT+pqsMgAwDPXwOPAI5mQFP60fXe
Date: Mon, 29 Jun 2020 23:10:27 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: Re: [PATCH] Remove handhelds.org links and email addresses
Message-ID: <20200629211027.GA1481@kunai>
References: <20200629203121.7892-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
In-Reply-To: <20200629203121.7892-1-grandmaster@al2klimov.de>
X-Mailman-Approved-At: Tue, 30 Jun 2020 07:34:53 +0000
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
Cc: ulf.hansson@linaro.org, gustavo@embeddedor.com, tony@atomide.com,
 daniel.vetter@ffwll.ch, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mchehab+samsung@kernel.org,
 lee.jones@linaro.org, corbet@lwn.net, linux-samsung-soc@vger.kernel.org,
 aaro.koskinen@iki.fi, robert.jarzmik@free.fr, rafael.j.wysocki@intel.com,
 yuehaibing@huawei.com, linux@armlinux.org.uk, krzk@kernel.org,
 kgene@kernel.org, viresh.kumar@linaro.org, kuba@kernel.org, arnd@arndb.de,
 b.zolnierkie@samsung.com, jani.nikula@intel.com, linux-mmc@vger.kernel.org,
 linux-input@vger.kernel.org, j.neuschaefer@gmx.net, haojian.zhuang@gmail.com,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org, yanaijie@huawei.com, gregkh@linuxfoundation.org,
 dmitry.torokhov@gmail.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Julia.Lawall@inria.fr, netdev@vger.kernel.org,
 davem@davemloft.net, daniel@zonque.org
Content-Type: multipart/mixed; boundary="===============1730482528=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1730482528==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Content-Disposition: inline


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alexander,

thanks for trying to fix this, yet I have some doubts.

On Mon, Jun 29, 2020 at 10:31:21PM +0200, Alexander A. Klimov wrote:
> Rationale:
> https://lore.kernel.org/linux-doc/20200626110706.7b5d4a38@lwn.net/

I think we need some text here. Clicking on a link to understand what a
patch is about is not comfortable. You can add the link with a Link: tag
for additional information.

Removing stale email addresses may have some value, but removing...

>  Compaq's Bootldr + John Dorsey's patch for Assabet support
> -(http://www.handhelds.org/Compaq/bootldr.html)

... information like this is not good. 'Wayback machine' still has
copies in case someone wants to look at where the infos came from.

> - * Copyright 2004-2005  Phil Blundell <pb@handhelds.org>
> + * Copyright 2004-2005  Phil Blundell

This is an OK case in my book...


> -MODULE_AUTHOR("Phil Blundell <pb@handhelds.org>");
> +MODULE_AUTHOR("Phil Blundell");

... same here ...

> @@ -435,7 +435,6 @@
>                             case a PCI bridge (DEC chip 21152). The value of
>                             'pb' is now only initialized if a de4x5 chip is
>                             present.
> -                           <france@handhelds.org>

This is kind of a signature and should be kept IMO.

>   * 2001/07/23: <rmk@arm.linux.org.uk>
> - *	- Hand merge version from handhelds.org CVS tree.  See patch
> + *	- Hand merge version from CVS tree.  See patch

That information may be useful.


>  /* SPDX-License-Identifier: GPL-2.0-only */
>  /* -*- linux-c -*-
> - *
> - * (C) 2003 zecke@handhelds.org

Removing copyright is a bad idea.

Probably some comment blocks are cruft meanwhile and can be removed as a
whole. That can be discussed. But removing only the handhelds.org part
makes most parts worse IMHO.

Thanks and happy hacking,

   Wolfram


--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl76WMAACgkQFA3kzBSg
KbZgWA/+IxRkb15JXVvwYM1c4ReuUiEUrJ0KOI0M0XELe0YWelDrhgcOtSC0ozRT
lTt8uizNNBK4bsRpoo+ghjZvNELOeMx+4VsVtMM+IoXXxIKha1jSJ1hqFDsBcCP0
urAvhdaNyC+TWmEM2H98eb5JfdSxKxrzjIMs4tTBlZOBnu+wAoiDZv4mPf/y1bGv
L33lwlFG6tkWpVX2veVNoTg04TG0LupAtXUyiI+Hnxt7srbugymQs0iwtd5sCt2R
AG+BmuN5zmUS5cISCL6p1uXSxVRrs3FI02dwU7m5yvBfvHHSGVsx+f9wPpnpqNc8
1I3oAR+Ct2K3lvu3uLBY2xDL4WbTmPobmzGLXbwB8ksPC/B1TV5LC/+TI2F+c+gk
ROaTdQqzt4H0wfzNFOzYT8zGyZOoiPFro7jxCcH9CZjbkeDi19sJt7TQ6I1B0I9+
bSTAb7s3yWhzUypFHzdR0PT97e8zeiK/xJUTbPkvv+JsDZZvPht423X7CYEUjaCo
sPQ5UuDSfS4xT25PBabjhNeunmODzCE/+DrtbOSuM5AV63TOoVMB8zWBoJH17emH
mRgD29xeEITWlq/fBWcPWIjgFDVanjDPYIW2/jnGqm7RLTaw703ajQSbD/7ELOAB
84gr1NpIeJuhMnRnB11nHCJsUWnRqvl2rt7lretb/tFUB8LhGFE=
=FQ9k
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--

--===============1730482528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1730482528==--
