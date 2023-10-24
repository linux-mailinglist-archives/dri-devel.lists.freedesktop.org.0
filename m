Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAA27D53E2
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 16:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E096910E29C;
	Tue, 24 Oct 2023 14:24:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEC8C10E3CA
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 14:24:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 560ADB80760;
 Tue, 24 Oct 2023 14:24:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 570D0C433C7;
 Tue, 24 Oct 2023 14:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698157491;
 bh=JiAgJPKemF9Wi2E3Nn7vBcVAiqFYF94P9jyQ6bRIssY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GVjYHRiP6+XxzVH7PcvA+cqVtDnX8XjFr68MPXEr15HWpNxUubJZCvRUsGdSYooIB
 96TTfcHjGLsQqmO1T/idyHpCLQAReQYVEHrT07OtneqwvON7jrBfaQgWr95vLuPB0Z
 de2nNZifq44lq9aPDX3UXBBMf3N5vSxPvGY9mYyRvjNTz0pmvwQ+5qa2o8abfRAIUh
 1ZGa4qjYnbCThn/DunhPbmAAcvqtUV1zGKMad0cd+AcGL9EtLouUkTgForBJ5hE4sx
 09h28lmevoSWX3HbXOqTM+1X8xATWi7uw6BirOy+44AR+mwIVoNeSidc26ZQ+lAnYm
 YNikKsPR4ggpA==
Date: Tue, 24 Oct 2023 16:24:49 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] drm: docs: Remove item from TODO list
Message-ID: <c6kwqxz2xgl64qb6dzetjjh6j2a6hj7mvbkeg57f5ulfs2hrib@ocjjsoxw3ns6>
References: <DB3PR10MB683528B8252ED2A802A0E154E8D8A@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
 <CAD=FV=W0G6C-=99viHMQaW2REGRQr2xgaejnJmadOdZkoE7AjA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hybcvdpiqm52svmj"
Content-Disposition: inline
In-Reply-To: <CAD=FV=W0G6C-=99viHMQaW2REGRQr2xgaejnJmadOdZkoE7AjA@mail.gmail.com>
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
Cc: neil.armstrong@linaro.org, tzimmermann@suse.de, corbet@lwn.net,
 sam@ravnborg.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Yuran Pereira <yuran.pereira@hotmail.com>, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--hybcvdpiqm52svmj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 23, 2023 at 10:25:50AM -0700, Doug Anderson wrote:
> On Mon, Oct 23, 2023 at 9:31=E2=80=AFAM Yuran Pereira <yuran.pereira@hotm=
ail.com> wrote:
> >
> > Since "Clean up checks for already prepared/enabled in panels" has
> > already been done and merged [1], I think there is no longer a need
> > for this item to be in the gpu TODO.
> >
> > [1] https://patchwork.freedesktop.org/patch/551421/
> >
> > Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>
> > ---
> >  Documentation/gpu/todo.rst | 25 -------------------------
> >  1 file changed, 25 deletions(-)
>=20
> It's not actually all done. It's in a bit of a limbo state right now,
> unfortunately. I landed all of the "simple" cases where panels were
> needlessly tracking prepare/enable, but the less simple cases are
> still outstanding.
>=20
> Specifically the issue is that many panels have code to properly power
> cycle themselves off at shutdown time and in order to do that they
> need to keep track of the prepare/enable state. After a big, long
> discussion [1] it was decided that we could get rid of all the panel
> code handling shutdown if only all relevant DRM KMS drivers would
> properly call drm_atomic_helper_shutdown().
>=20
> I made an attempt to get DRM KMS drivers to call
> drm_atomic_helper_shutdown() [2] [3] [4]. I was able to land the
> patches that went through drm-misc, but currently many of the
> non-drm-misc ones are blocked waiting for attention.
>=20
> ...so things that could be done to help out:
>=20
> a) Could review patches that haven't landed in [4]. Maybe adding a
> Reviewed-by tag would help wake up maintainers?
>=20
> b) Could see if you can identify panels that are exclusively used w/
> DRM drivers that have already been converted and then we could post
> patches for just those panels. I have no idea how easy this task would
> be. Is it enough to look at upstream dts files by "compatible" string?

I think it is, yes.

Maxime

--hybcvdpiqm52svmj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZTfTsAAKCRDj7w1vZxhR
xcQLAQDLOftRXQ2lHJ/6tZ1C2DlWodIPleYTRFzDQVKVJDBTtQEAvg5gQvFvDTgw
ic2BwYSSUUEriwl/ml0eDvtollJE0gM=
=HH4h
-----END PGP SIGNATURE-----

--hybcvdpiqm52svmj--
