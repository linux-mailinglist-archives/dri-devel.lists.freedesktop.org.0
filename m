Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FCD7D54BB
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 17:09:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 780DC10E3D4;
	Tue, 24 Oct 2023 15:09:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CCAE10E3D4
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 15:09:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 64E5D624F7;
 Tue, 24 Oct 2023 15:09:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 740BAC433C7;
 Tue, 24 Oct 2023 15:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698160141;
 bh=WjZOHjehQIEdnvElJew7f9x5ZqLGCeUVjwRuHOMlEjk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CgZv75zmnuoQ3ekkikQC5x9qSL7DET36FFJXesbijJrWTAliIFHfRSIjF6/JXUDQ0
 d+cP6SIFduzbCM5SmWKiaiRL18S85MiUGZ8OX1xnjboThQELef/voEBlHUIIa4Yc80
 0P++v7esCbdc9Z1jAU+oRLa52c7PCgm+7OaJJG19BLbu2WUUIDxnUugkzoKgEgtHig
 xbqa1LPQHGhx0lPElbc/GcNikq8DiiOhwHgeUguRliY3sJJiAYe+wSeAuj/zX1NwXL
 s9T/KMpbHqCf2cLHEaSW4y52qBo5mgOAtijYPOOu3uxicZgzGpkSpEPL5Unstd12Hi
 /HclSTJxGaD5w==
Date: Tue, 24 Oct 2023 16:08:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Flavio Suligoi <f.suligoi@asem.it>
Subject: Re: [PATCH 1/1] dt-bindings: backlight: mp3309c: remove two required
 properties
Message-ID: <20231024-paddling-spongy-be82eae03228@spud>
References: <20231020135434.2598578-1-f.suligoi@asem.it>
 <20231020135434.2598578-2-f.suligoi@asem.it>
 <20231020-moonrise-senate-86d0edb2d404@spud>
 <DU2PR01MB803498DFD93E82DD3947D72DF9D8A@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
 <20231023-anybody-silver-4548023f8f26@spud>
 <DU2PR01MB8034CF8EE4358B9446809AA2F9DFA@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8Q3LPtznJIWd+xHE"
Content-Disposition: inline
In-Reply-To: <DU2PR01MB8034CF8EE4358B9446809AA2F9DFA@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--8Q3LPtznJIWd+xHE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 24, 2023 at 07:53:38AM +0000, Flavio Suligoi wrote:
> > On Mon, Oct 23, 2023 at 09:28:03AM +0000, Flavio Suligoi wrote:
> > > > On Fri, Oct 20, 2023 at 03:54:33PM +0200, Flavio Suligoi wrote:
> > > > > The two properties:
> > > > >
> > > > > - max-brightness
> > > > > - default brightness
> > > > >
> > > > > are not really required, so they can be removed from the "require=
d"
> > > > > section.
> > > >
> > > > Why are they not required? You need to provide an explanation.
> > >
> > > The "max-brightness" is not more used now in the driver (I used it in
> > > the first version of the driver).
> >=20
> > If it is not used any more, what happens when someone passes an old
> > devicetree to the kernel, that contains max-brightness, but not any of =
your
> > new properties?
>=20
> This is not a problem, because the device driver has not yet been include=
d in any kernel.
> My patch for the device driver is still being analyzed by the maintainers.
> Only this dt-binding yaml file is already included in the "for-backlight-=
next" branch
> of the "backlight" kernel repository.
> At the moment, this driver is used only in a i.MX8MM board produced in my=
 company,
> under my full control. No other developer is using it now.

Right. This is exactly the sort of commentary that you need to provide
up front, to have us spent a bunch of time going back and forth to
figure out :(

> > > The "default-brightness", if omitted in the DT, is managed by the
> > > device driver, using a default value. This depends on the dimming mode
> > used:
> >=20
> > For default-brightness, has here always been support in the driver for =
the
> > property being omitted, or is this newly added?
>=20
> In the first version of the driver this property was a "required property=
",
> but nobody has used this driver before, so this should be not a problem.

> > What I would like is an explanation in the commit message as to why the
> > revised example is more helpful than the existing (and
> > must-remain-valid) one.
>=20
> As said before, no one may have ever used this device driver,
> so I would leave only this new version of the example.

Okay. Please improve the commit message explaining why it is okay to
make these changes & send a v2.
The alternative is that Lee drops the dt-binding patch & you submit a
revised version of the binding alongside the next iteration of the
driver.

Cheers,
Conor.

--8Q3LPtznJIWd+xHE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTfeCAAKCRB4tDGHoIJi
0iFhAP9S/FlnjK5C6KCH6pLyfeeCD1U8XFRW7kZPbpJplU8SCAD/bkAcQQd5VU9d
3r2f744R9Cw33bKy5n99PAJBaey2KwU=
=8wm8
-----END PGP SIGNATURE-----

--8Q3LPtznJIWd+xHE--
