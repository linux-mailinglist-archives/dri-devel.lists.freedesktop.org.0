Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D788D660845
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 21:26:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C0C10E8DF;
	Fri,  6 Jan 2023 20:26:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 10775 seconds by postgrey-1.36 at gabe;
 Fri, 06 Jan 2023 20:26:30 UTC
Received: from 12.mo583.mail-out.ovh.net (12.mo583.mail-out.ovh.net
 [46.105.39.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 611E510E8DF
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 20:26:30 +0000 (UTC)
Received: from director11.ghost.mail-out.ovh.net (unknown [10.108.4.253])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id 09ACB26428
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 20:26:29 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-frlns (unknown [10.110.115.217])
 by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id EF9E41FD6F;
 Fri,  6 Jan 2023 20:26:27 +0000 (UTC)
Received: from sk2.org ([37.59.142.101])
 by ghost-submission-6684bf9d7b-frlns with ESMTPSA
 id AKULM/ODuGOEMwcAlD46gA
 (envelope-from <steve@sk2.org>); Fri, 06 Jan 2023 20:26:27 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0043dc466b6-9082-4d34-a267-22690df0fbde,
 9FE29456621203A27B372E1E0503D45BE0167874) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
Date: Fri, 6 Jan 2023 21:26:20 +0100
From: Stephen Kitt <steve@sk2.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH RESEND 1/4] backlight: aat2870: Use backlight helper
Message-ID: <20230106212620.25ddc1f7@heffalump.sk2.org>
In-Reply-To: <Y7hdyPAKBYv+gAzf@phenom.ffwll.local>
References: <20230106164856.1453819-2-steve@sk2.org>
 <Y7hdyPAKBYv+gAzf@phenom.ffwll.local>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6.Rk8dlQBWmUu4pqahHUcTU";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Ovh-Tracer-Id: 9508506188370708102
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrkedtgddufeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfofggtgesghdtreerredtjeenucfhrhhomhepufhtvghphhgvnhcumfhithhtuceoshhtvghvvgesshhkvddrohhrgheqnecuggftrfgrthhtvghrnhepieehvedvueegjefffeetffevhfeigeejvefhkeejjedvlefgfeekhefhudffhfejnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoshhtvghvvgesshhkvddrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdpoffvtefjohhsthepmhhoheekfedpmhhouggvpehsmhhtphhouhht
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/6.Rk8dlQBWmUu4pqahHUcTU
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Fri, 6 Jan 2023 18:43:36 +0100, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Fri, Jan 06, 2023 at 05:48:52PM +0100, Stephen Kitt wrote:
> > Instead of retrieving the backlight brightness in struct
> > backlight_properties manually, and then checking whether the backlight
> > should be on at all, use backlight_get_brightness() which does all
> > this and insulates this from future changes.
> >=20
> > Signed-off-by: Stephen Kitt <steve@sk2.org> =20
>=20
> Lee/Daniel, will you pick these up, or should I smash them all into
> drm-misc-next for 6.3?
>=20
> Stephen, I see to be missing 3/4 here, but maybe it'll show up.

It seems to have been delayed in transit, it showed up some time after all
the others on the mailing lists. If you haven=E2=80=99t got it yet I can re=
send it!

Regards,

Stephen

--Sig_/6.Rk8dlQBWmUu4pqahHUcTU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEnPVX/hPLkMoq7x0ggNMC9Yhtg5wFAmO4g+wACgkQgNMC9Yht
g5ySag/+IUKNKwdPzcz87ExU/EcxxVEkpIQaqG0HGfYkuBVLZeY/yjGmCVBFeWAj
s7fXuWB1r3gESzIUMmRANHYydPRJJOxSlBtJTKPSsVWya4fTWS0790PEWVkUg1hx
gqmBbmuLKJ8rnbWUQVI3vP3X1aMJGfitkxCsQOXHIhOBsBjEtR6Px+2AvLWbSgyv
BcbiPhYbB/vviAH+1MNi+n9lSFeB2zYja9RAVZJZp9rAX4BxUfwNkUninM9XbZvt
mu8jjy5XmuLybD9IgbYiGkk5AIuoWwBWGDiUNO24YVW+nJT9GMCItp6HC6paSiW4
ZLWz2xxuXpd1d7t93Py9+I43Klk2Hry1m/QCttmmpZ0e1BQOgkftb5AiPqb7Lf+D
QcekDHxA+WAVFft5cs76bcLGEXoSSrL6f2K4v7yrm86W83tRXoqNGmLBxa4cK0xW
dTxJuOMCKWxwjkQXdFEM5CJ6LaQEaNZFDD/rlMlkLNHB8SPFZ9XKQAG4ADgxhoGG
SN2M9Fkmhum7TThWPQ5xaIdLGUQmc0ezIq8vSFRDC5F74ng2OPA0L8Ix1kOI4doy
Yhug2I9jPRjeE9FE5aCoxF2Imvc06T+HeGwDD0ch2a4rM4F8F+TbI/gwzGyQ3TUC
v619bdh5vGdZm0K8ZPeQtLHvHJ/24g0jt53lyN0Xh4KiWS9CgOk=
=mZFb
-----END PGP SIGNATURE-----

--Sig_/6.Rk8dlQBWmUu4pqahHUcTU--
