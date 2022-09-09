Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED665B3694
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 13:43:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C3C710ECAF;
	Fri,  9 Sep 2022 11:43:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAE6F10ECAF
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 11:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LXzQm0bkBaPwZeSNBeMOWjOCn59C8b81RzqBwYXjmGU=; b=lj1yKWKXD7BvKCLovd/INhOavU
 46XvE9Kg0dPrzIKZzA+OYipJoMChcxF2YhOSAC4w0lKj7/C63DIxcQBki0Z8ZCNmMRWSPlHnSup/D
 CyogWmAfF840u3tF1L8UyIFL3g9U18ExQqGTC1F9jURU+IZ7Bze+FZxE7vCxidD5YUOM8q/wmiOID
 cH7XRzvDhrQXAncvO4TMGJ3YnNRadq8xSpD0Y4oZO6TY7W2sIpACESeHyvMdoxbay867LQLDbUjLB
 uemhXQSG3O1OAUv8Wh29H54slXwM0CipnNr1Wfy/EYTc3I1KQgt/s5YX/WvzWo1gDpAelj4vkyezg
 Qd2ooCVw==;
Received: from [38.44.74.92] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oWcPy-00Dtbf-Le; Fri, 09 Sep 2022 13:43:30 +0200
Date: Fri, 9 Sep 2022 10:43:17 -0100
From: Melissa Wen <mwen@igalia.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: Re: build failure of next-20220906 due to 396369d67549 ("drm: vkms:
 Add support to the RGB565 format")
Message-ID: <20220909114317.dj3gdjxl7qdyunyr@mail.igalia.com>
References: <YxducgSzR6/zyHD7@debian>
 <CADVatmNfc1YT02v5-FaMoGN==MOx5ZJ=o8YMQAH19Gvf91betA@mail.gmail.com>
 <20220907170451.efhz62nkxybqxtaa@mail.igalia.com>
 <CADVatmNodAV4PB5jjARnowu=VGbgMWgBYDWPuwJe-f1WFaS8ow@mail.gmail.com>
 <20220907192250.jfkpwaq54f2h7stf@mail.igalia.com>
 <CADVatmN2u4RB2tamaJ8qc+Vj3A4Lk9py-4fVVMNOBxz07Zjv-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ypweinyay3gzzjjz"
Content-Disposition: inline
In-Reply-To: <CADVatmN2u4RB2tamaJ8qc+Vj3A4Lk9py-4fVVMNOBxz07Zjv-g@mail.gmail.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>, linux-next <linux-next@vger.kernel.org>,
 Igor Torrente <igormtorrente@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ypweinyay3gzzjjz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 09/07, Sudip Mukherjee wrote:
> On Wed, Sep 7, 2022 at 8:23 PM Melissa Wen <mwen@igalia.com> wrote:
> >
> > On 09/07, Sudip Mukherjee wrote:
> > > Hi Melissa,
> > >
> > > On Wed, Sep 7, 2022 at 6:05 PM Melissa Wen <mwen@igalia.com> wrote:
> > > >
> > > > On 09/06, Sudip Mukherjee wrote:
> > > > > On Tue, Sep 6, 2022 at 4:59 PM Sudip Mukherjee (Codethink)
> > > > > <sudipm.mukherjee@gmail.com> wrote:
> > > > > >
> > > > > > Hi All,
> > > > > >
> > > > > > The builds of next-20220906 fails for mips, xtensa and arm allm=
odconfig.
> > > > > >
> > > > > > The errors in mips and xtensa are:
> > > > > >
> > > > > > ERROR: modpost: "__divdi3" [drivers/gpu/drm/vkms/vkms.ko] undef=
ined!
> > > > > > ERROR: modpost: "__udivdi3" [drivers/gpu/drm/vkms/vkms.ko] unde=
fined!
> > > > > >
> > > > > > The error in arm is:
> > > > > >
> > > > > > ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/vkms/vkms.k=
o] undefined!
> > > > > > ERROR: modpost: "__aeabi_ldivmod" [drivers/gpu/drm/vkms/vkms.ko=
] undefined!
> > > > > >
> > > > > >
> > > > > > Trying to do a git bisect to find out the offending commit.
> > > > >
> > > > > git bisect points to 396369d67549 ("drm: vkms: Add support to the
> > > > > RGB565 format")
> > > >
> > > > Hi Sudip,
> > > >
> > > > Thanks for pointing out this issue.
> > > >
> > > > I think we can replace the macros that are triggering those compila=
tion
> > > > error by functions in drm/drm_fixed.h that do the same calculation.
> > > >
> > > > I checked those errors when building for arm and i386 and the issue=
s are
> > > > fixed after applying the patch below. I appreciate if you can test.
> > >
> > > Sorry, could not test as the downloaded mbox is saying patch is
> > > corrupted and could not be applied. Can you please attach the patch or
> > > maybe send using git send-email.
> >
> > Sorry, my bad. It's attached. Let me know if goes smoothly.
>=20
> Thanks. That was perfect.
> And with that I can confirm I don't see the failure on mips and arm.
> Not tested on xtensa but should be fixed there also.
>=20
> Tested-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>

Thanks for testing it.

Melissa
>=20
>=20
> --=20
> Regards
> Sudip

--ypweinyay3gzzjjz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmMbJtEACgkQwqF3j0dL
ehwegQ//a5RJ9PvEI/E1NHC4ToYElA7cg54THXUqMCIrP9uC3qb3fFdgAAqtzqQS
n+gSJNCKtTcq72LjsiiiNLND+XKDa8eYKLiFIYFmZZFmUK7fqB0Ke5/XjcO+SAuv
RPDMR/PkR1pAHjS0Od1+NCz0RH9m1ZFQN8ak9rHflLGoSS1L68wtdH37u6EQTV7n
atcstBRX9DNc7K0WW2Vi0k5NzJLDcbqSzq/BLxItgJX5YtGwyeQBkzE8TwGpjON9
jMcXhpm3XQlQ7L+kz+9o+hiFdN80iIEeeuuy6MzFFcroBSUcycmBfnrx0zk52Ygc
rCWQyf4/E2fDGilTh9WztrGIsPiJFiJ4PbM/2g3khHuychUcUsmli+UG9ejq6+tw
GVFs6/Vr+cw/QbdWaYZfrPpTjqTN/ZY+0v9Khn9kCkdPf0xbUQUPH1rGJbOJ/VO6
Uy0n+KhqP8Wpa6HutPP0D+xQEIE4uHwvw31ltEz5SB40vUxerXHOKOia0+9ILB3C
TAP/l8Js5j4op6P7Db84f+7/k3nXz45k8AWVipTJD7Xz9f9AUTGckkMSY+CsQ/+f
pFv8+UjPxwaqPxAlkVWA2JcBmOfjvzH1ElGr8SU/+XSVr6N0ckKHZYNRNGt5/Qb9
jJPvzCbBDxHoTRRbFbt1TA43lcZxyHz7aBlxqXnbZ9saImHaIZ0=
=NCkY
-----END PGP SIGNATURE-----

--ypweinyay3gzzjjz--
