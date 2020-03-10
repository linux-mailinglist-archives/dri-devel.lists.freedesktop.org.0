Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C9317F457
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 11:07:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 741366E15D;
	Tue, 10 Mar 2020 10:07:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 174F9890F0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 10:07:05 +0000 (UTC)
Received: from localhost (p54B33196.dip0.t-ipconnect.de [84.179.49.150])
 by pokefinder.org (Postfix) with ESMTPSA id A5EBD2C1EB6;
 Tue, 10 Mar 2020 11:07:04 +0100 (CET)
Date: Tue, 10 Mar 2020 11:07:04 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 01/89] dt-bindings: i2c: brcmstb: Convert the BRCMSTB
 binding to a schema
Message-ID: <20200310100704.GJ1987@ninjato>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
 <6649111e9c585f267762bb6c6dd96128e5cfb4ba.1582533919.git-series.maxime@cerno.tech>
MIME-Version: 1.0
In-Reply-To: <6649111e9c585f267762bb6c6dd96128e5cfb4ba.1582533919.git-series.maxime@cerno.tech>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1430490027=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1430490027==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QnBU6tTI9sljzm9u"
Content-Disposition: inline


--QnBU6tTI9sljzm9u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2020 at 10:06:03AM +0100, Maxime Ripard wrote:
> Switch the DT binding to a YAML schema to enable the DT validation.
>=20
> Cc: Kamal Dasu <kdasu.kdev@gmail.com>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: bcm-kernel-feedback-list@broadcom.com
> Cc: linux-i2c@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

I didn't get the cover letter, so I assume I shall pick the I2C patches.
Please let me have the cover letter next time.


--QnBU6tTI9sljzm9u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5nZsgACgkQFA3kzBSg
KbbQ9Q/9GTVZf8R/GtAv29DgISJ/YjMp58JVs7OU6+mBQE0j7tiCJ6PLhm23VGiU
cdjdeDr1WnNxjFJVz4odMqLO3I6OQ1D5492m9JoDPyulYLf977dEiSMq+k3m50sp
Fjtmc2wfaeQD3IEdkDtNcFJkFpj90z3u7lQdT3g+HjnVXLMzQqPCKMNJ86uV+Bch
S5zkZy+T5cNq8ddDKy9pFKtLO5RtVsaJb4voFeCAn3mxvW768XGv6zH0p0YUDeXI
O+l3CwwFe8V1eqvQceTRu8eSq6k7XD0/EnH9eu0LVee+ou5gWUNgOI5oVyqee1mv
h9lJ/m4Dwnw5vwRb1Eo3yloQ5laK5Qoacj+PC1ywwQD6VajDelfa67qhjmGBVoMu
pu5gguaOFKTHsKDodTv3eKkupQmTeSvN50spne+/y8dZk1hth5k9mf6hfahKZYT5
NLyaSwsgCDnQ7cvJBHE4WkuCBx9yTyVVOTQB4TdtHwvk0NdhQSq8v3cCQeoe73IH
PipJrkHNeQrag1t/2WQwNQEViKoomxVK/n7zp8AbXfxiarzAmVnNvJi7WHoLotaM
LKnth/eRoerOtXeF1Owk54u+/V6kJE6mlNcl7RVvHauIANEG5k9p2cmPaXRFGnh0
n2qmm1mj0HCYrQxIkKJ+qtFeaieY1IQU1op1flY5kftD5ZzqRUk=
=EeaW
-----END PGP SIGNATURE-----

--QnBU6tTI9sljzm9u--

--===============1430490027==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1430490027==--
