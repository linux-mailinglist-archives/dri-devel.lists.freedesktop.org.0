Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 585E031FE8A
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 19:08:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ACE16E06D;
	Fri, 19 Feb 2021 18:08:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5ACE6E06D
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 18:08:43 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 5B9D41C0B98; Fri, 19 Feb 2021 19:08:40 +0100 (CET)
Date: Fri, 19 Feb 2021 19:08:39 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Kiran Gunda <kgunda@codeaurora.org>
Subject: Re: [PATCH V1 0/2] Fix WLED FSC Sync and brightness Sync settings
Message-ID: <20210219180839.GB8596@duo.ucw.cz>
References: <1613743659-4726-1-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
In-Reply-To: <1613743659-4726-1-git-send-email-kgunda@codeaurora.org>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 daniel.thompson@linaro.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, robh+dt@kernel.org, jacek.anaszewski@gmail.com,
 linux-arm-msm@vger.kernel.org, lee.jones@linaro.org,
 linux-leds@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1344875775=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1344875775==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GID0FwUMdk1T2AWN"
Content-Disposition: inline


--GID0FwUMdk1T2AWN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> The FSC (Full scale current) setting is not updated properly due to the
> wrong register toggling for WLED5. Also the ILED_SYNC toggle and MOD_SYNC
> toggle sequence is updated as per the hardware team recommendation to fix
> the FSC update and brightness update issue.

If this is phone hardware, it might make sense to cc:
phone-devel@vger...

Best regards,
									Pavel

--=20
http://www.livejournal.com/~pavelmachek

--GID0FwUMdk1T2AWN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYC/+pwAKCRAw5/Bqldv6
8v0PAJ9ISDz0UXnceiQ5xhbRxHROiNEIPQCeLTRKWGIGaXXN9i9uX3Wdz5F1rXw=
=ujV2
-----END PGP SIGNATURE-----

--GID0FwUMdk1T2AWN--

--===============1344875775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1344875775==--
