Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A85AB10218
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 09:41:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ABBB10E8AC;
	Thu, 24 Jul 2025 07:41:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A1410E8AC
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 07:41:12 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1ueqZC-0004mm-Cq; Thu, 24 Jul 2025 09:40:38 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b]
 helo=bjornoya.blackshift.org)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <mkl@pengutronix.de>) id 1ueqZ9-00A1Dn-32;
 Thu, 24 Jul 2025 09:40:35 +0200
Received: from pengutronix.de (p5b1645f7.dip0.t-ipconnect.de [91.22.69.247])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id 5B108447D62;
 Thu, 24 Jul 2025 07:40:35 +0000 (UTC)
Date: Thu, 24 Jul 2025 09:40:34 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, imx@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Laurent.pinchart@ideasonboard.com, 
 andrzej.hajda@intel.com, festevam@gmail.com, simona@ffwll.ch, robh@kernel.org, 
 shengjiu.wang@gmail.com, rfoss@kernel.org, airlied@gmail.com, tiwai@suse.com, 
 jernej.skrabec@gmail.com, p.zabel@pengutronix.de, luca.ceresoli@bootlin.com, 
 devicetree@vger.kernel.org, conor+dt@kernel.org, tzimmermann@suse.de,
 jonas@kwiboo.se, 
 victor.liu@nxp.com, s.hauer@pengutronix.de, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, linux-sound@vger.kernel.org, perex@perex.cz, 
 linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 lumag@kernel.org, 
 dianders@chromium.org, kernel@pengutronix.de, cristian.ciocaltea@collabora.com,
 krzk+dt@kernel.org, shawnguo@kernel.org, l.stach@pengutronix.de
Subject: Re: [PATCH v2 2/6] ALSA: Add definitions for the bits in IEC958
 subframe
Message-ID: <20250724-fair-sheep-of-success-e02586-mkl@pengutronix.de>
References: <20250724072248.1517569-1-shengjiu.wang@nxp.com>
 <20250724072248.1517569-3-shengjiu.wang@nxp.com>
 <87jz3ykpju.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vpabkhcgtahxjd2o"
Content-Disposition: inline
In-Reply-To: <87jz3ykpju.wl-tiwai@suse.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--vpabkhcgtahxjd2o
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/6] ALSA: Add definitions for the bits in IEC958
 subframe
MIME-Version: 1.0

On 24.07.2025 09:37:09, Takashi Iwai wrote:
> On Thu, 24 Jul 2025 09:22:44 +0200,
> Shengjiu Wang wrote:
> >=20
> > The IEC958 subframe format SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE are used
> > in HDMI and DisplayPort to describe the audio stream, but hardware devi=
ce
> > may need to reorder the IEC958 bits for internal transmission, so need
> > these standard bits definitions for IEC958 subframe format.
> >=20
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  include/sound/asoundef.h | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >=20
> > diff --git a/include/sound/asoundef.h b/include/sound/asoundef.h
> > index 09b2c3dffb30..7efd61568636 100644
> > --- a/include/sound/asoundef.h
> > +++ b/include/sound/asoundef.h
> > @@ -12,6 +12,15 @@
> >   *        Digital audio interface					    *
> >   *                                                                    =
      *
> >   *********************************************************************=
*******/
> > +/* IEC958 subframe format */
> > +#define IEC958_SUBFRAME_PREAMBLE_MASK	(0xf)
> > +#define IEC958_SUBFRAME_AUXILIARY_MASK	(0xf<<4)
> > +#define IEC958_SUBFRAME_SAMPLE_24_MASK	(0xffffff<<4)
> > +#define IEC958_SUBFRAME_SAMPLE_20_MASK	(0xfffff<<8)
> > +#define IEC958_SUBFRAME_VALIDITY	(0x1<<28)
> > +#define IEC958_SUBFRAME_USER_DATA	(0x1<<29)
> > +#define IEC958_SUBFRAME_CHANNEL_STATUS	(0x1<<30)
> > +#define IEC958_SUBFRAME_PARITY		(0x1<<31)
>=20
> I'd use "U" suffix as it can reach to the MSB.
> Also, you can put spaces around the operators to align with the
> standard format, too.  I guess you followed to the other code there,
> but following to the standard coding style would be better.
>=20
> With those addressed, feel free to take my ack for this patch:

Or make use of the BIT() and GEN_MASK() helpers.

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--vpabkhcgtahxjd2o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmiB428ACgkQDHRl3/mQ
kZw/twgArxwtsVQVLCtwTC1hTu1XO6jfEwAQpaPieSPwdzfilkYMvr5Y9dRXex55
jD6ZICtiqq+5U58pzhF7kpFQn1zBXU35xuvqu4H7EmC8yNPcgPr3gZd7FZOyFv+M
dehm4FgajYh4JhZBpfLNISc5DSTLiKiWA1fMQUPmfsyaHcikhRBPntgFqRp7Qz6Q
rnjazptVZ4MOkFgCL/Gnuzjs+0go1y4H6rLEcDdvFqGx9id/GJiQ+DHUWXEHnmr4
12scaPJb4fWgbwJ3/YtzCDHPUG6wVyoaQ3oek6NRQaXZ8T3Zic0IGem1++odVGZM
b7VK73jGSrhTMmTWcU3DIsNHR5b8mw==
=My/c
-----END PGP SIGNATURE-----

--vpabkhcgtahxjd2o--
