Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 762AE54D533
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 01:26:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 949C811398B;
	Wed, 15 Jun 2022 23:26:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E60F11398B;
 Wed, 15 Jun 2022 23:26:32 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LNhJj4D37z4xXj;
 Thu, 16 Jun 2022 09:26:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1655335590;
 bh=4c1p9aoakWvVGQikpvG/RIE/yTK1928napcIErEfrMw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HqUXuBYrsYaQ9Agq+kquqWaFmqiy8v/6WqkfJS6gGemEapRtskCM/z71qyu2/Og7v
 GRIe0wYNZp0swHZ8MhCq377lEbfYIWCtqDirAksUi4vGPshLDcUgeJkdRdYHYQ/eSA
 W0OqIi8uvV0405Lz88IqG4bqMxnKjmNb7oIyett5cvS00/bzoOlKoTwXI23N/mkAHD
 ksP293/YTB9AQAC/aUirOfEZ9x5BBgdsP+Cj3U99r979hQRcQmlmKAbRtGBFlbFszh
 Io+/X7QzK/q5t8hlduK/u3rKtRPw7z9oaMzjEDO/iU3iUrW5deCc4sO1BPG1Xf280d
 SrJZLy9CwaM7w==
Date: Thu, 16 Jun 2022 09:26:28 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Nathan Chancellor <nathan@kernel.org>, Daniel Vetter
 <daniel.vetter@ffwll.ch>
Subject: Re: linux-next: Tree for Jun 15
 (drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c)
Message-ID: <20220616092628.7cd86f4c@canb.auug.org.au>
In-Reply-To: <YqpGknQvigfwZU6b@dev-arch.thelio-3990X>
References: <20220615160116.528c324b@canb.auug.org.au>
 <d1a48a84-6d07-e8f7-5fd8-d24a7a1cf187@infradead.org>
 <CADnq5_N6gfaPfZJAX4+poWFFruxNdFKZqzXZXosj1A55e-O1mA@mail.gmail.com>
 <YqpACmvbwiEcUfta@dev-arch.thelio-3990X>
 <CADnq5_OnrxUiM+aTWRLjixp=vY6adV3w4p2cfTkdS32uq_UsiQ@mail.gmail.com>
 <YqpGknQvigfwZU6b@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bgju8kcfbeT8uFOogwBdnTS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Randy Dunlap <rdunlap@infradead.org>, Jani Nikula <jani.nikula@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/bgju8kcfbeT8uFOogwBdnTS
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 15 Jun 2022 13:52:34 -0700 Nathan Chancellor <nathan@kernel.org> wr=
ote:
>
> On Wed, Jun 15, 2022 at 04:45:16PM -0400, Alex Deucher wrote:
> > On Wed, Jun 15, 2022 at 4:24 PM Nathan Chancellor <nathan@kernel.org> w=
rote: =20
> > >
> > > On Wed, Jun 15, 2022 at 03:28:52PM -0400, Alex Deucher wrote: =20
> > > > On Wed, Jun 15, 2022 at 3:01 PM Randy Dunlap <rdunlap@infradead.org=
> wrote: =20
> > > > >
> > > > >
> > > > >
> > > > > On 6/14/22 23:01, Stephen Rothwell wrote: =20
> > > > > > Hi all,
> > > > > >
> > > > > > Changes since 20220614:
> > > > > > =20
> > > > >
> > > > > on i386:
> > > > > # CONFIG_DEBUG_FS is not set
> > > > >
> > > > >
> > > > > ../drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: I=
n function =E2=80=98amdgpu_dm_crtc_late_register=E2=80=99:
> > > > > ../drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:65=
99:2: error: implicit declaration of function =E2=80=98crtc_debugfs_init=E2=
=80=99; did you mean =E2=80=98amdgpu_debugfs_init=E2=80=99? [-Werror=3Dimpl=
icit-function-declaration]
> > > > >   crtc_debugfs_init(crtc);
> > > > >   ^~~~~~~~~~~~~~~~~
> > > > >   amdgpu_debugfs_init
> > > > >
> > > > >
> > > > > Full randconfig file is attached. =20
> > > >
> > > > I tried building with your config and I can't repro this.  As Harry
> > > > noted, that function and the whole secure display feature depend on
> > > > debugfs.  It should never be built without CONFIG_DEBUG_FS.  See
> > > > drivers/gpu/drm/amd/display/Kconfig:
> > > > =20
> > > > > config DRM_AMD_SECURE_DISPLAY
> > > > >         bool "Enable secure display support"
> > > > >         default n
> > > > >         depends on DEBUG_FS
> > > > >         depends on DRM_AMD_DC_DCN
> > > > >         help
> > > > >             Choose this option if you want to
> > > > >             support secure display
> > > > >
> > > > >             This option enables the calculation
> > > > >             of crc of specific region via debugfs.
> > > > >             Cooperate with specific DMCU FW. =20
> > > >
> > > > amdgpu_dm_crtc_late_register is guarded by
> > > > CONIG_DRM_AMD_SECURE_DISPLAY.  It's not clear to me how we could hit
> > > > this. =20
> > >
> > > I think the problem is that you are not looking at the right tree.
> > >
> > > The kernel test robot reported [1] [2] this error is caused by commit
> > > 4cd79f614b50 ("drm/amd/display: Move connector debugfs to drm"), which
> > > is in the drm-misc tree on the drm-misc-next branch. That change remo=
ves
> > > the #ifdef around amdgpu_dm_crtc_late_register(), meaning that
> > > crtc_debugfs_init() can be called without CONFIG_DRM_AMD_SECURE_DISPL=
AY
> > > and CONFIG_DEBUG_FS.
> > >
> > >   $ git show -s --format=3D'%h ("%s")'
> > >   abf0ba5a34ea ("drm/bridge: it6505: Add missing CRYPTO_HASH dependen=
cy")
> > >
> > >   $ make -skj"$(nproc)" ARCH=3Dx86_64 mrproper defconfig
> > >
> > >   $ scripts/config -d BLK_DEV_IO_TRACE -d DEBUG_FS -e DRM_AMDGPU
> > >
> > >   $ make -skj"$(nproc)" ARCH=3Dx86_64 olddefconfig drivers/gpu/drm/am=
d/amdgpu/../display/amdgpu_dm/amdgpu_dm.o
> > >   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In fun=
ction =E2=80=98amdgpu_dm_crtc_late_register=E2=80=99:
> > >   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6622:9:=
 error: implicit declaration of function =E2=80=98crtc_debugfs_init=E2=80=
=99; did you mean =E2=80=98amdgpu_debugfs_init=E2=80=99? [-Werror=3Dimplici=
t-function-declaration]
> > >    6622 |         crtc_debugfs_init(crtc);
> > >         |         ^~~~~~~~~~~~~~~~~
> > >         |         amdgpu_debugfs_init
> > >   cc1: all warnings being treated as errors
> > >
> > > Contrast that with the current top of your tree:
> > >
> > >   $ git show -s --format=3D'%h ("%s")'
> > >   c435f61d0eb3 ("drm/amd/display: Drop unnecessary guard from DC reso=
urce")
> > >
> > >   $ make -skj"$(nproc)" ARCH=3Dx86_64 mrproper defconfig
> > >
> > >   $ scripts/config -d BLK_DEV_IO_TRACE -d DEBUG_FS -e DRM_AMDGPU
> > >
> > >   $ make -skj"$(nproc)" ARCH=3Dx86_64 olddefconfig drivers/gpu/drm/am=
d/amdgpu/../display/amdgpu_dm/amdgpu_dm.o
> > >
> > >   $ echo $?
> > >   0
> > >
> > > Randy's patch [3] seems like it should resolve the issue just fine but
> > > it needs to be applied to drm-misc-next, not the amdgpu tree. =20
> >=20
> > Thanks for tracking this down.  I think something like the attached
> > patch is cleaner since the whole thing is only valid for debugfs. =20
>=20
> Makes sense! I tested the below patch with and without DEBUG_FS and saw
> no errors.
>=20
> > From b0bcacd86344998e0ca757f89c6c4cd3b6298999 Mon Sep 17 00:00:00 2001
> > From: Alex Deucher <alexander.deucher@amd.com>
> > Date: Wed, 15 Jun 2022 16:40:39 -0400
> > Subject: [PATCH] drm/amdgpu/display: fix build when CONFIG_DEBUG_FS is =
not set
> >=20
> > amdgpu_dm_crtc_late_register is only used when CONFIG_DEBUG_FS
> > so make it dependent on that.
> >=20
> > Fixes: 4cd79f614b50 ("drm/amd/display: Move connector debugfs to drm")
> > Reported-by: Randy Dunlap <rdunlap@infradead.org>
> > Reported-by: Nathan Chancellor <nathan@kernel.org> =20
>=20
> Tested-by: Nathan Chancellor <nathan@kernel.org> # build
>=20
> > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > ---
> >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/driver=
s/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index c9004f7e700d..33cd7a3d4ecb 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -6594,12 +6594,14 @@ dm_crtc_duplicate_state(struct drm_crtc *crtc)
> >  	return &state->base;
> >  }
> > =20
> > +#ifdef CONFIG_DEBUG_FS
> >  static int amdgpu_dm_crtc_late_register(struct drm_crtc *crtc)
> >  {
> >  	crtc_debugfs_init(crtc);
> > =20
> >  	return 0;
> >  }
> > +#endif
> > =20
> >  static inline int dm_set_vupdate_irq(struct drm_crtc *crtc, bool enabl=
e)
> >  {
> > @@ -6693,7 +6695,9 @@ static const struct drm_crtc_funcs amdgpu_dm_crtc=
_funcs =3D {
> >  	.enable_vblank =3D dm_enable_vblank,
> >  	.disable_vblank =3D dm_disable_vblank,
> >  	.get_vblank_timestamp =3D drm_crtc_vblank_helper_get_vblank_timestamp,
> > +#if defined(CONFIG_DEBUG_FS)
> >  	.late_register =3D amdgpu_dm_crtc_late_register,
> > +#endif
> >  };
> > =20
> >  static enum drm_connector_status

OK, I will apply that patch to the merge of the drm-misc tree from
today (until someone actaully applies it to some tree).
--=20
Cheers,
Stephen Rothwell

--Sig_/bgju8kcfbeT8uFOogwBdnTS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmKqaqQACgkQAVBC80lX
0Gwcggf9FBLTZUiwJO9ig0WmWxcqNdVIvnVUNHUD5Cu20ZtR8edh9MasQwu6j9EI
4cJk0mnwG+5YNPs1/0dhL1HWa/RFCbg5UGaE1pAl+SBzoF/ukzGIVPV4xh7lRTbs
MHfpLq+5KROvTQKQkVqsONnCDBIzUVQ99dBxwmsS+Qx4VtMkjWwXSro8NX+JHbqP
0SqudKT+sTUDa9eRYWhC98ceDPwCsVdXc1kI5f68kC37T6euQalqK4LVmlyVMKha
tIf+HlJrrrfnVgb4DCFxthesDymiObGWqWtCSk3hIOR1xlMqylvwThnEo/gIJsPh
mJ0JJQjKySO+SoNTHxZkRvND+lqc7g==
=Fcu+
-----END PGP SIGNATURE-----

--Sig_/bgju8kcfbeT8uFOogwBdnTS--
